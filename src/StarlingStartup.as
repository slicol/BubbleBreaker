package
{
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	public class StarlingStartup
	{
		public function StarlingStartup()
		{
		}
		

		
		public static function start(stage:Stage, rootClass:Class):void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Starling.multitouchEnabled = true; // useful on mobile devices
			Starling.handleLostContext = true; // deactivate on mobile devices (to save memory)
			
			var mStarling:Starling;
			mStarling = new Starling(rootClass, stage);
			mStarling.simulateMultitouch = true;
			mStarling.enableErrorChecking = false;
			mStarling.antiAliasing = 4;
			mStarling.start();
			
			// this event is dispatched when stage3D is set up
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
		}
		
		private static function onContextCreated(event:Event):void
		{
			// set framerate to 30 in software mode
			
			if (Starling.context.driverInfo.toLowerCase().indexOf("software") != -1)
				Starling.current.nativeStage.frameRate = 30;
		}
		
		
		//---------------------------------------------------------------
	}
}