package gapdesktoprx.models
{
	import org.restfulx.collections.ModelsCollection;
	import org.restfulx.models.RxModel;

	[Resource(name="submitters")]
	[Bindable]
	public class Submitter extends RxModel
	{
		public static const LABEL:String="name";

		public var name:String="";

		public var email:String="";

		[HasMany]
		public var examples:ModelsCollection;

		public function Submitter()
		{
			super(LABEL);
		}
	}
}
