package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Spin3D;
	import idv.cjcat.stardust.threeD.initializers.Omega3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Rotation3D;
	import idv.cjcat.stardust.threeD.papervision3d.initializers.PV3DParticle;
	import idv.cjcat.stardust.threeD.zones.CubeZone;
	import org.papervision3d.materials.special.MovieParticleMaterial;
	
	public class StarEmitter extends PausibleEmitter3D {
		
		public function StarEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			var mat:MovieParticleMaterial = new MovieParticleMaterial(new Star());
			var cubeZone:CubeZone = new CubeZone( -300, -300, -300, 600, 600, 600);
			addInitializer(new Position3D(cubeZone));
			addInitializer(new PV3DParticle([mat]));
			addInitializer(new Life(new UniformRandom(120, 0)));
			addInitializer(new Rotation3D(null, null, new UniformRandom(0, 180)));
			addInitializer(new Scale(new UniformRandom(2, 0.5)));
			addInitializer(new Omega3D(null, null, new UniformRandom(0, 3)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Spin3D());
			actions.addAction(new ScaleCurve(15, 15));
		}
	}
}