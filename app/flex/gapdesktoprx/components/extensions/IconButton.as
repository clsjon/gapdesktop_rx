package gapdesktoprx.components.extensions
{
	import spark.components.Button;

	//icons
	[Style(name="iconUp", type="*")]
	[Style(name="iconOver", type="*")]
	[Style(name="iconDown", type="*")]
	[Style(name="iconDisabled", type="*")]
	//paddings
	[Style(name="paddingLeft", type="Number")]
	[Style(name="paddingRight", type="Number")]
	[Style(name="paddingTop", type="Number")]
	[Style(name="paddingBottom", type="Number")]
	public class IconButton extends Button
	{
		public function IconButton()
		{
			super();
		}
	}
}

