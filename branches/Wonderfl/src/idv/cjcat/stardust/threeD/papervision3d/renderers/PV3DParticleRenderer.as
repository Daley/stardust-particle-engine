package idv.cjcat.stardust.threeD.papervision3d.renderers {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	import org.papervision3d.core.geom.Particles;
	import org.papervision3d.core.geom.renderables.Particle;
	
	/**
	 * This renderer adds <code>particle</code> object to a <code>particles</code> object, 
	 * removes dead particles from the <code>particles</code> object, 
	 * and updates the <code>Particle</code> objects' x, y, z, rotationZ, and size properties.
	 * 
	 * @see org.papervision3d.core.geom.Particles
	 * @see org.papervision3d.core.geom.renderables.Particle
	 */
	public class PV3DParticleRenderer extends Renderer {
		
		private var particleContainer:Particles;
		
		public function PV3DParticleRenderer(particleContainer:Particles = null) {
			this.particleContainer = particleContainer;
		}
		
		override protected final function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			if (!particleContainer) return;
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var p:org.papervision3d.core.geom.renderables.Particle
					= particle.target as org.papervision3d.core.geom.renderables.Particle;
				
				particleContainer.addParticle(p);
				particle.dictionary[PV3DDisplayObjectRenderer] = particleContainer;
				
				iter.next();
			}
		}
		
		override protected final function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var p:org.papervision3d.core.geom.renderables.Particle
					= particle.target as org.papervision3d.core.geom.renderables.Particle;
				var container:Particles = particle.dictionary[PV3DDisplayObjectRenderer];
				
				container.removeParticle(p);
				
				iter.next();
			}
		}
		
		override protected final function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var p:org.papervision3d.core.geom.renderables.Particle =
					particle.target as org.papervision3d.core.geom.renderables.Particle;
				
				p.x = particle.x;
				p.y = particle.y;
				p.z = particle.z;
				p.rotationZ = particle.rotationZ;
				p.size = particle.scale;
				
				iter.next();
			}
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "PV3DParticleRenderer";
		}
		
		//------------------------------------------------------------------------------------------------$
		//end of XML
	}
}