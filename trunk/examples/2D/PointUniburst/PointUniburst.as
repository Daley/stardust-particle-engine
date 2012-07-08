package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.display.AddChildMode;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class PointUniburst extends StardustExample {
		
		private var burster:ArrowBurster;
		
		public function PointUniburst() {
			
		}
		
		override protected function buildParticleSystem():void {
			burster = new ArrowBurster();
			
			emitter = new PointUniburstEmitter(new SteadyClock(0));
			emitter.particleHandler = new DisplayObjectHandler(container, AddChildMode.BOTTOM);
			
			var timer:Timer = new Timer(100);
			timer.addEventListener(TimerEvent.TIMER, burst);
			timer.start();
		}
		
		private function burst(e:TimerEvent):void {
			burster.angleOffset += 4;
			burster.burst(emitter);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}