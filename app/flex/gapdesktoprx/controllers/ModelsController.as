package gapdesktoprx.controllers {
	import gapdesktoprx.models.Example;
	import gapdesktoprx.models.ExampleTag;
	import gapdesktoprx.models.Tag;
	
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
		
		public var defaultExample:Example;
		
		public var tags:RxCollection;
		
		public var usedMainTags:RxCollection;
		
		public var graphs:RxCollection;
		
		public var submitters:RxCollection;
		
		public function ModelsController(enforcer:SingletonEnforcer) {
			Rx.models.addEventListener(CacheUpdateEvent.ID, onCacheUpdate);
			Rx.models.index(Example,refreshExampleCollections);
			Rx.models.index(ExampleTag,refreshTagCollections);
		}
		
		private function refreshExampleCollections(obj:Object):void {
			examples = Rx.models.cached(Example);
			userExamples = Rx.filter(Rx.models.cached(Example), filterUserExamples);
			gapExamples = Rx.filter(Rx.models.cached(Example), filterGapExamples);
			//defaultExample = Rx.filter(Rx.models.cached(Example), filterGapExamples)[0] as Example;
		}
		
		private function refreshTagCollections(obj:Object):void {
			tags = Rx.models.cached(Tag);
			usedMainTags = Rx.filter(Rx.models.cached(Tag), filterUsedMainTags);
		}
		
		private function onCacheUpdate(event:CacheUpdateEvent):void {
			trace('cache update for ' + event.fqn);
			if (event.isFor(Example)) {
				examples = Rx.models.cached(Example);
				userExamples = Rx.filter(Rx.models.cached(Example), filterUserExamples);
				gapExamples = Rx.filter(Rx.models.cached(Example), filterGapExamples);
				//defaultExample = Rx.filter(Rx.models.cached(Example), filterGapExamples)[0] as Example;
			} else if (event.isFor(Tag)) {
				for each (var tag:Tag in event.data) {
					//trace (tag.name + ' with examples ' + tag.exampleTags.length);
				}
			
			
			} else {
				var prop:String = RxUtils.toCamelCase(Rx.models.state.controllers[event.fqn]);
				if (hasOwnProperty(prop)) {
					this[prop] = Rx.models.cache.data[event.fqn];
				}
			}
		}
		
		private function filterUsedMainTags(tag:Tag):Boolean {
			return (tag.children != null);
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