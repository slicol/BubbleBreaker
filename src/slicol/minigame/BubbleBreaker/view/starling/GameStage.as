package slicol.minigame.BubbleBreaker.view.starling
{
	import slicol.minigame.BubbleBreaker.i.IGameStage;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	import slicol.minigame.BubbleBreaker.view.base.GameStageBase;
	import slicol.minigame.BubbleBreaker.vo.BubbleVO;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class GameStage extends Sprite 
	{
		private var base:GameStageBase;
		
		public function GameStage()
		{
			super();
			
			init();
		}
		
		
		private function init():void
		{
			var stageView:StageView = new StageView;
			this.addChild(stageView);
			
			var stagePanel:StagePanel = new StagePanel;
			this.addChild(stagePanel);
			
			var winGameOver:GameOver = new GameOver;
			this.addChild(winGameOver);
			
			base = new GameStageBase();
			base.init(stageView, stagePanel, winGameOver, Bubble);
			
			GameModel.getInstance().view = base;
		}
		
		
		
		

	}
}