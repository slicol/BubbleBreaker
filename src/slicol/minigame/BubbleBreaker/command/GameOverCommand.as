package slicol.minigame.BubbleBreaker.command
{
	import slicol.minigame.BubbleBreaker.event.GameOverEvent;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	
	import flash.events.Event;
	
	public class GameOverCommand
	{
		private var model:GameModel = GameModel.getInstance();
		
		public function GameOverCommand()
		{
		}
		
		public function execute(event:Event):void
		{
			var e:GameOverEvent = GameOverEvent(event);			
			model.showGameOver();
		}
		
				

	}
}