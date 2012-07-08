package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.twoD.bursters.BitmapBurster;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class SnapshotRestoration extends StardustExample {
		
		private var burster:BitmapBurster;
		
		public function SnapshotRestoration() {
			
		}
		
		override protected function buildParticleSystem():void {
			burster = new BitmapBurster();
			star_mc.visible = false;
			var bmpd:BitmapData = new BitmapData(star_mc.width, star_mc.height, true, 0);
			bmpd.draw(star_mc);
			burster.bitmapData = bmpd;
			burster.offsetX = star_mc.x;
			burster.offsetY = star_mc.y;
			burster.cellWidth = burster.cellHeight = 20;
			
			emitter = new StarEmitter();
			emitter.particleHandler = new DisplayObjectHandler(container);
			
			burster.burst(emitter);
			StarEmitter(emitter).snapshot.takeSnapshot();
			
			restore_btn.addEventListener(MouseEvent.CLICK, restore);
			explosionZone_mc.addEventListener(MouseEvent.CLICK, explode);
		}
		
		private function restore(e:MouseEvent):void {
			StarEmitter(emitter).snapshotRestore.start();
		}
		
		private function explode(e:MouseEvent):void {
			StarEmitter(emitter).explode.x = mouseX;
			StarEmitter(emitter).explode.y = mouseY;
			StarEmitter(emitter).explode.explode();
			
			var iter:ParticleIterator = emitter.particles.getIterator();
			var particle:Particle2D;
			while (particle = iter.particle as Particle2D) {
				particle.rotation = 720 * (Math.random() - 0.5);
				iter.next();
			}
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}