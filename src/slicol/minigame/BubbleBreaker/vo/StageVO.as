package slicol.minigame.BubbleBreaker.vo
{
	public class StageVO
	{
		public static const SM_STANDARD:int = 0;
		public static const SM_STANDARD_SERIES:int = 1;
		public static const SM_COMPLEX:int = 2;
		public static const SM_COMPLEX_SERIES:int = 3;
		
		
		
		public var typeCount:int = 5;
		public var width:int = 10;
		public var height:int = 10;
		public var data:Array;
		public var mark:Array;
		public var markCount:int;
		public var stageScore:int;
		public var stageRank:int;
		public var stepScore:int;
		public var mode:int = SM_COMPLEX_SERIES;
		
		public function StageVO()
		{
		}

	}
}