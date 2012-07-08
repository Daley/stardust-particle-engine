package   {
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.fields.Field3D;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	import idv.cjcat.stardust.threeD.geom.MotionData3D;
	import idv.cjcat.stardust.threeD.geom.MotionData3DPool;
	
	public class VortexField3D extends Field3D {
		
		private var strength:Number;
		
		public function VortexField3D(strength:Number) {
			this.strength = strength;
		}
		
		override protected function calculateMotionData3D(particle:Particle3D):MotionData3D {
			var x:Number;
			var y:Number;
			var z:Number;
			
			var theta:Number = Math.atan2(particle.z, particle.x);
			
			x = -strength * Math.sin(theta);
			y = 0;
			z = strength * Math.cos(theta);
			
			return MotionData3DPool.get(x, y, z);
		}
	}
}