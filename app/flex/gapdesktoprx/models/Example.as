package gapdesktoprx.models {
  import org.restfulx.models.RxModel;
  
  [Resource(name="examples")]
  [Bindable]
  public class Example extends RxModel {
    public static const LABEL:String = "urlHash";

    public var urlHash:String = "";

    public var descLong:String = "";

    public var descShort:String = "";

    public var heading:String = "";

    [BelongsTo]
    public var submitter:Submitter;

    public function Example() {
      super(LABEL);
    }
  }
}
