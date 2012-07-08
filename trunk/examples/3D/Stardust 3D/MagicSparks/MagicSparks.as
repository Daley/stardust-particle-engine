package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.math.StardustMath;
	
	public class MagicSparks extends Stardust3DExample {
		
		private var clock:ImpulseClock;
		private var timer:Timer;
		
		public function MagicSparks() {
			
		}
		
		override protected function buildParticleSystem():void {
			clock = new ImpulseClock(4, 5);
			emitter = new SparkEmitter(clock);
			emitter.particleHandler = particleHandler;
			
			timer = new Timer(3000);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			tick();
		}
		
		private function tick(e:TimerEvent = null):void {
			clock.impulse();
		}
		
		override protected function mainLoop(e:Event):void {
			mouseRotate();
			emitter.step();
		}
		
		override protected function togglePause(e:MouseEvent):void {
			if (e.target["label"] == "Pause") {
				timer.stop();
			} else {
				timer.start();
			}
			super.togglePause(e);
		}
	}
}