package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class Turbulence extends StardustExample {
		
		private var turbulenceBMP:Bitmap;
		private var turbulenceBMPD:BitmapData;
		
		public function Turbulence() {
			
		}
		
		override protected function buildParticleSystem():void {
			turbulenceBMPD = new BitmapData(320, 240, false);
			turbulenceBMP = new Bitmap(turbulenceBMPD);
			turbulenceBMP.visible = false;
			addChildAt(turbulenceBMP, getChildIndex(container));
			
			var clock:ImpulseClock = new ImpulseClock(200);
			clock.impulse();
			emitter = new ArrowEmitter(clock);
			emitter.particleHandler = new DisplayObjectHandler(container);
			
			//timer for perlin noise update
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			tick();
			
			//show/hide bitmap
			bmp_btn.addEventListener(MouseEvent.CLICK, toggleBMP);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
		
		private function tick(e:TimerEvent = null):void {
			turbulenceBMPD.perlinNoise(75, 75, 2, getTimer(), true, true, BitmapDataChannel.RED | BitmapDataChannel.GREEN);
			ArrowEmitter(emitter).bmpField.update(turbulenceBMPD);
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