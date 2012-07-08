package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.display.AddChildMode;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class Fireworks extends StardustExample {
		
		private var clock:ImpulseClock;
		
		public function Fireworks() {
			
		}
		
		override protected function buildParticleSystem():void {
			var sparkHeadContainer:Sprite = new Sprite(); //makes the spark heads at top of all particles
			addChildAt(sparkHeadContainer, getChildIndex(container) + 1);
			
			clock = new ImpulseClock(20);
			emitter = new FireworksEmitter(clock, sparkHeadContainer);
			emitter.particleHandler = new DisplayObjectHandler(container, AddChildMode.TOP);
			
			//timer for fireworks burts
			var timer:Timer = new Timer(2500);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.start();
			tick();
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
		
		private function tick(e:TimerEvent = null):void {
			clock.impulse();
		}
	}
}