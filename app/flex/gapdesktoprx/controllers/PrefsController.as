package gapdesktoprx.controllers
{
	import com.adobe.serialization.json.JSON;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	import gapdesktoprx.events.NameExampleEvent;
	import gapdesktoprx.prefs.Preferences;

	import mx.utils.ObjectUtil;

	public class PrefsController extends EventDispatcher
	{

		private static var controller:PrefsController;

		public var firstRun:Boolean=false;

		public function PrefsController(enforcer:SingletonEnforcer)
		{
			firstRun=loadPrefs();
		}

		private var _prefs:Preferences;


		private function loadPrefs():Boolean
		{
			var prefsFile:File=File.applicationStorageDirectory.resolvePath('prefs.json');
			if (prefsFile.exists)
			{
				var fileStream:FileStream=new FileStream();
				fileStream.open(prefsFile, FileMode.READ);
				var str:String=fileStream.readUTFBytes(fileStream.bytesAvailable);

				fileStream.close();
				var objPrefs:Object=JSON.decode(str) as Object;
				_prefs=new Preferences;
				_prefs.autocheck=objPrefs.autocheck;
				_prefs.username=objPrefs.username;
				return false;
			}
			else
			{
				_prefs=new Preferences();
				savePrefs();
				return true;
			}
		}

		private function savePrefs():void
		{
			var prefsFile:File=File.applicationStorageDirectory.resolvePath('prefs.json');
			var fileStream:FileStream=new FileStream();
			fileStream.open(prefsFile, FileMode.WRITE);
			fileStream.writeUTFBytes(JSON.encode(_prefs));
			trace(JSON.encode(_prefs));
			fileStream.close();
		}

		[Bindable(event="prefsChanged")]
		public function set autocheck(value:Boolean):void
		{
			_prefs.autocheck=value;
			savePrefs();
			dispatchEvent(new Event("prefsChanged"));

		}

		public function get autocheck():Boolean
		{
			return _prefs.autocheck;
		}

		public static function get instance():PrefsController
		{
			initialize();
			return controller;
		}

		public static function initialize():void
		{
			if (!controller)
				controller=new PrefsController(new SingletonEnforcer);
		}

	}
}

class SingletonEnforcer
{
}