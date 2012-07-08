package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.math.StardustMath;
	
	public class OrientedBillboards extends Stardust3DExample {
		
		public function OrientedBillboards() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new AdorablePinkTriangleEmitter(new SteadyClock(0.6));
			emitter.particleHandler = particleHandler;
		}
		
		override protected function mainLoop(e:Event):void {
			mouseRotate();
			emitter.step();
		}
	}
}