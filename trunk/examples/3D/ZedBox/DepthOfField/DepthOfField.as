package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.zedbox.actions.DOFBlur;
	
	public class DepthOfField extends ZBExample {
		
		public function DepthOfField() {
			
		}
		
		override protected function buildParticleSystem():void {
			zbScene.camera.focalLength = 250;
			zbScene.camera.zoom = 2;
			zbScene.addAction(new DOFBlur( -1500, 1300, 300, 20, 2));
			
			emitter = new StarEmitter(new SteadyClock(0.1), particleHandler);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
			mouseRotate();
			zbScene.render();
		}
	}
}