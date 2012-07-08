package idv.cjcat.stardust.twoD.pyronova.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.utils.construct;
	import idv.cjcat.stardust.twoD.initializers.Initializer2D;
	
	/**
	 * Assigns a node to the <code>target</code> properties of a particle. 
	 * <p>
	 * Default priority = 1;
	 * </p>
	 */
	public class PyroNodeClass extends Initializer2D {
		
		public var nodeClass:Class;
		public var constructorParams:Array;
		public function PyroNodeClass(nodeClass:Class = null, constructorParams:Array = null) {
			priority = 1;
			
			this.nodeClass = nodeClass;
			this.constructorParams = constructorParams;
		}
		
		override public function initialize(p:Particle):void {
			if (!nodeClass) return;
			p.target = construct(nodeClass, constructorParams);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		override public function getXMLTagName():String {
			return "PyroNodeClass";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}