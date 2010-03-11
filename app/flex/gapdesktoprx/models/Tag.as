package gapdesktoprx.models {
  import mx.collections.ArrayCollection;
  
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="tags")]
  [Bindable]
  public class Tag extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    [HasMany]
    public var exampleTags:ModelsCollection;
	
	[HasMany(through="exampleTags",type="Example")]
	public var children:ModelsCollection;
    
    public function Tag() {
      super(LABEL);
    }
  }
}
