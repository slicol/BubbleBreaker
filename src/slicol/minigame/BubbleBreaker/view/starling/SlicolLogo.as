package slicol.minigame.BubbleBreaker.view.starling
{
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class SlicolLogo extends Sprite
	{
		private var m_txtLogo:TextField;
		
		public function SlicolLogo()
		{
			super();
			
			m_txtLogo = new TextField(320, 24, "");
			m_txtLogo.text = "Author: Slicol @ Tencent 2012.03.29(Starling)";
			
			this.addChild(m_txtLogo);
			
			
			
		}
	}
}