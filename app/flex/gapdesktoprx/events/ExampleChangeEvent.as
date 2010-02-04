package gapdesktoprx.events
{
	import flash.events.Event;
	
	import gapdesktoprx.models.Example;
	
	public class ExampleChangeEvent extends Event
	{
		private var _example:Example;
		
		public static const EXAMPLE_CHANGED:String = "exampleChanged";
		
		
		public function ExampleChangeEvent(example:Example, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			
			
			super(EXAMPLE_CHANGED, bubbles, cancelable);
			this.example = example;
		}
		
		override public function clone():Event {
			return new ExampleChangeEvent(example,bubbles,cancelable);
		}
		
		public function get example():Example {
			return _example;
		}
		
		public function set example(example:Example):void {
			trace("Example in event has url hash: " + example.hash);
			_example = example;
		}
		
	}
}