﻿package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.math.StardustMath;
	
	public class Sakura extends Stardust3DExample {
		
		public function Sakura() {
			
		}
		
		override protected function buildParticleSystem():void {
			emitter = new SakuraEmitter(new SteadyClock(0.3));
			emitter.particleHandler = particleHandler;
		}
		
		override protected function mainLoop(e:Event):void {
			mouseRotate();
			emitter.step();
		}
	}
}