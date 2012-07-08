package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class BoundaryCollisionSparks extends StardustExample {
		
		public function BoundaryCollisionSparks() {
			
		}
		
		override protected function buildParticleSystem():void {
			var clock:ImpulseClock = new ImpulseClock(1);
			clock.impulse();
			emitter = new BallEmitter(clock);
			emitter.particleHandler = new DisplayObjectHandler(container);
			addChildAt(container, 2);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}