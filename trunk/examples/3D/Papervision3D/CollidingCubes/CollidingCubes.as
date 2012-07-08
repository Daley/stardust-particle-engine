package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.threeD.emitters.Emitter3D;
	import idv.cjcat.stardust.threeD.papervision3d.handlers.PV3DDisplayObject3DHandler;
	
	public class CollidingCubes extends PV3DExampleWithCube {
		
		public function CollidingCubes() {
			
		}
		
		override protected function buildParticleSystem():void {
			var clock:ImpulseClock = new ImpulseClock(40);
			clock.impulse();
			emitter = new CubeEmitter(clock);
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