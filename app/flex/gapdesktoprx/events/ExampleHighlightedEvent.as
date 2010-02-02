package gapdesktoprx.events
{
	import flash.events.Event;
	
	import gapdesktoprx.models.Example;
	
	public class ExampleHighlightedEvent extends Event
	{
		private var _example:Example;
		
		public static const EXAMPLE_HIGHLIGHTED:String = "exampleHighlighted";
		
		
		public function ExampleHighlightedEvent(example:Example, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			
			
			super(EXAMPLE_HIGHLIGHTED, bubbles, cancelable);
			this.example = example;
		}
		
		override public function clone():Event {
			return new ExampleHighlightedEvent(example,bubbles,cancelable);
		}
		
		public function get example():Example {
			return _example;
		}
		
		public function set example(example:Example):void {
			trace("Example in highlight event: " + example.urlHash);
			_example = example;
		}
		
	}
}