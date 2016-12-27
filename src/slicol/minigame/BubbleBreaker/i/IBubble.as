package slicol.minigame.BubbleBreaker.i
{
	import slicol.minigame.BubbleBreaker.vo.BubbleVO;

	public interface IBubble extends IDisplayObject
	{
		function set value(data:int):void;
		function get value():int;
		function get mark():Boolean;
		function set mark(data:Boolean):void;
		function set vo(data:BubbleVO):void;
		function get vo():BubbleVO;
	}
}