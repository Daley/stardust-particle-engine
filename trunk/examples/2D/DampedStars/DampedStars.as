package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class DampedStars extends StardustExample {
		
		public function DampedStars() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new StarEmitter(new SteadyClock(0.4));
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}