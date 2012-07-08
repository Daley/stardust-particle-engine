package {
	import flare.basic.Scene3D;
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.threeD.flare3d.handlers.Flare3DPivot3DHandler;
	
	public class GoldenStars extends Flare3DExample {
		
		public function GoldenStars() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new StarEmitter(f3dScene);
			emitter.particleHandler = new Flare3DPivot3DHandler(f3dContainer);
			f3dScene.addEventListener(Scene3D.COMPLETE_EVENT, onComplete);
		}
		
		private function onComplete(e:Event):void {
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void {
			emitter.step();
			mouseRotate();
			f3dScene.render();
		}
	}
}