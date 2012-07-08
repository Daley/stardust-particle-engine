package  {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Damping;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Rotation;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class StarEmitter extends Emitter2D {
		
		public function StarEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			addInitializer(new DisplayObjectClass(Star));
			addInitializer(new Position(new SinglePoint(320, 240)));
			addInitializer(new Velocity(new LazySectorZone(10, 4)));
			addInitializer(new Life(new UniformRandom(50, 5)));
			addInitializer(new Rotation(new UniformRandom(0, 180)));
			
			//actions
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Move());
			addAction(new Damping(0.1));
			addAction(new ScaleCurve(0, 20));
		}
	}
}