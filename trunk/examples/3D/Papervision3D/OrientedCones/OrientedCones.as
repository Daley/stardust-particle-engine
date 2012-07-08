package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.threeD.papervision3d.handlers.PV3DDisplayObject3DHandler;
	
	public class OrientedCones extends PV3DExampleWithCube {
		
		public function OrientedCones() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new ConeEmitter(new SteadyClock(0.5));
			emitter.particleHandler = new PV3DDisplayObject3DHandler(pv3dContainer);
			pv3dSuperContainer.addChild(ConeEmitter(emitter).light);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
			mouseRotate();
			pv3dRenderEngine.renderScene(pv3dScene, pv3dCamera, pv3dViewport);
		}
	}
}