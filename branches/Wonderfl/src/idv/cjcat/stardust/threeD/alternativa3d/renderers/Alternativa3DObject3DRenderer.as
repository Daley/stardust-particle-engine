package idv.cjcat.stardust.threeD.alternativa3d.renderers {
	import alternativa.engine3d.core.Face;
	import alternativa.engine3d.core.Object3D;
	import alternativa.engine3d.core.Object3DContainer;
	import alternativa.engine3d.objects.Mesh;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * This renderer adds <code>Object3D</code> particles to a <code>Object3D</code> container,
	 * removes dead particles from the container,
	 * and updates the <code>Object3D</code> objects' x, y, z, rotationX, rotationY, rotationZ, scaleX, scaleY, scaleZ, and alpha properties.
	 */
	public class Alternativa3DObject3DRenderer extends Renderer {
		private var container:Object3DContainer;
		
		public function Alternativa3DObject3DRenderer(container:Object3DContainer = null) {
			this.container = container;
		}
		
		override protected function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			if (!container) return;
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var o3D:Object3D = Object3D(particle.target);
				
				if (o3D) {
					container.addChild(o3D);
					particle.dictionary[Alternativa3DObject3DRenderer] = container;
				}
				
				iter.next();
			}
		}
		
		override protected final function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				
				var o3D:Object3D = Object3D(particle.target);
				if (o3D) {
					var container:Object3DContainer = Object3DContainer(particle.dictionary[Alternativa3DObject3DRenderer]);
					if (container) {
						container.removeChild(o3D);
					}
				}
				
				iter.next();
			}
		}
		
		override protected final function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var o3D:Object3D = Object3D(particle.target);
				if (o3D) {
					o3D.x = particle.x;
					o3D.y = particle.y;
					o3D.z = particle.z;
					o3D.rotationX = particle.rotationX * Math.PI / 180;
					o3D.rotationY = particle.rotationY * Math.PI / 180;
					o3D.rotationZ = particle.rotationZ * Math.PI / 180;
					o3D.scaleX = o3D.scaleY = o3D.scaleZ = particle.scale;
					o3D.alpha = particle.alpha;
				}
				
				iter.next();
			}
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "Alternativa3DObject3DRenderer";
		}
		
		//------------------------------------------------------------------------------------------------$
		//end of XML
	}
}