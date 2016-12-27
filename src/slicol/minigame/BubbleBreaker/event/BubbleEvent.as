package slicol.minigame.BubbleBreaker.event
{
	import slicol.minigame.BubbleBreaker.vo.BubbleVO;
	
	import flash.events.Event;

	public class BubbleEvent extends Event
	{
		public static const EVENT_BUBBLE_CLICK:String = "EventBubbleClick";
		
		public var voBubble:BubbleVO;
		
		public function BubbleEvent(type:String, vo:BubbleVO)
		{
			super(type, false, false);
			this.voBubble = vo;
		}
		
	}
}