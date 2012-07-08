package {
	import flash.display.Sprite;
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.CompositeAction;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.actions.triggers.DeathTrigger;
	import idv.cjcat.stardust.common.actions.triggers.LifeTrigger;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Mask;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Damping;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Spawn;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.UniformField;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectParent;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class FireworksEmitter extends Emitter2D {
		
		public function FireworksEmitter(clock:Clock, sparkHeadContainer:Sprite) {
			super(clock);
			
			var trailSpawn:Spawn = new Spawn(new UniformRandom(1, 0));
			trailSpawn.addInitializer(new Mask(2));
			trailSpawn.addInitializer(new DisplayObjectClass(SparkTrail));
			trailSpawn.addInitializer(new Life(new UniformRandom(30, 5)));
			trailSpawn.addInitializer(new Scale(new UniformRandom(1, 0.4)));
			var headLifeTrigger:LifeTrigger = new LifeTrigger();
			headLifeTrigger.mask = 1;
			headLifeTrigger.triggerEvery = 3;
			headLifeTrigger.addAction(trailSpawn);
			
			var afterSparkSpawn:Spawn = new Spawn(new UniformRandom(6, 0));
			afterSparkSpawn.addInitializer(new Mask(4));
			afterSparkSpawn.addInitializer(new DisplayObjectClass(AfterSpark));
			afterSparkSpawn.addInitializer(new Velocity(new LazySectorZone(8, 2)));
			afterSparkSpawn.addInitializer(new Life(new UniformRandom(40, 15)));
			afterSparkSpawn.addInitializer(new Scale(new UniformRandom(1, 0.4)));
			var headDeathTrigger:DeathTrigger = new DeathTrigger();
			headDeathTrigger.mask = 1;
			headDeathTrigger.addAction(afterSparkSpawn);
			
			//initializers
			//action masks are by default 1
			addInitializer(new DisplayObjectParent(sparkHeadContainer));
			addInitializer(new DisplayObjectClass(SparkHead));
			addInitializer(new Position(new SinglePoint(320, 200)));
			addInitializer(new Velocity(new LazySectorZone(15, 3)));
			addInitializer(new Life(new UniformRandom(50, 10)));
			addInitializer(new Scale(new UniformRandom(1, 0.1)));
			
			//actions
			var gravity:Gravity = new Gravity();
			gravity.addField(new UniformField(0, 0.075));
			var commonActions:CompositeAction = new CompositeAction();
			commonActions.mask = 1 | 2 | 4;
			commonActions.addAction(gravity);
			commonActions.addAction(new Age());
			commonActions.addAction(new DeathLife());
			commonActions.addAction(new Move());
			commonActions.addAction(new ScaleCurve(0, 10));
			commonActions.addAction(new Damping(0.1));
			addAction(commonActions);
			addAction(headLifeTrigger);
			addAction(headDeathTrigger);
		}
	}
}