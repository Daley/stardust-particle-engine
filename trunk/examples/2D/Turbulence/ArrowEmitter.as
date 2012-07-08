package {
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Mass;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Deflect;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Oriented;
	import idv.cjcat.stardust.twoD.actions.SpeedLimit;
	import idv.cjcat.stardust.twoD.deflectors.WrappingBox;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.BitmapField;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	
	public class ArrowEmitter extends Emitter2D {
		
		public var bmpField:BitmapField;
		
		public function ArrowEmitter(clock:Clock) {
			super(clock);
			
			bmpField = new BitmapField();
			bmpField.max = 1;
			bmpField.scaleX = bmpField.scaleY = 2;
			bmpField.massless = false;
			
			//initializers
			addInitializer(new DisplayObjectClass(FastArrow));
			addInitializer(new Position(new RectZone(0, 0, 640, 480)));
			addInitializer(new Velocity(new LazySectorZone(4, 0.5)));
			addInitializer(new Mass(new UniformRandom(1, 0.2)));
			
			//actions
			var deflect:Deflect = new Deflect();
			deflect.addDeflector(new WrappingBox(0, 0, 640, 480));
			var gravity:Gravity = new Gravity();
			gravity.addField(bmpField);
			addAction(deflect);
			addAction(gravity);
			addAction(new Move());
			addAction(new Oriented());
			addAction(new SpeedLimit(6));
		}
	}
}