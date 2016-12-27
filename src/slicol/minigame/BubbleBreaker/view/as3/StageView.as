package slicol.minigame.BubbleBreaker.view.as3
{
	import slicol.minigame.BubbleBreaker.i.IBubble;
	import slicol.minigame.BubbleBreaker.i.IStageView;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class StageView extends Sprite implements IStageView
	{
		public function StageView()
		{
			super();
		}
		
		public function addBubble(bubble:IBubble):void
		{
			this.addChild(bubble as DisplayObject);
		}
		
		public function removeBubble(bubble:IBubble):void
		{
			this.removeChild(bubble as DisplayObject);
		}
	}
}