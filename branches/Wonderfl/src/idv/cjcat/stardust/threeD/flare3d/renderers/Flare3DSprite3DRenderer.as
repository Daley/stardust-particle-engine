package idv.cjcat.stardust.threeD.flare3d.renderers {
	import flare.core.Mesh3D;
	import flare.core.Sprite3D;
	import flare.core.Vertex3D;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.threeD.flare3d.Flare3DVertex3DSprite3DPair;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * This renderer adds <code>Sprite3D</code> particles to a <code>Mesh</code> container, 
	 * removes dead particles from the container, 
	 * and updates the <code>Sprite3D</code> objects' x, y, z, scaleX, and scaleY properties.
	 */
	public class Flare3DSprite3DRenderer extends Renderer {
		
		private var container:Mesh3D;
		
		public function Flare3DSprite3DRenderer(container:Mesh3D = null) {
			this.container = container;
		}
		
		override protected final function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			if (!container) return;
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var pair:Flare3DVertex3DSprite3DPair = Flare3DVertex3DSprite3DPair(particle.target);
				
				if (pair) {
					if (container) {
						container.addVertex(pair.vertex3D);
						container.addPoly(pair.sprite3D);
						particle.dictionary[Flare3DSprite3DRenderer] = container;
					}
				}
				
				iter.next();
			}
		}
		
		override protected final function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				
				var pair:Flare3DVertex3DSprite3DPair = Flare3DVertex3DSprite3DPair(particle.target);
				if (pair) {
					var container:Mesh3D = Mesh3D(particle.dictionary[Flare3DSprite3DRenderer]);
					if (container) {
						container.removeVertex(pair.vertex3D);
						container.removePoly(pair.sprite3D);
					}
				}
				
				iter.next();
			}
		}
		
		override protected final function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var pair:Flare3DVertex3DSprite3DPair = Flare3DVertex3DSprite3DPair(particle.target);
				
				if (pair) {
					var v3D:Vertex3D = pair.vertex3D;
					var s3D:Sprite3D = pair.sprite3D;
					
					v3D.x = particle.x;
					v3D.y = particle.y;
					v3D.z = particle.z;
					s3D.scaleX = s3D.scaleY = particle.scale;
				}
				
				iter.next();
			}
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Flare3DSprite3DRenderer";
		}
		
		//------------------------------------------------------------------------------------------------$
		//end of XML
	}
}