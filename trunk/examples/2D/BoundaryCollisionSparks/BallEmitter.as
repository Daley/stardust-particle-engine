package   {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.CompositeAction;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.CollisionRadius;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Mask;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Deflect;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Spawn;
	import idv.cjcat.stardust.twoD.actions.triggers.DeflectorTrigger;
	import idv.cjcat.stardust.twoD.deflectors.BoundingCircle;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.CircleZone;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	
	public class BallEmitter extends Emitter2D {
		
		public function BallEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			addInitializer(new Mask(1));
			addInitializer(new DisplayObjectClass(Ball));
			addInitializer(new Position(new CircleZone(320, 240, 100)));
			addInitializer(new Velocity(new LazySectorZone(3, 0)));
			addInitializer(new CollisionRadius(10));
			
			//spark initializers
			var spawn:Spawn = new Spawn(new UniformRandom(50, 0));
			spawn.addInitializer(new Mask(2));
			spawn.addInitializer(new DisplayObjectClass(Spark));
			spawn.addInitializer(new Life(new UniformRandom(30, 10)));
			spawn.addInitializer(new Velocity(new LazySectorZone(3.5, 0.5)));
			spawn.addInitializer(new CollisionRadius(5));
			spawn.addInitializer(new Scale(new UniformRandom(0.6, 0.2)));
			
			//deflector
			var circle:BoundingCircle = new BoundingCircle(320, 240, 150);
			
			//trigger
			var trigger:DeflectorTrigger = new DeflectorTrigger(circle);
			trigger.mask = 1;
			trigger.addAction(spawn);
			
			//deflect
			var deflect:Deflect = new Deflect();
			deflect.addDeflector(circle);
			
			//common actions
			var commonActions:CompositeAction = new CompositeAction();
			commonActions.mask = 1 | 2;
			commonActions.addAction(new Move());
			commonActions.addAction(deflect);
			
			//spark actions
			var sparkActions:CompositeAction = new CompositeAction();
			sparkActions.mask = 2;
			sparkActions.addAction(new Age());
			sparkActions.addAction(new DeathLife());
			sparkActions.addAction(new ScaleCurve(0, 20));
			
			addAction(commonActions);
			addAction(trigger);
			addAction(sparkActions);
		}
	}
}