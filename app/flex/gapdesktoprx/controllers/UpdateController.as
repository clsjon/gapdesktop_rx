package gapdesktoprx.controllers {
  import gapdesktoprx.models.*;
  
  import mx.core.FlexGlobals;
  
  import org.restfulx.Rx;
  import org.restfulx.utils.RxUtils;

  public class UpdateController {
    private static var controller:UpdateController;
    
    
    public function UpdateController(enforcer:SingletonEnforcer) {
      super();
    }
    
    public static function get instance():UpdateController {
      if (controller == null) initialize();
      return controller;
    }
    
    public static function initialize(updateURL:String):void {
      controller = new UpdateController(new SingletonEnforcer, 
        extraServices, defaultServiceId);
			
		
    }
  }
}

class SingletonEnforcer {}
