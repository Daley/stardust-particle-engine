package idv.cjcat.stardust.twoD.renderers {
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.math.StardustMath;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Similar to the <code>BitmapRenderer</code>, but uses only one display object for drawing the target bitmap.
	 * 
	 * @see idv.cjcat.stardust.twoD.renderers.BitmapRenderer
	 */
	public class SingularBitmapRenderer extends Renderer {
		
		public var displayObject:DisplayObject;
		public var targetBitmapData:BitmapData;
		public var blendMode:String;
		
		public function SingularBitmapRenderer(displayObject:DisplayObject = null, targetBitmapData:BitmapData = null, blendMode:String = "normal") {
			this.displayObject = displayObject;
			this.targetBitmapData = targetBitmapData;
			this.blendMode = blendMode;
		}
		
		override protected function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			//do nothing
		}
		
		override protected function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			//do nothing
		}
		
		override protected function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			if (!displayObject) return;
			if (!targetBitmapData) return;
			
			targetBitmapData.lock();
			var particle:Particle2D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle2D(iter.particle())) {
				var mat:Matrix = new Matrix();
				mat.scale(particle.scale, particle.scale);
				mat.rotate(particle.rotation * StardustMath.DEGREE_TO_RADIAN);
				mat.translate(particle.x, particle.y);
				
				targetBitmapData.draw(displayObject, mat, new ColorTransform(1, 1, 1, particle.alpha), blendMode);
				
				iter.next();
			}
			targetBitmapData.unlock();
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "SingularBitmapRenderer";
		}
		
		override public function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@blendMode = blendMode;
			
			return xml;
		}
		
		override public function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@blendMode.length()) blendMode = xml.@blendMode;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}