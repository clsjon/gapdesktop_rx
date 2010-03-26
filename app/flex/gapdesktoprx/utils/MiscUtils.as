package gapdesktoprx.utils
{
	import flash.utils.describeType;
	
	import mx.collections.ArrayCollection;
	
	public class MiscUtils
	{
		public static function copyData(source:Object, destination:Object, exceptProperties:ArrayCollection):void {
			
			//copies data from commonly named properties and getter/setter pairs
			if((source) && (destination)) {
				
				try {
					var sourceInfo:XML = describeType(source);
					var prop:XML;
					
					for each(prop in sourceInfo.variable) {
						trace ('prop name: ' + prop.@name);
						if((!exceptProperties.contains(prop.@name)) && (destination.hasOwnProperty(prop.@name))) {
							destination[prop.@name] = source[prop.@name];
						}
						
					}
					
					for each(prop in sourceInfo.accessor) {
						if(prop.@access == "readwrite") {
							if((!exceptProperties.contains(prop.@name)) && (destination.hasOwnProperty(prop.@name))) {
								destination[prop.@name] = source[prop.@name];
							}
							
						}
					}
				}
				catch (err:Object) {
					;
				}
			}
		}
		
		public static function paramsFromHash(hash:String):Object {
			var params:Object = new Object();
			for each (var param:String in hash.split(";")) {
				var name_val:Array= param.split("=");
				if (params[name_val[0]] is Array) {
					(params[name_val[0]] as Array).push(name_val[1]);
				} else {
					params[name_val[0]] = new Array(name_val[1]);						
				}
			}
			return params;
		}
		
		
	}
}