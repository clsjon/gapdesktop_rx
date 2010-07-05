package gapdesktoprx.utils
{
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	import org.wvxvws.lcbridge.AVM1Command;
	import org.wvxvws.lcbridge.AVM1Event;
	import org.wvxvws.lcbridge.AVM1Loader;
	import org.wvxvws.lcbridge.AVM1Protocol;

	public class AVM1Test extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Private properties
		//
		//--------------------------------------------------------------------------


		private var _loader:AVM1Loader=new AVM1Loader();

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		public function AVM1Test()
		{
			super();
			var loaderContext:LoaderContext=new LoaderContext();
			loaderContext.allowLoadBytesCodeExecution=true;
			_loader.load(new URLRequest('app:/assets/graphs/world/trendalyzer.swf'), loaderContext);
			_loader.addEventListener(AVM1Event.LC_COMMAND, commandHandler);
			_loader.addEventListener(AVM1Event.LC_CUSTOM, commandHandler);
			_loader.addEventListener(AVM1Event.LC_DISCONNECT, commandHandler);
			_loader.addEventListener(AVM1Event.LC_ERROR, commandHandler);
			_loader.addEventListener(AVM1Event.LC_LOADED, commandHandler);
			_loader.addEventListener(AVM1Event.LC_READY, commandHandler);
			_loader.addEventListener(AVM1Event.LC_RECEIVED, commandHandler);
			_loader.addEventListener(AVM1Event.LC_RECONNECT, commandHandler);
			addChild(_loader);
		}

		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------

		private function commandHandler(event:AVM1Event):void
		{
			trace("--------------", event.type);
			if (event.type == AVM1Event.LC_LOADED)
			{
				_loader.connection.sendCommand(new AVM1Command(AVM1Command.CALL_METHOD, AVM1Protocol.CONTENT, "createTextField", null, null, ["_txt", 1, 10, 10, 100, 100]));
				_loader.connection.sendCommand(new AVM1Command(AVM1Command.SET_PROPERTY, "_loaderContent._txt", null, "text", "Hello World!"));
			}
		}
	}
}