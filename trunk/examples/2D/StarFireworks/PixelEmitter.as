package  {
	import flash.display.BitmapData;
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.AlphaCurve;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Color;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.UniformField;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.BitmapZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class PixelEmitter extends Emitter2D {
		
		public function PixelEmitter(clock:Clock, positionBitmap:BitmapData, color:uint) {
			super(clock);
			
			//initializers
			var bitmapZoneScale:Number = 0.0125;
			var bitmapZone:BitmapZone = new BitmapZone(positionBitmap);
			bitmapZone.x = bitmapZoneScale * (-0.5 * positionBitmap.width);
			bitmapZone.y = -6 + bitmapZoneScale * (-positionBitmap.height);
			bitmapZone.scaleX = bitmapZone.scaleY = bitmapZoneScale;
			addInitializer(new Color(color));
			addInitializer(new Position(new SinglePoint(320, 480)));
			addInitializer(new Velocity(bitmapZone));
			addInitializer(new Life(new UniformRandom(120, 30)));
			
			//actions
			var gravity:Gravity = new Gravity();
			gravity.addField(new UniformField(0, 0.1));
			addAction(gravity);
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Move());
			addAction(new AlphaCurve(0, 60));
		}
	}
}