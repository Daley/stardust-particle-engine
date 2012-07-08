﻿package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class Drips extends StardustExample {
		
		private var bmpd:BitmapData;
		private var bmp:Bitmap;
		
		public function Drips() {
			
		}
		
		override protected function buildParticleSystem():void {
			bmpd = new BitmapData(320, 240, true, 0);
			bmp = new Bitmap(bmpd);
			bmp.scaleX = bmp.scaleY = 2;
			
			addChildAt(bmp, getChildIndex(container));
			
			emitter = new DripEmitter(new SteadyClock(0.1));
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		private var darken:ColorTransform = new ColorTransform(1, 1, 1, 0.8);
		private var matrix:Matrix = new Matrix(0.5, 0, 0, 0.5);
		override protected function mainLoop(e:Event):void {
			bmpd.colorTransform(bmpd.rect, darken);
			bmpd.draw(container, matrix);
			emitter.step();
		}
	}
}