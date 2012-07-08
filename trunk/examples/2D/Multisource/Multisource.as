package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.twoD.handlers.DisplayObjectHandler;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class Multisource extends StardustExample {
		
		private var sources:Array;
		
		public function Multisource() {
			sources = [source1_mc, source2_mc, source3_mc];
		}
		
		override protected function buildParticleSystem():void {
			emitter = new MultisourceEmitter(new SteadyClock(1));
			emitter.particleHandler = new DisplayObjectHandler(container);
		}
		
		override protected function mainLoop(e:Event):void {
			var time:int = getTimer();
			
			//rotate points
			for (var i:int = 0; i < 3; i++) {
				var source:Sprite = sources[i] as Sprite;
				var point:SinglePoint = MultisourceEmitter(emitter).points[i] as SinglePoint;
				
				var theta:Number = i * (2 * Math.PI / 3) + (time / 1000);
				point.x = source.x = 320 + 100 * Math.cos(theta);
				point.y = source.y = 240 + 100 * Math.sin(theta);
			}
			
			emitter.step();
		}
	}
}