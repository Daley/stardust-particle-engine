package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.threeD.papervision3d.handlers.PV3DDisplayObject3DHandler;
	
	public class DisplayObject3DParticles extends PV3DExampleWithCube {
		
		public function DisplayObject3DParticles() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new CubeEmitter(new SteadyClock(0.3));
			emitter.particleHandler = new PV3DDisplayObject3DHandler(pv3dContainer);
			pv3dSuperContainer.addChild(CubeEmitter(emitter).light);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
			mouseRotate();
			pv3dRenderEngine.renderScene(pv3dScene, pv3dCamera, pv3dViewport);
		}
	}
}