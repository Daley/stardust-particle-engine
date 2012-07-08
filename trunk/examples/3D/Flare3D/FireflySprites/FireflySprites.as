package {
	import flare.basic.Scene3D;
	import flare.core.Mesh3D;
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.threeD.flare3d.handlers.Flare3DSprite3DHandler;
	
	public class FireflySprites extends Flare3DExample {
		
		public function FireflySprites() {
			
		}
		
		override protected function buildParticleSystem():void {
			var containerMesh:Mesh3D = new Mesh3D("mesh");
			f3dContainer.addChild(containerMesh);
			emitter = new FireflyEmitter(f3dScene, new Flare3DSprite3DHandler(containerMesh));
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