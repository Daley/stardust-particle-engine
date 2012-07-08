package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.twoD.handlers.PixelHandler;
	
	public class TurbulentPixels extends StardustExample {
		
		private var pixelBMPD:BitmapData;
		private var pixelBMP:Bitmap;
		private var blurBMPD:BitmapData;
		private var blurBMP:Bitmap;
		private var turbulenceBMPD:BitmapData;
		private var clock:ImpulseClock;
		
		public function TurbulentPixels() {
			
		}
		
		override protected function buildParticleSystem():void {
			pixelBMPD = new BitmapData(640, 480, true, 0);
			pixelBMP = new Bitmap(pixelBMPD);
			blurBMPD = new BitmapData(320, 240, true, 0);
			blurBMP = new Bitmap(blurBMPD);
			blurBMP.alpha = 0.5;
			blurBMP.scaleX = blurBMP.scaleY = 2;
			
			container.addChild(blurBMP);
			container.addChild(pixelBMP);
			
			turbulenceBMPD = new BitmapData(320, 240, false);
			
			clock = new ImpulseClock(800);
			clock.impulse();
			emitter = new PixelEmitter(clock);
			emitter.particleHandler = new PixelHandler(pixelBMPD);
			
			//timer for perlin noise update
			var timer:Timer = new Timer(1500);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			tick();
		}
		
		private function tick(e:TimerEvent = null):void {
			turbulenceBMPD.perlinNoise(100, 100, 2, getTimer(), true, true, BitmapDataChannel.RED | BitmapDataChannel.GREEN);
			PixelEmitter(emitter).field.update(turbulenceBMPD);
		}
		
		private var matrix:Matrix = new Matrix(0.5, 0, 0, 0.5);
		override protected function mainLoop(e:Event):void {
			blurBMPD.lock();
			blurBMPD.draw(pixelBMPD, matrix);
			blurBMPD.applyFilter(blurBMPD, blurBMPD.rect, new Point(0, 0), new BlurFilter(2, 2, 1));
			blurBMPD.unlock();
			pixelBMPD.lock();
			pixelBMPD.fillRect(pixelBMPD.rect, 0);
			emitter.step();
			pixelBMPD.unlock();
		}
	}
}