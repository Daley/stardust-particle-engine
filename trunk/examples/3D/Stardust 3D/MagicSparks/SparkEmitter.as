package  {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.CompositeAction;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.actions.triggers.DeathTrigger;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Mask;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Damping3D;
	import idv.cjcat.stardust.threeD.actions.Gravity3D;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.Spawn3D;
	import idv.cjcat.stardust.threeD.actions.Spin3D;
	import idv.cjcat.stardust.threeD.fields.UniformField3D;
	import idv.cjcat.stardust.threeD.initializers.DisplayObjectClass3D;
	import idv.cjcat.stardust.threeD.initializers.Omega3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Rotation3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.zones.SinglePoint3D;
	import idv.cjcat.stardust.threeD.zones.SphereShell;
	
	public class SparkEmitter extends PausibleEmitter3D {
		
		public function SparkEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			addInitializer(new Mask(1 | 2));
			addInitializer(new DisplayObjectClass3D(SparkSeed));
			addInitializer(new Life(new UniformRandom(50, 10)));
			addInitializer(new Position3D(new SinglePoint3D(0, -50, 0)));
			addInitializer(new Velocity3D(new SphereShell(0, 0, 0, 20, 40)));
			
			//common actions
			actions.mask = 1 | 2 | 4
			actions.checkComponentMasks = true;
			var commonActions:CompositeAction = new CompositeAction();
			commonActions.mask = 1;
			var gravity:Gravity3D = new Gravity3D();
			gravity.addField(new UniformField3D(0, 0.2, 0));
			commonActions.addAction(gravity);
			commonActions.addAction(new Age());
			commonActions.addAction(new DeathLife());
			commonActions.addAction(new Move3D());
			commonActions.addAction(new Spin3D());
			commonActions.addAction(new Damping3D(0.05));
			actions.addAction(commonActions);
			
			//SparkSeed actions
			var spawn:Spawn3D = new Spawn3D(new UniformRandom(3, 1));
			spawn.addInitializer(new Mask(1 | 4));
			spawn.addInitializer(new DisplayObjectClass3D(Spark));
			spawn.addInitializer(new Life(new UniformRandom(50, 10)));
			spawn.addInitializer(new Velocity3D(new SphereShell(0, 0, 0, 30, 40)));
			spawn.addInitializer(new Rotation3D(null, null, new UniformRandom(0, 180)));
			spawn.addInitializer(new Omega3D(null, null, new UniformRandom(0, 5)));
			var deathTrigger:DeathTrigger = new DeathTrigger();
			deathTrigger.addAction(spawn);
			deathTrigger.mask = 2;
			var scaleCurve:ScaleCurve = new ScaleCurve(0, 10);
			scaleCurve.mask = 4;
			actions.addAction(deathTrigger);
			actions.addAction(scaleCurve);
		}
	}
}