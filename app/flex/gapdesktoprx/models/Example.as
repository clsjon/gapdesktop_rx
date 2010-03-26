package gapdesktoprx.models {
	import gapdesktoprx.utils.MiscUtils;
	
	import org.restfulx.collections.ModelsCollection;
	import org.restfulx.models.RxModel;
	
	[Resource(name="examples")]
	[Bindable]
	public class Example extends RxModel {
		public static const LABEL:String = "name";
		
		public var name:String = "";
		
		public var content:String = "";
		
		public var introText:String = "";
		
		public var introImage:String = "";
		
		public var hash:String = "";
		
		public var created:Date = new Date;
		
		public var updated:Date = new Date;
		
		public var userGenerated:Boolean = false;
		
		[HasMany]
		public var exampleTags:ModelsCollection;
		
		[HasMany(through="exampleTags")]
		public var tags:ModelsCollection;
		
		[BelongsTo]
		public var submitter:Submitter;
		
		[BelongsTo]
		public var graph:Graph;
		
		[BelongsTo(referAs="children")]
		public var mainTag:Tag;
		
		[Ignored]
		public function get url():String {
			if (graph && hash) {
				return 'app:/assets/graphs/' + graph.shortName + "/index.html#" + hash;
			} else {
				return null;
			}
		}
		
		[Ignored]
		public function get params():Object {
			return MiscUtils.paramsFromHash(hash);
		}
		
		[Ignored]
		public function hashIsNewGraph(newHash:String):Boolean {
			var newParams:Object = MiscUtils.paramsFromHash(newHash);
			var oldParams:Object = params;
			return !(newParams.iid[0]==oldParams.iid[0] && newParams.iid[1]==oldParams.iid[1] && newParams.iid[2]==oldParams.iid[2]);
			
		}
		
		
		
		public function Example() {
			super(LABEL);
		}
	}
}
