package  {
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Color;
	import idv.cjcat.stardust.common.initializers.Mass;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Deflect;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.SpeedLimit;
	import idv.cjcat.stardust.twoD.deflectors.WrappingBox;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.BitmapField;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	
	public class PixelEmitter extends Emitter2D {
		
		public var field:BitmapField;
		
		public function PixelEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			addInitializer(new Color(0x33CCFF));
			addInitializer(new Position(new RectZone(0, 0, 640, 480)));
			addInitializer(new Mass(new UniformRandom(5, 2)));
			
			//actions
			field = new BitmapField(0, 60);
			field.massless = false;
			field.scaleX = field.scaleY = 2;
			var gravity:Gravity = new Gravity();
			gravity.addField(field);
			var deflect:Deflect = new Deflect();
			deflect.addDeflector(new WrappingBox(0, 0, 640, 480));
			addAction(gravity);
			addAction(deflect);
			addAction(new Move());
			addAction(new SpeedLimit(2));
		}
	}
}