package gapdesktoprx.models {
  import org.restfulx.models.RxModel;
  
  [Resource(name="submitters")]
  [Bindable]
  public class Submitter extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    public var email:String = "";

    public function Submitter() {
      super(LABEL);
    }
  }
}
