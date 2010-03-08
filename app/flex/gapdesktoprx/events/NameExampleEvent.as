package gapdesktoprx.events
{
	import flash.events.Event;
	
	
	public class NameExampleEvent extends Event
	{
		public static const NAME_EXAMPLE:String = "nameExample";
		
		private var _name:String;	
		
		public function NameExampleEvent(name:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{			
			super(NAME_EXAMPLE, bubbles, cancelable);
			this.name=name;
		}
		
		override public function clone():Event {
			return new NameExampleEvent(name,bubbles,cancelable);
		}
		
		public function get name():String {
			return _name;
		}
		
		public function set name(name:String):void {
			_name=name;
		}
		
	}
}