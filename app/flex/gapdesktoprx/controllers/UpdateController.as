package gapdesktoprx.controllers {
  import air.update.ApplicationUpdater;
  
  import flash.filesystem.File;
  
  public class UpdateController {
    private static var controller:UpdateController;
    
	public static var updater:ApplicationUpdater = new ApplicationUpdater;
    
    public function UpdateController(enforcer:SingletonEnforcer) {
      super();
    }
    
    public static function get instance():UpdateController {
      if (controller == null) {
		  initialize();  
	  }
      return controller;
    }
    
    public static function initialize():void {
      controller = new UpdateController(new SingletonEnforcer);
		updater.configurationFile = File.applicationDirectory.resolvePath('flex/config/updaterConfig.xml');
    }
  }
}

class SingletonEnforcer {}
