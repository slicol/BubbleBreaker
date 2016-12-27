package slicol.minigame.BubbleBreaker.view.base
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class TextButton extends SimpleButton
	{
		private var m_tf:TextField;
		private var m_id:*;
		
		public function TextButton(id:*, bitmapData:BitmapData, text:String = "")
		{
			m_id = id;
		
			var upState:Bitmap = new Bitmap(bitmapData);
			var overState:Bitmap = new Bitmap(bitmapData);
			var downState:Bitmap = new Bitmap(bitmapData);
			var hitTestState:Bitmap = new Bitmap(bitmapData);
			
			upState.smoothing = true;
			overState.alpha = 0.8;
			downState.y = 1;
			
			super(upState, overState, downState, hitTestState);
			
			var tf:TextField = new TextField();
			
			tf.selectable = false;
			tf.mouseEnabled = false;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.text = text;
			
			tf.x = 0;
			tf.width = upState.width;
			tf.y = (upState.height - tf.height)/2;
			
			m_tf = tf;

			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		
		private function onAddToStage(e:Event):void
		{
			var pThis:DisplayObjectContainer = this.parent;
			
			pThis.addChild(m_tf);
			m_tf.x += this.x;
			m_tf.y += this.y;
		}
		
		override public function set visible(value:Boolean):void
		{
			super.visible = value;
			m_tf.visible = value;
		}
		
		
		public function get id():*{return m_id;}
		
	
	}
}