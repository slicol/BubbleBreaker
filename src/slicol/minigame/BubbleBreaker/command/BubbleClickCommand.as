package slicol.minigame.BubbleBreaker.command
{
	import slicol.minigame.BubbleBreaker.event.BubbleEvent;
	import slicol.minigame.BubbleBreaker.event.GameOverEvent;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	
	import flash.events.Event;
	
	public class BubbleClickCommand
	{
		private var model:GameModel = GameModel.getInstance();
		
		
		
		public function BubbleClickCommand()
		{
		}
		
		public function execute(event:Event):void
		{
			var e:BubbleEvent = BubbleEvent(event);
			
			
			if(model.isSelected(e.voBubble.x,e.voBubble.y))
			{
				model.updateScore();
				model.clearSelected();
				if(model.isGameOver())
				{
					var cmd:GameOverCommand = new GameOverCommand;
					cmd.execute(new GameOverEvent());
				}
			}
			else if(!model.isNull(e.voBubble.x,e.voBubble.y))
			{
				model.cancelSelected();
				model.select(e.voBubble.x,e.voBubble.y);
			}
		}
		
		

	}
}