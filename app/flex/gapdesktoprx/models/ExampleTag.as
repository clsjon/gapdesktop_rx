package gapdesktoprx.models
{
	import org.restfulx.models.RxModel;

	[Resource(name="example_tags")]
	[Bindable]
	public class ExampleTag extends RxModel
	{
		public static const LABEL:String="id";

		[BelongsTo]
		public var example:Example;

		[BelongsTo]
		public var tag:Tag;

		public function ExampleTag()
		{
			super(LABEL);
		}
	}
}
