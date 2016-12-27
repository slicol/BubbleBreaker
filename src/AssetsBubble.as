package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;


	//[Bindable]
	public class AssetsBubble
	{
		public function AssetsBubble()
		{
		}

		[Embed( "../media/bubble/Bubble1.png" )]
		public static var bubble1 : Class;
		
		[Embed( "../media/bubble/Bubble2.png" )]
		public static var bubble2 : Class;
		
		[Embed( "../media/bubble/Bubble3.png" )]
		public static var bubble3 : Class;
		
		[Embed( "../media/bubble/Bubble4.png" )]
		public static var bubble4 : Class;
		
		[Embed( "../media/bubble/Bubble5.png" )]
		public static var bubble5 : Class;
		
		[Embed( "../media/bubble/Bubble6.png" )]
		public static var bubble6 : Class;
		
		[Embed( "../media/bubble/bg.png" )]
		public static var bg : Class;
		
		private static var sTextures:Dictionary = new Dictionary();
		private static var sBitmapDatas:Dictionary = new Dictionary();

		
		public static function getBitmapData(name:String):BitmapData
		{
			if (sBitmapDatas[name] == undefined)
			{
				var data:Object = new AssetsBubble[name]();
				
				if (data is Bitmap)
					sBitmapDatas[name] = (data as Bitmap).bitmapData;
			}
			
			return sBitmapDatas[name];
		}
		
		public static function getTexture(name:String):Texture
		{
			if (sTextures[name] == undefined)
			{
				var data:Object = new AssetsBubble[name]();
				
				if (data is Bitmap)
					sTextures[name] = Texture.fromBitmap(data as Bitmap);
				else if (data is ByteArray)
					sTextures[name] = Texture.fromAtfData(data as ByteArray);
			}
			
			return sTextures[name];
		}
	}
}
