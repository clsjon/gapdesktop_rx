package gapdesktoprx.models {
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="tags")]
  [Bindable]
  public class Tag extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    [HasMany]
    public var exampleTags:ModelsCollection;
	
	[HasMany(through="exampleTags")]
	public var examples:ModelsCollection;
    
    public function Tag() {
      super(LABEL);
    }
  }
}
