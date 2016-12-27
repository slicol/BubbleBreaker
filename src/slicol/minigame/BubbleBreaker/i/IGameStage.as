package slicol.minigame.BubbleBreaker.i
{
	public interface IGameStage
	{
		function load(w:int,h:int,bubbles:Array):void;
		function setBubble(x:int,y:int,value:int):void;
		function markBubble(x:int,y:int, mark:Boolean):void;
		function showStepScore(score:int):void;
		function showStageScore(score:int):void;
		function showGameOver(stageScore:int,stageRank:int,stageMode:int):void;

	}
}