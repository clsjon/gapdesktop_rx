package gapdesktoprx.overrides
{
	import flash.display.NativeWindowInitOptions;
	import flash.display.StageDisplayState;
	import flash.geom.Rectangle;
	import flash.html.HTMLHost;
	import flash.html.HTMLLoader;
	import flash.html.HTMLWindowCreateOptions;
	import flash.net.URLRequest;

	import mx.utils.ObjectUtil;

	import org.restfulx.services.air.AIRServiceProvider;

	public class TlzHost extends HTMLHost
	{
		public function TlzHost(defaultBehaviors:Boolean=false)
		{
			super(defaultBehaviors);
		}

		public const touURL:String="http://www.gapminder.org/world/tou.html";

		override public function updateLocation(locationURL:String):void
		{
			if (!(catalyst.online) && locationURL == touURL)
			{
				htmlLoader.load(new URLRequest("app:/assets/text/tou2.html"));
			}
		}

		override public function createWindow(windowCreateOptions:HTMLWindowCreateOptions):HTMLLoader
		{

			trace(htmlLoader.location);
			trace(ObjectUtil.toString(windowCreateOptions));
			var initOptions:NativeWindowInitOptions=new NativeWindowInitOptions();
			var bounds:Rectangle=new Rectangle(windowCreateOptions.x, windowCreateOptions.y, 800, 600);

			var htmlControl:HTMLLoader=HTMLLoader.createRootWindow(true, initOptions, true, bounds);

			htmlControl.htmlHost=new TlzHost();

			if (windowCreateOptions.fullscreen)
			{
				htmlControl.stage.displayState=StageDisplayState.FULL_SCREEN_INTERACTIVE;
			}

			return htmlControl;
		}
	}
}