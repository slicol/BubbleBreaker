package 
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    
    import starling.display.Sprite;
    import starling.textures.Texture;
    
    public class AssetsPS extends Sprite
    {
		[Embed(source="../media/ps/ps.pex.template", mimeType="application/octet-stream")]
		public static const TemplateConfig:Class;

		
        // particle designer configurations
		

        [Embed(source="../media/ps/drugs.pex", mimeType="application/octet-stream")]
        public static const DrugsConfig:Class;
        
        [Embed(source="../media/ps/fire.pex", mimeType="application/octet-stream")]
		public static const FireConfig:Class;
        
        [Embed(source="../media/ps/sun.pex", mimeType="application/octet-stream")]
		public static const SunConfig:Class;
        
        [Embed(source="../media/ps/jellyfish.pex", mimeType="application/octet-stream")]
		public static const JellyfishConfig:Class;
        
        // particle textures
        
        [Embed(source = "../media/ps/drugs_particle.png")]
		public static const DrugsParticle:Class;
        
        [Embed(source = "../media/ps/fire_particle.png")]
		public static const FireParticle:Class;
        
        [Embed(source = "../media/ps/sun_particle.png")]
		public static const SunParticle:Class;
        
        [Embed(source = "../media/ps/jellyfish_particle.png")]
		public static const JellyfishParticle:Class;
       
        
        public function AssetsPS()
        {

        }
        
		
		private static var sTextures:Dictionary = new Dictionary();
		private static var sBitmapDatas:Dictionary = new Dictionary();
		

		public static function getBitmapData(name:String):BitmapData
		{
			if (sBitmapDatas[name] == undefined)
			{
				var data:Object = new AssetsPS[name]();
				
				if (data is Bitmap)
					sBitmapDatas[name] = (data as Bitmap).bitmapData;
			}
			
			return sBitmapDatas[name];
		}
		
		public static function getBitmap(name:String):Bitmap
		{
			return new Bitmap(getBitmapData(name));
		}
		
		
		public static function getConfig(name:String):XML
		{
			var data:String = new AssetsPS[name]();
			var ret:XML = new XML(data);
			return ret;
		}
		
		public static function getTexture(name:String):Texture
		{
			if (sTextures[name] == undefined)
			{
				var data:Object = new AssetsPS[name]();
				
				if (data is Bitmap)
					sTextures[name] = Texture.fromBitmap(data as Bitmap);
				else if (data is ByteArray)
					sTextures[name] = Texture.fromAtfData(data as ByteArray);
			}
			
			return sTextures[name];
		}
 
    }
}