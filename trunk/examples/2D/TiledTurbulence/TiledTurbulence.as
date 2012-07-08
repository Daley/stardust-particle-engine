package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getTimer;
	import idv.cjcat.stardust.common.clocks.ImpulseClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class TiledTurbulence extends StardustExample {
		
		private var turbulenceBMPSprite:Sprite;
		private var turbulenceBMPD:BitmapData;
		
		public function TiledTurbulence() {
			
		}
		
		override protected function buildParticleSystem():void {
			turbulenceBMPD = new BitmapData(160, 160, false);
			turbulenceBMPSprite = new Sprite();
			turbulenceBMPSprite.visible = false;
			for (var i:int = 0; i < 4; i++) {
				for (var j:int = 0; j < 3; j++) {
					var bmp:Bitmap = new Bitmap(turbulenceBMPD);
					bmp.x = 160 * i;
					bmp.y = 160 * j;
					turbulenceBMPSprite.addChild(bmp);
				}
			}
			addChildAt(turbulenceBMPSprite, getChildIndex(container));
			
			var clock:ImpulseClock = new ImpulseClock(200);
			clock.impulse();
			emitter = new ArrowEmitter(clock);
			emitter.particleHandler = new DisplayObjectHandler(container);
			
			//change perlin noise seed
			seed_btn.addEventListener(MouseEvent.CLICK, changeSeed);
			changeSeed();
			
			//show/hide bitmap
			bmp_btn.addEventListener(MouseEvent.CLICK, toggleBMP);
		}
		
		override protected function mainLoop(e:Event):void {
			emitter.step();
		}
		
		private function changeSeed(e:MouseEvent = null):void {
			turbulenceBMPD.perlinNoise(80, 80, 2, getTimer(), true, true, BitmapDataChannel.RED | BitmapDataChannel.GREEN);
			ArrowEmitter(emitter).bmpField.update(turbulenceBMPD);
		}
		
		private function toggleBMP(e:MouseEvent):void {
			if (e.target["label"] == "Show Bitmap") {
				turbulenceBMPSprite.visible = true;
				e.target["label"] = "Hide Bitmap";
			} else {
				turbulenceBMPSprite.visible = false;
				e.target["label"] = "Show Bitmap";
			}
		}
	}
}