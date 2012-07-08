﻿package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	
	public class Sprinkles extends StardustExample {
		
		public function Sprinkles() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new SprinkleEmitter(new SteadyClock(1));
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			SprinkleEmitter(emitter).point.x = mouseX;
			SprinkleEmitter(emitter).point.y = mouseY;
			emitter.step();
		}
	}
}