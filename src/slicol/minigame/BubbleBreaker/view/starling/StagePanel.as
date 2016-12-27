package slicol.minigame.BubbleBreaker.view.starling
{
	import slicol.minigame.BubbleBreaker.command.GameStartCommand;
	import slicol.minigame.BubbleBreaker.event.StartEvent;
	import slicol.minigame.BubbleBreaker.i.IStagePanel;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.RenderTexture;
	import starling.textures.Texture;
	
	public class StagePanel extends Sprite implements IStagePanel
	{
		private var logo:SlicolLogo;

		private var m_bg:Image;
		
		private var m_txtStepScore:TextField;
		private var m_txtStageScore:TextField;
		private var m_txtTotalScore:TextField;
		
		
		public function StagePanel()
		{
			super();
			
			init();
		}
		
		private function init():void
		{
			m_bg = new Image(new RenderTexture(1, 1));
			this.addChild(m_bg);

			
			m_txtStepScore = new TextField(100, 24, "", "黑体");
			m_txtStepScore.text = "步骤分:";
			m_txtStepScore.x = 10;
			m_txtStepScore.y = 10;
			this.addChild(m_txtStepScore);
			
			
			m_txtStageScore = new TextField(100, 24, "", "黑体");
			m_txtStageScore.text = "单局分:";
			m_txtStageScore.x = 10;
			m_txtStageScore.y = 36;
			this.addChild(m_txtStageScore);
			
			m_txtTotalScore = new TextField(100, 24, "", "黑体");
			m_txtTotalScore.text = "总积分:未实现";
			m_txtTotalScore.x = 10;
			m_txtTotalScore.y = 61;
			this.addChild(m_txtTotalScore);
			
			
			
			var lst:Array = GameModel.getInstance().modeList;
			
			for(var i:int = 0; i < lst.length; ++i)
			{
				var btn:Button = new Button(Assets.getTexture("ButtonNormal"), lst[i]);
				btn.name = i.toString();
				btn.addEventListener(TouchEvent.TOUCH, onBtnStart);
				btn.x = 100 + (i % 2) * (btn.width + 5);
				btn.y = 10 + int(i / 2) * (btn.height + 5);
				this.addChild(btn);
			}
			
			
			logo = new SlicolLogo();
			logo.y = 83;
			logo.x = 10;
			this.addChild(logo);
			
			
			var shp:Shape = new Shape;
			shp.graphics.beginFill(0,0);
			shp.graphics.lineStyle(2,0x501616);
			shp.graphics.drawRoundRect(0,0,this.width + 20, this.height + 10, 5,5);
			shp.graphics.endFill();
			shp.cacheAsBitmap = true;
			
			var bmd:BitmapData = new BitmapData(shp.width, shp.height);
			bmd.draw(shp);
			
			m_bg.texture = Texture.fromBitmapData(bmd);

		}
		
		
		public function showStepScore(score:int):void
		{
			m_txtStepScore.text = "步骤分:" + score + "";
		}
		
		public function showStageScore(score:int):void
		{
			m_txtStageScore.text = "单局分:" + score + "";
		}
		
		private function onBtnStart(e:TouchEvent):void
		{
			var btn:Button = e.currentTarget as Button;
			
			var touches:Vector.<Touch> = e.getTouches(btn);
			
			if(touches.length > 0)
			{
				var touch:Touch = touches[0];
				
				if(touch.phase == TouchPhase.BEGAN)
				{
					
					
					var cmd:GameStartCommand = new GameStartCommand;
					var evt:StartEvent = new StartEvent();
					evt.width = 10;
					evt.height = 12;
					evt.typeCount = 5;
					evt.mode = Number(btn.name);
					
					cmd.execute(evt);
				}
			}
			
			

		}
		

	}
}