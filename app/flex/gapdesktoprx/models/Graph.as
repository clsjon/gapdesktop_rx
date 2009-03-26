package gapdesktoprx.models {
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="graphs")]
  [Bindable]
  public class Graph extends RxModel {
    public static const LABEL:String = "downloadKey";

    public var downloadKey:String = "";

    public var downloadedDate:Date = new Date;

    public var localPath:String = "";

    [HasMany]
    public var examples:ModelsCollection;
    
    public function Graph() {
      super(LABEL);
    }
  }
}
