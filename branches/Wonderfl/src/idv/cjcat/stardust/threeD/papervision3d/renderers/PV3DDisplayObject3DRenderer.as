package idv.cjcat.stardust.threeD.papervision3d.renderers {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.renderers.Renderer;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	import org.papervision3d.objects.DisplayObject3D;
	
	/**
	 * This renderer adds <code>DisplayObject3D</code> particles to a <code>DisplayObject3D</code> container, 
	 * removes dead particles from the container, 
	 * and updates the <code>DisplayObject3D</code> objects' x, y, z, rotationX, rotationY, rotationZ, scaleX, scaleY, scaleZ, and alpha properties.
	 */
	public class PV3DDisplayObject3DRenderer extends Renderer {
		
		private var container:DisplayObject3D;
		
		public function PV3DDisplayObject3DRenderer(container:DisplayObject3D = null) {
			this.container = container;
		}
		
		override protected function particlesAdded(emitter:Emitter, particles:ParticleCollection):void {
			if (!container) return;
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var do3D:DisplayObject3D = DisplayObject3D(particle.target);
				
				if (do3D) {
					container.addChild(do3D);
					particle.dictionary[PV3DDisplayObject3DRenderer] = container;
				}
				
				iter.next();
			}
		}
		
		override protected final function particlesRemoved(emitter:Emitter, particles:ParticleCollection):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				
				var do3D:DisplayObject3D = DisplayObject3D(particle.target);
				if (do3D) {
					var container:DisplayObject3D = DisplayObject3D(particle.dictionary[PV3DDisplayObject3DRenderer]);
					if (container) {
						//working, but still doesn't completely solve the Papervision3D memory leak
						//probably need to wait for an official patch
						if (do3D.material) {
							do3D.material.unregisterObject(do3D);
						}
						if (do3D.materials) {
							for each (var matName:String in do3D.materialsList()) {
								do3D.materials.getMaterialByName(matName).unregisterObject(do3D);
							}
						}
						do3D.geometry.vertices = null;
						do3D.geometry.faces = null;
						do3D.faces = null;
						
						container.removeChild(do3D);
					}
				}
				
				iter.next();
			}
		}
		
		override protected final function render(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			var particle:Particle3D;
			var iter:ParticleIterator = particles.getIterator();
			while (particle = Particle3D(iter.particle())) {
				var do3D:DisplayObject3D = DisplayObject3D(particle.target);
				if (do3D) {
					do3D.x = particle.x;
					do3D.y = particle.y;
					do3D.z = particle.z;
					do3D.rotationX = particle.rotationX;
					do3D.rotationY = particle.rotationY;
					do3D.rotationZ = particle.rotationZ;
					do3D.scaleX = do3D.scaleY = do3D.scaleZ = particle.scale;
					do3D.alpha = particle.alpha;
				}
				
				iter.next();
			}
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "PV3DDisplayObject3DRenderer";
		}
		
		//------------------------------------------------------------------------------------------------$
		//end of XML
	}
}