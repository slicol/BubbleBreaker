package slicol.minigame.BubbleBreaker.view.starling
{
	import slicol.minigame.BubbleBreaker.i.IGameOver;
	import slicol.minigame.BubbleBreaker.model.GameModel;
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.RenderTexture;
	import starling.textures.Texture;
	
	public class GameOver extends Sprite implements IGameOver
	{
		private var m_bg:Image;
		
		private var m_txtTitle:TextField;
		private var m_txtScore:TextField;
		private var m_txtRank:TextField;
		private var m_txtMode:TextField;
		
		
		public function GameOver()
		{
			super();
			
			m_bg = new Image(new RenderTexture(1,1));
			this.addChild(m_bg);

			m_txtTitle = new TextField(100, 24, "", "黑体");
			m_txtTitle.text = "Game Over";
			m_txtTitle.y = 0;
			this.addChild(m_txtTitle);
			
			m_txtMode = new TextField(100, 24, "", "黑体");
			m_txtMode.text = "游戏模式:";
			m_txtMode.y = 57;
			this.addChild(m_txtMode);
			
			m_txtScore = new TextField(100, 24, "", "黑体");
			m_txtScore.text = "单局积分:";
			m_txtScore.y = 82;
			this.addChild(m_txtScore);
			
			
			m_txtRank = new TextField(100, 24, "", "黑体");
			m_txtRank.text = "单局排行:";
			m_txtRank.y = 107;
			this.addChild(m_txtRank);
			
			
			var shp:Shape = new Shape;
			shp.graphics.beginFill(0xffffff,0.8);
			shp.graphics.lineStyle(2,0x501616);
			shp.graphics.drawRoundRect(-10,0,this.width + 100, this.height + 10, 5,5);
			shp.graphics.endFill();
			shp.cacheAsBitmap = true;
			
			var bmd:BitmapData = new BitmapData(shp.width, shp.height);
			bmd.draw(shp);
			
			m_bg.texture = Texture.fromBitmapData(bmd);
			
			
			m_txtTitle.x = (m_bg.width - m_txtTitle.width)/2;
			
			this.visible = false;
		}
		
		
		public function show(stageScore:int,stageRank:int,stageMode:int):void
		{
			this.visible = true;
			m_txtMode.text = "游戏模式:" + GameModel.getInstance().modeList[stageMode] + "";
			m_txtScore.text = "单局积分:" + stageScore + "";
			m_txtRank.text = "单局排行:" + stageRank + "";
		}
		

	}
}