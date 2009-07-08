package gapdesktoprx.overrides
{
	import flash.display.NativeWindowInitOptions;
	import flash.display.StageDisplayState;
	import flash.geom.Rectangle;
	import flash.html.HTMLHost;
	import flash.html.HTMLLoader;
	import flash.html.HTMLWindowCreateOptions;

	public class TlzHost extends HTMLHost
	{
		public function TlzHost(defaultBehaviors:Boolean=false)
		{
			super(defaultBehaviors);
		}
		override public function createWindow(windowCreateOptions:HTMLWindowCreateOptions) : HTMLLoader
		{
			//trace (windowCreateOptions.toString());
            var initOptions:NativeWindowInitOptions = new NativeWindowInitOptions(); 
            var bounds:Rectangle = new Rectangle(windowCreateOptions.x, 
                                                windowCreateOptions.y, 
                                                800, 
                                                600); 
 
            var htmlControl:HTMLLoader = HTMLLoader.createRootWindow(true, initOptions, 
                                        true, bounds); 
 
            htmlControl.htmlHost = new TlzHost(); 
 
            if(windowCreateOptions.fullscreen){ 
                htmlControl.stage.displayState = 
                    StageDisplayState.FULL_SCREEN_INTERACTIVE; 
            } 
 
            return htmlControl; 
		}
	}
}