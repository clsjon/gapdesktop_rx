package gapdesktoprx.models {
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="examples")]
  [Bindable]
  public class Example extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    [HasMany]
    public var exampleTags:ModelsCollection;
	
	[HasMany(through="exampleTags")]
	public var examples:ModelsCollection;
    
    [BelongsTo]
    public var graph:Graph;

    public function Example() {
      super(LABEL);
    }
  }
}
