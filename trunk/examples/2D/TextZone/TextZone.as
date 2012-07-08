package {
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class TextZone extends StardustExample {
		
		public function TextZone() {
			
		}
		
		override protected function buildParticleSystem():void {
			addChildAt(text_mc, getChildIndex(container));
			
			var bitmapData:BitmapData = new BitmapData(text_mc.width, text_mc.height, true, 0x00000000);
			bitmapData.draw(text_mc);
			emitter = new BitmapZoneEmitter(new SteadyClock(1), bitmapData, text_mc.x, text_mc.y);
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}