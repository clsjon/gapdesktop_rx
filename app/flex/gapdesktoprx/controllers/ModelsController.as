package gapdesktoprx.controllers {
	import gapdesktoprx.models.Example;
	import gapdesktoprx.models.ExampleTag;
	import gapdesktoprx.models.Tag;
	import gapdesktoprx.utils.FirstRunUtilities;
	
	import mx.collections.ArrayCollection;
	
	import org.restfulx.Rx;
	import org.restfulx.collections.ModelsCollection;
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
		
		public var usedMainTags:ArrayCollection;
		
		public var graphs:RxCollection;
		
		public var submitters:RxCollection;
		
		public function ModelsController(enforcer:SingletonEnforcer) {
			Rx.models.addEventListener(CacheUpdateEvent.ID, onCacheUpdate);
			Rx.models.index(Example,refreshExampleCollections);
			Rx.models.index(ExampleTag,refreshTagCollections);
		}
		
		private function refreshExampleCollections(obj:Object = null):void {
			examples = Rx.models.cached(Example);
			if (examples.length == 0) {
				FirstRunUtilities.populateDatabase();
			}
			userExamples = Rx.filter(Rx.models.cached(Example), filterUserExamples);
			gapExamples =  Rx.filter(Rx.models.cached(Example), filterGapExamples);
			var defaultExamples:RxCollection = gapExamples.itemsWithPropertyValue("name","Basic Gapminder World graph");
			if (defaultExamples.length > 0) {
				defaultExample = defaultExamples[0];
				gapExamples.addItemAt(defaultExample,0);
				
				
			} else {
				defaultExample = gapExamples[0] as Example;
				gapExamples.addItemAt(defaultExample,0);
			}
		}
		
		private function refreshTagCollections(obj:Object = null):void {
			tags = Rx.models.cached(Tag);
			
			usedMainTags = new ArrayCollection( Rx.filter(Rx.models.cached(Tag), filterUsedMainTags).source);
			 
			usedMainTags.addItemAt(defaultExample,0);
		}
		
		private function onCacheUpdate(event:CacheUpdateEvent):void {
//			trace('cache update for ' + event.fqn);
			if (event.isFor(Example)) {
				refreshExampleCollections();
				//defaultExample = Rx.filter(Rx.models.cached(Example), filterGapExamples)[0] as Example;
			} else if (event.isFor(ExampleTag)) {
				refreshTagCollections();
			
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
		
		private function filterDefaultExample(example:Example):Boolean {
			return (example.name.slice(0,5) == "Wealt");
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