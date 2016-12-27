package slicol.minigame.BubbleBreaker.vo
{
	public class BubbleVO
	{
		public var value:int;
		public var x:int;
		public var y:int;
		public var mark:Boolean = false;
		
		public function BubbleVO(x:int,y:int,v:int):void
		{
			this.x = x;
			this.y = y;
			this.value = v;
		}
		
	}
}