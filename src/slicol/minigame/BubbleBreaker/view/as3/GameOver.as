package slicol.minigame.BubbleBreaker.view.as3
{
	import slicol.minigame.BubbleBreaker.i.IGameOver;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	

	
	public class GameOver extends Sprite implements IGameOver
	{
		private var m_bg:Shape;
		
		private var m_txtTitle:TextField;
		private var m_txtScore:TextField;
		private var m_txtRank:TextField;
		private var m_txtMode:TextField;
		
		public function GameOver()
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
			
			m_txtTitle = new TextField();
			m_txtTitle.text = "Game Over";
			m_txtTitle.selectable = false;
			m_txtTitle.y = 0;
			m_txtTitle.setTextFormat(fmt);
			m_txtTitle.textColor = 0xFC0600;
			m_txtTitle.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtTitle);

			m_txtMode = new TextField();
			m_txtMode.text = "游戏模式:";
			m_txtMode.selectable = false;
			m_txtMode.y = 57;
			m_txtMode.setTextFormat(fmt);
			m_txtMode.textColor = 0x1A6CF5;
			m_txtMode.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtMode);
			
			m_txtScore = new TextField();
			m_txtScore.text = "单局积分:";
			m_txtScore.selectable = false;
			m_txtScore.y = 82;
			m_txtScore.setTextFormat(fmt);
			m_txtScore.textColor = 0x1A6CF5;
			m_txtScore.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtScore);
			
			
			m_txtRank = new TextField();
			m_txtRank.text = "单局排行:";
			m_txtRank.selectable = false;
			m_txtRank.y = 107;
			m_txtRank.setTextFormat(fmt);
			m_txtRank.textColor = 0x1A6CF5;
			m_txtRank.autoSize = TextFieldAutoSize.LEFT;
			this.addChild(m_txtRank);
			
			
			
			m_bg.graphics.beginFill(0xffffff,0.8);
			m_bg.graphics.lineStyle(2,0x501616);
			m_bg.graphics.drawRoundRect(-10,0,this.width + 100, this.height + 10, 5,5);
			m_bg.graphics.endFill();
			m_bg.cacheAsBitmap = true;
			
			m_txtTitle.x = (m_bg.width - m_txtTitle.width)/2;
			
			this.visible = false;
		}
		
		public function show(stageScore:int,stageRank:int,stageMode:int):void
		{
			this.visible = true;
			m_txtMode.htmlText = "游戏模式:<font color='#ff0000'>" + GameModel.getInstance().modeList[stageMode] + "</font>";
			m_txtScore.htmlText = "单局积分:<font color='#ff0000'>" + stageScore + "</font>";
			m_txtRank.htmlText = "单局排行:<font color='#ff0000'>" + stageRank + "</font>";
		}
		
	
		
	}
}