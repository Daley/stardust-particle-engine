package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.events.EmitterEvent;
	import idv.cjcat.stardust.twoD.handlers.PixelHandler;
	
	public class StarFireworks extends StardustExample {
		
		private var particleBitmapData:BitmapData;
		private var blurBitmapData:BitmapData;
		private var impulseClock:ImpulseClock;
		
		public function StarFireworks() {
			
		}
		
		override protected function buildParticleSystem():void {
			//setup bitmap data
			particleBitmapData = new BitmapData(640, 480, true, 0);
			blurBitmapData = new BitmapData(320, 240, true, 0);
			var bmp:Bitmap = new Bitmap(blurBitmapData);
			bmp.alpha = 0.8;
			bmp.scaleX = bmp.scaleY = 2;
			container.addChild(bmp);
			container.addChild(new Bitmap(particleBitmapData));
			
			//draw a Star object for the BitmapZone for the velocity initializer
			var star:Star = new Star();
			var starBitmap:BitmapData = new BitmapData(star.width, star.height, true, 0);
			starBitmap.draw(star);
			
			impulseClock = new ImpulseClock(500);
			emitter = new PixelEmitter(impulseClock, starBitmap, 0xF9C330);
			emitter.particleHandler = new PixelHandler(particleBitmapData);
			
			//burst out new particles when the emitter gets empty
			emitter.onEmpty.add(onEmptyListener);
		}
		
		private function onEmptyListener(emitter:Emitter):void {
			impulseClock.impulse();
		}
		
		private var particleBitmapDataMatrix:Matrix = new Matrix(0.5, 0, 0, 0.5);
		override protected function mainLoop(e:Event):void {
			blurBitmapData.applyFilter(blurBitmapData, blurBitmapData.rect, new Point(0, 0), new BlurFilter(4, 4, 1));
			blurBitmapData.draw(particleBitmapData, particleBitmapDataMatrix);
			particleBitmapData.fillRect(particleBitmapData.rect, 0x00000000);
			emitter.step(0.5);
		}
	}
}