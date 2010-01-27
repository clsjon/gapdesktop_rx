package gapdesktoprx.events
{
	import flash.events.Event;
	
	public class ExampleHighlightEvent extends Event
	{
		public function ExampleHighlightEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public static const EXAMPLE_HIGHLIGHTED:String = "exampleHighlighted";
		
		override public function clone():Event {
			return new ExampleHighlightEvent(type,bubbles,cancelable);
		}
	}
}