package slicol.minigame.BubbleBreaker.command
{
	import slicol.minigame.BubbleBreaker.event.StartEvent;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	
	import flash.events.Event;
	
	public class GameStartCommand
	{
		private var model:GameModel = GameModel.getInstance();
		
		public function GameStartCommand()
		{
		}
		
		public function execute(event:Event):void
		{
			var e:StartEvent = StartEvent(event);			
			model.init(e.width,e.height,e.typeCount,e.mode);
			model.start();
		}

	}
}