package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.threeD.nd3d.handlers.ND3DObject3DHandler;
	
	public class DistanceBlurSwarm extends ND3DExample {
		
		public function DistanceBlurSwarm() {
			
		}
		
		override protected function buildParticleSystem():void {
			nd3dRenderer.blurMode = true;
			
			var clock:ImpulseClock = new ImpulseClock(10);
			clock.impulse();
			emitter = new SwarmEmitter(clock);
			emitter.particleHandler = new ND3DObject3DHandler(nd3dRenderList);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
			mouseRotate();
			nd3dRenderer.render(nd3dRenderList, nd3dCamera);
		}
	}
}