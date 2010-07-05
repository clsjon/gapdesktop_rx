package gapdesktoprx.events
{
	import flash.events.Event;

	import gapdesktoprx.models.Example;

	public class ExampleSelectEvent extends Event
	{
		private var _example:Example;

		public static const EXAMPLE_SELECTED:String="exampleSelected";


		public function ExampleSelectEvent(example:Example, bubbles:Boolean=false, cancelable:Boolean=false)
		{


			super(EXAMPLE_SELECTED, bubbles, cancelable);
			this.example=example;
		}

		override public function clone():Event
		{
			return new ExampleSelectEvent(_example, bubbles, cancelable);
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