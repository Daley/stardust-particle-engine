package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.threeD.papervision3d.handlers.PV3DParticleHandler;
	import org.papervision3d.core.geom.Particles;
	
	public class CubedStars extends PV3DExampleWithCube {
		
		public function CubedStars() {
			
		}
		
		override protected function buildParticleSystem():void {
			var pv3dParticles:Particles = new Particles();
			pv3dContainer.addChild(pv3dParticles);
			emitter = new StarEmitter(new SteadyClock(0.25));
			emitter.particleHandler = new PV3DParticleHandler(pv3dParticles);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
			mouseRotate();
			pv3dRenderEngine.renderScene(pv3dScene, pv3dCamera, pv3dViewport);
		}
	}
}