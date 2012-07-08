package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Spin3D;
	import idv.cjcat.stardust.threeD.emitters.Emitter3D;
	import idv.cjcat.stardust.threeD.initializers.Omega3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Rotation3D;
	import idv.cjcat.stardust.threeD.zedbox.initializers.ZBDisplayObjectClass;
	import idv.cjcat.stardust.threeD.zones.CubeZone;
	
	public class StarEmitter extends PausibleEmitter3D {
		
		public function StarEmitter(clock:Clock, particleHandler:ParticleHandler) {
			super(clock);
			
			//initializers
			addInitializer(new Handler(particleHandler));
			addInitializer(new ZBDisplayObjectClass(Star));
			addInitializer(new Position3D(new CubeZone( -300, -300, -300, 600, 600, 600)));
			addInitializer(new Life(new UniformRandom(200, 0)));
			addInitializer(new Rotation3D(null, null, new UniformRandom(0, 180)));
			addInitializer(new Scale(new UniformRandom(1.5, 0)));
			addInitializer(new Omega3D(null, null, new UniformRandom(0, 3)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Spin3D());
			actions.addAction(new ScaleCurve(15, 15));
		}
	}
}