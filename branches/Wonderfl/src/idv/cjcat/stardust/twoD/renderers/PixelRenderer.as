package idv.cjcat.stardust.twoD.renderers {
	import flash.display.BitmapData;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * This renderer draws pixels into a <code>BitmapData</code> object according to the <code>color</code> property of <code>Particle</code> objects.
	 */
	public class PixelRenderer extends Renderer {
		
		/**
		 * The target bitmap to draw display object into.
		 */
		public var targetBitmapData:BitmapData;
		
		public function PixelRenderer(targetBitmapData:BitmapData = null) {
			this.targetBitmapData = targetBitmapData;
		}
		
		override protected function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			//do nothing
		}
		
		override protected function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			//do nothing
		}
		
		override protected function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			if (!targetBitmapData) return;
			
			targetBitmapData.lock();
			var particle:Particle2D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle2D(iter.particle())) {
				var x:int = int(particle.x + 0.5);
				if ((x < 0) || (x >= targetBitmapData.width)) {
					iter.next();
					continue;
				}
				var y:int = int(particle.y + 0.5);
				if ((y < 0) || (y >= targetBitmapData.height)) {
					iter.next();
					continue;
				}
				
				var finalColor:uint = (particle.color & 0xFFFFFF) | uint(uint(particle.alpha * 255) << 24);
				targetBitmapData.setPixel32(x, y, finalColor);
				
				iter.next();
			}
			targetBitmapData.unlock();
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "PixelRenderer";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}