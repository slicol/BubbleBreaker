package slicol.minigame.BubbleBreaker.view.as3
{
	import slicol.minigame.BubbleBreaker.command.GameStartCommand;
	import slicol.minigame.BubbleBreaker.event.StartEvent;
	import slicol.minigame.BubbleBreaker.i.IStagePanel;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	import slicol.minigame.BubbleBreaker.view.base.TextButton;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	
	public class StagePanel extends Sprite implements IStagePanel
	{
		private var logo:SlicolLogo;
		
		private var m_bg:Shape;
		
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
			m_bg = new Shape;
			this.addChild(m_bg);

			
			var fmt:TextFormat = new TextFormat;
			fmt.font = "黑体";
			
			m_txtStepScore = new TextField();
			m_txtStepScore.text = "步骤分:";
			m_txtStepScore.selectable = false;
			m_txtStepScore.x = 10;
			m_txtStepScore.y = 10;
			m_txtStepScore.setTextFormat(fmt);
			m_txtStepScore.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtStepScore);
			
			
			m_txtStageScore = new TextField();
			m_txtStageScore.text = "单局分:";
			m_txtStageScore.selectable = false;
			m_txtStageScore.x = 10;
			m_txtStageScore.y = 36;
			m_txtStageScore.setTextFormat(fmt);
			m_txtStageScore.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtStageScore);
			
			m_txtTotalScore = new TextField();
			m_txtTotalScore.text = "总积分:未实现";
			m_txtTotalScore.selectable = false;
			m_txtTotalScore.x = 10;
			m_txtTotalScore.y = 61;
			m_txtTotalScore.setTextFormat(fmt);
			m_txtTotalScore.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtTotalScore);
			

			
			var lst:Array = GameModel.getInstance().modeList;
			
			for(var i:int = 0; i < lst.length; ++i)
			{
				var btn:TextButton = new TextButton(i, Assets.getBitmapData("ButtonNormal"), lst[i]);
				btn.enabled = true;
				btn.addEventListener(MouseEvent.CLICK, onBtnStart);
				btn.x = 100 + (i % 2) * (btn.width + 5);
				btn.y = 10 + int(i / 2) * (btn.height + 5);
				this.addChild(btn);
			}
			
			
			logo = new SlicolLogo();
			logo.y = 83;
			logo.x = 10;
			this.addChild(logo);
			
			m_bg.graphics.beginFill(0,0);
			m_bg.graphics.lineStyle(2,0x501616);
			m_bg.graphics.drawRoundRect(0,0,this.width + 20, this.height + 10, 5,5);
			m_bg.graphics.endFill();
			m_bg.cacheAsBitmap = true;
		}
		
		

		
		public function showStepScore(score:int):void
		{
			m_txtStepScore.htmlText = "步骤分:<font color='#ff0000'>" + score + "</font>";
		}
		
		public function showStageScore(score:int):void
		{
			m_txtStageScore.htmlText = "单局分:<font color='#ff0000'>" + score + "</font>";
		}
		
		private function onBtnStart(e:Event):void
		{
			var btn:TextButton = e.target as TextButton;
			
			var cmd:GameStartCommand = new GameStartCommand;
			var evt:StartEvent = new StartEvent();
			evt.width = 10;
			evt.height = 12;
			evt.typeCount = 5;
			evt.mode = btn.id;
			cmd.execute(evt);
		}
		
		
		
	}
}