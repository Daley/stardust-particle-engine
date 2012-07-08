package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class MaskedCollision extends StardustExample {
		
		
		public function MaskedCollision() {
			
		}
		
		override protected function buildParticleSystem():void {
			var clock:ImpulseClock = new ImpulseClock(30);
			clock.impulse();
			emitter = new BallEmitter(clock);
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}