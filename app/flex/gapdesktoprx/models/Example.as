package gapdesktoprx.models {
  import mx.events.FlexEvent;
  
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
	
	[Ignored]
    private var _hash:String = "";
	
	[Bindable(event="hashUpdated")]
	public function set hash (value:String):void {
		_hash = hash;
		this.dispatchEvent(new FlexEvent("hashUpdated");
	}
	
	public function get hash():String {
		return _hash;
	}
	
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
	
	[Ignored]
	public function url():String {
		return 'app:/assets/graphs/' + graph.shortName + "/index.html#" + hash;	
	}

    public function Example() {
      super(LABEL);
    }
  }
}
