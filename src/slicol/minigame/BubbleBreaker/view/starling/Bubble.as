package slicol.minigame.BubbleBreaker.view.starling
{
	import slicol.minigame.BubbleBreaker.command.BubbleClickCommand;
	import slicol.minigame.BubbleBreaker.event.BubbleEvent;
	import slicol.minigame.BubbleBreaker.i.IBubble;
	import slicol.minigame.BubbleBreaker.vo.BubbleVO;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.extensions.ParticleDesignerPS;
	import starling.extensions.ParticleSystem;
	
	public class Bubble extends Sprite implements IBubble
	{
		private var _vo:BubbleVO;
		private var img:Image;
		private var bg:Image;
		private var ps:ParticleDesignerPS;
		
		public function Bubble()
		{
			super();
			
			init();
		}
		
		private function init():void
		{
			bg = new Image(AssetsBubble.getTexture("bg"));
			this.addChild(bg);
			bg.visible = false;
			
			
			ps = new ParticleDesignerPS(AssetsPS.getConfig("FireConfig"), AssetsPS.getTexture("FireParticle"));
			ps.emitterX = bg.width/2;
			ps.emitterY = bg.height/2;
			Starling.juggler.add(ps);
			this.addChild(ps);
			
			
			img = new Image(AssetsBubble.getTexture("bubble1"));
			this.addChild(img);
			
			this.addEventListener(TouchEvent.TOUCH , onClick);
			
			this.updateValue(0);
			
			this.scaleX = this.scaleY = 1.25;
			
		}
		

		
		public function set value(data:int):void
		{
			var last:int = this._vo.value;
			this._vo.value = data;
			this.updateValue(this._vo.value);
			
			if(data == 0 && last != 0)
			{
				ps.start(1);
			}
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
				this.img.visible = false;
				this.bg.visible = false;
			}
			else
			{
				this.img.visible = true;
				this.img.texture = AssetsBubble.getTexture("bubble" + data);
			}
		}
		
		private function onClick(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(this);
			
			if(touches.length > 0)
			{
				var touch:Touch = touches[0];
				
				if(touch.phase == TouchPhase.BEGAN)
				{
					var cmd:BubbleClickCommand = new BubbleClickCommand;
					cmd.execute(new BubbleEvent(BubbleEvent.EVENT_BUBBLE_CLICK, this._vo));
				}
			}
		}
		
		
	}
}