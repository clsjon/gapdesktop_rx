package gapdesktoprx.events
{
	import flash.events.Event;
	import gapdesktoprx.models.Example
	
	public class HashChangeEvent extends Event
	{
		public function HashChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			public static const STATUS_CHANGE:String = "statusChange";
			
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new HashChangeEvent(type,bubbles,cancelable);
		}
		
	}
}