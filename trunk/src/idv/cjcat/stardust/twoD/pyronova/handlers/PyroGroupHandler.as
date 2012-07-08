package idv.cjcat.stardust.twoD.pyronova.handlers {
	import idv.cjcat.pyronova.nodes.IGroup;
	import idv.cjcat.pyronova.nodes.Node;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	public class PyroGroupHandler extends ParticleHandler {
		
		public var container:IGroup;
		
		public function PyroGroupHandler(container:IGroup = null) {
			this.container = container;
		}
		
		override public function particleAdded(particle:Particle):void {
			container.add(Node(particle.target));
		}
		
		private var node:Node;
		override public function particleRemoved(particle:Particle):void {
			node = Node(particle.target);
			node.parent.remove(node);
		}
		
		private var p:Particle2D;
		override public function readParticle(particle:Particle):void {
			p = Particle2D(particle);
			node = Node(particle.target);
			node.position.set(p.x, p.y);
			node.rotation = p.rotation;
			node.scale.set(p.scale, p.scale);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "PyroGroupHandler";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}