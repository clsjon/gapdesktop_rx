package gapdesktoprx.controllers {
	import gapdesktoprx.models.Example;
	
	import org.restfulx.Rx;
	import org.restfulx.collections.RxCollection;
	import org.restfulx.events.CacheUpdateEvent;
	import org.restfulx.utils.RxUtils;
	
	
	[Bindable]
	public class ModelsController {
		
		private static var controller:ModelsController;
		
		public var examples:RxCollection;
		
		public var userExamples:RxCollection;
		
		public var gapExamples:RxCollection;
		
		public var tags:RxCollection;
		
		public var graphs:RxCollection;
		
		public var submitters:RxCollection;
		
		public function ModelsController(enforcer:SingletonEnforcer) {
			Rx.models.addEventListener(CacheUpdateEvent.ID, onCacheUpdate);
			Rx.models.index(Example);
			examples = Rx.models.cached(Example);
			userExamples = Rx.filter(Rx.models.cached(Example), filterUserExamples);
			gapExamples = Rx.filter$(Rx.models.cached(Example), filterGapExamples);
		}
		
		private function onCacheUpdate(event:CacheUpdateEvent):void {
			trace('cache update');
			if (event.isFor(Example)) {
				examples = Rx.models.cached(Example);
				userExamples = Rx.filter(Rx.models.cached(Example), filterUserExamples);
				gapExamples = Rx.filter$(Rx.models.cached(Example), filterGapExamples);
			}
//			var prop:String = RxUtils.toCamelCase(Rx.models.state.controllers[event.fqn]);
//			if (hasOwnProperty(prop)) {
//				this[prop] = Rx.models.cache.data[event.fqn];
//			}
		}
		
		private function filterUserExamples(example:Example):Boolean {
			return example.userGenerated;
		}
		
		private function filterGapExamples(example:Example):Boolean {
			return !example.userGenerated;
		}
		
		
		public static function get instance():ModelsController {
			initialize();
			return controller;
		}
		
		public static function initialize():void {
			if (!controller) controller = new ModelsController(new SingletonEnforcer);      
		}
		
		public static function reset():void {
			controller = null;  
		}
	}
}

class SingletonEnforcer {}