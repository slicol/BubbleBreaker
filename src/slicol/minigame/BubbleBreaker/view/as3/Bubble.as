package slicol.minigame.BubbleBreaker.view.as3
{
	import slicol.minigame.BubbleBreaker.command.BubbleClickCommand;
	import slicol.minigame.BubbleBreaker.event.BubbleEvent;
	import slicol.minigame.BubbleBreaker.i.IBubble;
	import slicol.minigame.BubbleBreaker.vo.BubbleVO;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;

	
	public class Bubble extends Sprite implements IBubble
	{
		private var _vo:BubbleVO;
		private var img:Bitmap;
		private var bg:Bitmap;
		
		public function Bubble()
		{
			super();
			
			init();
		}
		
		private function init():void
		{
			bg = new Bitmap(AssetsBubble.getBitmapData("bg"));
			this.addChild(bg);
			
			bg.visible = false;
			
			img = new Bitmap(AssetsBubble.getBitmapData("bubble1"));
			this.addChild(img);
			img.smoothing = true;
			
			//this.addEventListener(TouchEvent.TOUCH_BEGIN, onClick);
			this.addEventListener(MouseEvent.CLICK , onClick);
			
			this.updateValue(0);
			
			this.scaleX = this.scaleY = 1.25;
		}
		

		
		public function set value(data:int):void
		{
			this._vo.value = data;
			this.updateValue(this._vo.value);
		}
		
		public function get value():int
		{
			return this._vo.value;
		}
		
		public function get mark():Boolean
		{
			return this._vo.mark;
		}
		
		
		public function set mark(data:Boolean):void
		{
			this._vo.mark = data;
			if(data)
			{
				bg.visible = true;
				img.alpha = 0.5;
			}
			else
			{
				bg.visible = false;
				img.alpha = 1;
			}
		}
		
		
		public function set vo(data:BubbleVO):void
		{
			this._vo = data;
			this.updateValue(this._vo.value);
		}
		
		public function get vo():BubbleVO
		{
			return this._vo;
		}
		

		
		private function updateValue(data:int):void
		{
			this.alpha = 1;
			this.visible = true;
			
			if(data == 0)
			{
				this.visible = false;
			}
			else
			{
				this.img.bitmapData = AssetsBubble.getBitmapData("bubble" + data);
				img.smoothing = true;
			}
		}
		
		private function onClick(e:Event):void
		{
			var cmd:BubbleClickCommand = new BubbleClickCommand;
			cmd.execute(new BubbleEvent(BubbleEvent.EVENT_BUBBLE_CLICK, this._vo));
		}
		
		
	}
}