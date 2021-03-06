﻿package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.BlurFilter;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.twoD.display.AddChildMode;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class TurbulentBlast extends StardustExample {
		
		private var turbulenceBMP:Bitmap;
		private var turbulenceBMPD:BitmapData;
		private var clock:ImpulseClock;
		
		public function TurbulentBlast() {
			
		}
		
		override protected function buildParticleSystem():void {
			turbulenceBMPD = new BitmapData(640, 480, false);
			turbulenceBMP = new Bitmap(turbulenceBMPD);
			turbulenceBMP.visible = false;
			addChildAt(turbulenceBMP, getChildIndex(container));
			
			clock = new ImpulseClock(15, 15);
			emitter = new SparkEmitter(clock);
			emitter.particleHandler = new DisplayObjectHandler(container, AddChildMode.TOP);
			
			//timer for perlin noise update
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			tick();
			
			//show/hide bitmap
			bmp_btn.addEventListener(MouseEvent.CLICK, toggleBMP);
		}
		
		private function tick(e:TimerEvent = null):void {
			turbulenceBMPD.perlinNoise(80, 80, 2, getTimer(), true, true, BitmapDataChannel.RED | BitmapDataChannel.GREEN);
			clock.impulse();
			SparkEmitter(emitter).bmpField.update(turbulenceBMPD);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
		
		private function toggleBMP(e:MouseEvent):void {
			if (e.target["label"] == "Show Bitmap") {
				turbulenceBMP.visible = true;
				e.target["label"] = "Hide Bitmap";
			} else {
				turbulenceBMP.visible = false;
				e.target["label"] = "Show Bitmap";
			}
		}
	}
}