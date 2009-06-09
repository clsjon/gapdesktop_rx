package gapdesktoprx.controllers {
  import gapdesktoprx.models.*;
  
  import mx.core.Application;
  import mx.core.FlexGlobals;
  
  import org.restfulx.Rx;
  import org.restfulx.controllers.RxApplicationController;
  import org.restfulx.utils.RxUtils;

  public class ApplicationController extends RxApplicationController {
    private static var controller:ApplicationController;
    
    public static var models:Array = [Example, Graph, Submitter]; /* Models */
    
    public static var commands:Array = []; /* Commands */
    
    public function ApplicationController(enforcer:SingletonEnforcer, 
      extraServices:Array, defaultServiceId:int = -1) {
      super(commands, models, extraServices, defaultServiceId);
    }
    
    public static function get instance():ApplicationController {
      if (controller == null) initialize();
      return controller;
    }
    
    public static function initialize(extraServices:Array = null, 
      defaultServiceId:int = -1, airDatabaseName:String = null):void {
      if (!RxUtils.isEmpty(airDatabaseName)) Rx.airDatabaseName = airDatabaseName;
      controller = new ApplicationController(new SingletonEnforcer, 
        extraServices, defaultServiceId);
			Rx.sessionToken = FlexGlobals.topLevelApplication.parameters.session_token;
			Rx.authenticityToken = FlexGlobals.topLevelApplication.parameters.authenticity_token;
    }
  }
}

class SingletonEnforcer {}
