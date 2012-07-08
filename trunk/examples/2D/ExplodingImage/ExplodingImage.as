package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.bursters.BitmapBurster;
	import idv.cjcat.stardust.twoD.display.AddChildMode;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class ExplodingImage extends StardustExample {
		
		private var burster:BitmapBurster;
		
		public function ExplodingImage() {
			
		}
		
		override protected function buildParticleSystem():void {
			burster = new BitmapBurster();
			burster.bitmapData = new BIB(0, 0);
			burster.offsetX = 170;
			burster.offsetY = 90;
			burster.cellWidth = burster.cellHeight = 20;
			
			emitter = new ExplosionEmitter(new SteadyClock(0));
			emitter.particleHandler = new DisplayObjectHandler(container);
			
			explosionZone_mc.addEventListener(MouseEvent.CLICK, explode);
			img_btn.addEventListener(MouseEvent.CLICK, rebuildIMG, false, 1);
			rebuildIMG();
		}
		
		private function rebuildIMG(e:MouseEvent = null):void {
			emitter.clearParticles();
			burster.burst(emitter);
		}
		
		private function explode(e:MouseEvent):void {
			ExplosionEmitter(emitter).explode.x = mouseX;
			ExplosionEmitter(emitter).explode.y = mouseY;
			ExplosionEmitter(emitter).explode.explode();
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
	}
}