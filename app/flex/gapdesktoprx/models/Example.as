package gapdesktoprx.models {
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
	public function url():String {
		if (graph && hash) {
		return 'app:/assets/graphs/' + graph.shortName + "/index.html#" + hash;
		} else {
			return null;
		}
	}

    public function Example() {
      super(LABEL);
    }
  }
}
