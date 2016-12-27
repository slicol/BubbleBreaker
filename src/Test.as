package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Test extends Sprite
	{
		public function Test()
		{
			super();
			
			this.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event):void
		{
			trace("aaaa");
		}
	}
}