package gapdesktoprx.models {
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="graphs")]
  [Bindable]
  public class Graph extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    public var collectionKey:String = "";

    public var downloadedDate:Date = new Date;

    public var shortName:String = "";
	
	public var defaultGraph:String = "";
	
	public var skinColor:String = "";
	

    [HasMany]
    public var examples:ModelsCollection;
    
    public function Graph() {
      super(LABEL);
    }
  }
}
