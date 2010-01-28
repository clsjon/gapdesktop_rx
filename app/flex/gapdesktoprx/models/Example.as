package gapdesktoprx.models {
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="examples")]
  [Bindable]
  public class Example extends RxModel {
    public static const LABEL:String = "descShort";

    public var urlHash:String = "";

    public var descLong:String = "";
	
    public var descShort:String = "";

	public var willFail:String = "";
	
    public var heading:String = "";
	
	[HasMany]
	public var exampleTags:ModelsCollection;
	
	[HasMany(through="exampleTags")]
	public var tags:ModelsCollection;


    [BelongsTo]
    public var submitter:Submitter;
    
    [BelongsTo]
    public var graph:Graph;

    public function Example() {
      super(LABEL);
    }
  }
}
