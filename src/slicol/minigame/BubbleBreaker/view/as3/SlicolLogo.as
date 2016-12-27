package slicol.minigame.BubbleBreaker.view.as3
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	
	public class SlicolLogo extends Sprite
	{
		private var m_txtLogo:TextField;
		
		public function SlicolLogo()
		{
			super();
			
			m_txtLogo = new TextField();
			m_txtLogo.text = "Author: Slicol @ Tencent 2012.03.29(PureAS3)";
			m_txtLogo.selectable = false;
			m_txtLogo.autoSize = TextFieldAutoSize.LEFT;
			m_txtLogo.textColor = 0xFF0707;
			this.addChild(m_txtLogo);
			
			
			
		}
	}
}