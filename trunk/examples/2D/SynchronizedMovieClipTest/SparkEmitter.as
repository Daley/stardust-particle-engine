package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Oriented;
	import idv.cjcat.stardust.twoD.actions.StardustSpriteUpdate;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.BitmapField;
	import idv.cjcat.stardust.twoD.initializers.PooledDisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.StardustSpriteInit;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.CircleZone;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	
	public class SparkEmitter extends Emitter2D {
		
		public var bmpField:BitmapField;
		public var stardustSpriteUpdate:StardustSpriteUpdate;
		
		public function SparkEmitter(clock:Clock) {
			super(clock);
			
			bmpField = new BitmapField();
			bmpField.max = 2;
			bmpField.massless = false;
			
			stardustSpriteUpdate = new StardustSpriteUpdate();
			
			//initializers
			addInitializer(new PooledDisplayObjectClass(Spark));
			addInitializer(new StardustSpriteInit());
			addInitializer(new Position(new CircleZone(320, 240, 30)));
			addInitializer(new Velocity(new LazySectorZone(5, 1)));
			addInitializer(new Life(new UniformRandom(30, 5)));
			
			//actions
			var gravity:Gravity = new Gravity();
			gravity.addField(bmpField);
			addAction(gravity);
			addAction(stardustSpriteUpdate);
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Move());
			addAction(new ScaleCurve(5, 10));
			addAction(new Oriented());
		}
	}
}