package slicol.minigame.BubbleBreaker.i
{
	public interface IStageView extends IDisplayObject
	{
		function addBubble(bubble:IBubble):void;
		function removeBubble(bubble:IBubble):void;
	}
}