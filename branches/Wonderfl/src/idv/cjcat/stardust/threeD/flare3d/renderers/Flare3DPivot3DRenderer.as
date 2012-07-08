package idv.cjcat.stardust.threeD.flare3d.renderers {
	import flare.core.Pivot3D;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * This renderer adds <code>Pivot3D</code> particles to a <code>Pivot3D</code> container, 
	 * removes dead particles from the container, 
	 * and updates the <code>Pivot3D</code> objects' x, y, z, rotationX, rotationY, rotationZ, scaleX, scaleY, and scaleZ properties.
	 */
	public class Flare3DPivot3DRenderer extends Renderer {
		
		private var container:Pivot3D;
		
		public function Flare3DPivot3DRenderer(container:Pivot3D = null) {
			this.container = container;
		}
		
		override protected final function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			if (!container) return;
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var pivot3D:Pivot3D = Pivot3D(particle.target);
				
				if (pivot3D) {
					if (container) {
						container.addChild(pivot3D);
						particle.dictionary[Flare3DPivot3DRenderer] = container;
					}
				}
				
				iter.next();
			}
		}
		
		override protected final function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				
				var pivot3D:Pivot3D = Pivot3D(particle.target);
				if (pivot3D) {
					var container:Pivot3D = Pivot3D(particle.dictionary[Flare3DPivot3DRenderer]);
					if (container) {
						container.removeChild(pivot3D);
					}
				}
				
				iter.next();
			}
		}
		
		override protected final function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var pivot3D:Pivot3D = Pivot3D(particle.target);
				
				if (pivot3D) {
					pivot3D.x = particle.x;
					pivot3D.y = particle.y;
					pivot3D.z = particle.z;
					pivot3D.setRotation(particle.rotationX, particle.rotationY, particle.rotationZ);
					pivot3D.scaleX = pivot3D.scaleY = pivot3D.scaleZ = particle.scale;
				}
				
				iter.next();
			}
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Flare3DPivot3DRenderer";
		}
		
		//------------------------------------------------------------------------------------------------$
		//end of XML
	}
}