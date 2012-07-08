package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getTimer;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class TrailDust extends StardustExample {
		
		private var point:SinglePoint;
		
		public function TrailDust() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new DustEmitter(new SteadyClock(2));
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			var time:int = getTimer();
			DustEmitter(emitter).point.x = 320 + 200 * Math.cos(time / 777);
			DustEmitter(emitter).point.y = 240 + 75 * Math.sin(time / 333);
			emitter.step();
		}
	}
}