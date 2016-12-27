package slicol.minigame.BubbleBreaker.event
{
	import flash.events.Event;

	public class GameOverEvent extends Event
	{
		public static const EVENT_GAME_OVER:String = "EventGameOver";
		
		public function GameOverEvent(type:String = EVENT_GAME_OVER)
		{
			super(type, false, false);
		}
	}
}