package {
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Mass;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.DeathZone;
	import idv.cjcat.stardust.twoD.actions.Deflect;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Oriented;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.BitmapField;
	import idv.cjcat.stardust.twoD.fields.UniformField;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.Line;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	
	public class RainEmitter extends Emitter2D {
		
		public var bmpField:BitmapField;
		
		public function RainEmitter(clock:Clock, obstacle:Obstacle) {
			super(clock);
			
			bmpField = new BitmapField();
			bmpField.max = 0.5;
			bmpField.massless = false; RainEmitter
			bmpField.scaleX = bmpField.scaleY = 4;
			
			//initializers
			var sector:LazySectorZone = new LazySectorZone(2, 1);
			sector.direction.set( -2, 1);
			sector.directionVar = 20;
			addInitializer(new DisplayObjectClass(Rain));
			addInitializer(new Position(new Line(0, 0, 1280, 0)));
			addInitializer(new Velocity(new LazySectorZone(4, 0.5)));
			addInitializer(new Mass(new UniformRandom(1, 0.5)));
			addInitializer(new Scale(new UniformRandom(1, 0.5)));
			
			//actions
			var gravity:Gravity = new Gravity();
			gravity.addField(bmpField);
			var deflect:Deflect = new Deflect();
			deflect.addDeflector(obstacle.circleDeflector);
			gravity.addField(new UniformField( -0.5, 0.25));
			addAction(gravity);
			addAction(deflect);
			addAction(new Move());
			addAction(new Oriented());
			addAction(new DeathZone(new RectZone(0, 0, 1280, 480), true));
		}
	}
}