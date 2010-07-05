package gapdesktoprx.events
{
	import flash.events.Event;

	import gapdesktoprx.models.Example;

	public class ExampleRolloverEvent extends Event
	{
		private var _example:Example;

		public static const EXAMPLE_ROLLOVER:String="exampleRollover";


		public function ExampleRolloverEvent(example:Example, bubbles:Boolean=false, cancelable:Boolean=false)
		{


			super(EXAMPLE_ROLLOVER, bubbles, cancelable);
			this.example=example;
		}

		override public function clone():Event
		{
			return new ExampleRolloverEvent(example, bubbles, cancelable);
		}

		public function get example():Example
		{
			return _example;
		}

		public function set example(example:Example):void
		{
			_example=example;
		}

	}
}