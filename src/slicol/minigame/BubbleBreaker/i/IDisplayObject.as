package slicol.minigame.BubbleBreaker.i
{
	public interface IDisplayObject
	{
		function set width(value:Number):void;
		function set height(value:Number):void;
		function get width():Number;
		function get height():Number;
		function get x():Number;
		function get y():Number;
		function set x(value:Number):void;
		function set y(value:Number):void;
		function set visible(value:Boolean):void;
	}
}