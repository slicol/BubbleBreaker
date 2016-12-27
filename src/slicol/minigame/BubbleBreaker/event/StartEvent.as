package slicol.minigame.BubbleBreaker.event
{
	import flash.events.Event;

	public class StartEvent extends Event
	{
		public static const EVENT_GAME_START:String = "EventGameStart";
		
		public var width:int;
		public var height:int;
		public var typeCount:int;
		public var mode:int;
		
		public function StartEvent(type:String = EVENT_GAME_START)
		{
			super(type, false, false);
		}
	}
}