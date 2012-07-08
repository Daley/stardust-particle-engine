package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.handlers.PixelHandler;
	
	public class Waypoints extends StardustExample {
		
		private var pixelBMPD:BitmapData;
		private var pixelBMP:Bitmap;
		private var blurBMPD:BitmapData;
		private var blurBMP:Bitmap;
		
		public function Waypoints() {
			
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
			
			var nodes:Array = [startNode_mc, node1_mc, node2_mc, node3_mc, endNode_mc];
			emitter = new PixelEmitter(new SteadyClock(1), nodes);
			emitter.particleHandler = new PixelHandler(pixelBMPD);
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