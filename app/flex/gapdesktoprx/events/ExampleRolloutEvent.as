package gapdesktoprx.events
{
	import flash.events.Event;

	public class ExampleRolloutEvent extends Event
	{

		public static const EXAMPLE_ROLLOUT:String="exampleRollout";


		public function ExampleRolloutEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{


			super(EXAMPLE_ROLLOUT, bubbles, cancelable);

		}

		override public function clone():Event
		{
			return new ExampleRolloutEvent(bubbles, cancelable);
		}


	}
}