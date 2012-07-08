package {
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class TextSpark extends StardustExample {
		
		private var sparkMask:BitmapData;
		
		public function TextSpark() {
			sparkMask_mc.visible = false;
		}
		
		override protected function buildParticleSystem():void {
			addChildAt(text_mc, getChildIndex(container));
			
			var degradationStep:int = 2;
			
			sparkMask = new BitmapData(text_mc.width / degradationStep, text_mc.height / degradationStep, true, 0x00000000);
			emitter = new UpdatableBitmapZoneEmitter(new SteadyClock(6), sparkMask_mc.x, sparkMask_mc.y, degradationStep, degradationStep);
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			sparkMask.fillRect(sparkMask.rect, 0x00000000);
			sparkMask.draw(sparkMask_mc, new Matrix(0.5, 0, 0, 0.5));
			UpdatableBitmapZoneEmitter(emitter).update(sparkMask);
			emitter.step();
		}
	}
}