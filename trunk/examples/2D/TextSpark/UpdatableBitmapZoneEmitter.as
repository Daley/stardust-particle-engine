﻿package {
	import flash.display.BitmapData;
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Oriented;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.UniformField;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.BitmapZone;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	
	public class UpdatableBitmapZoneEmitter extends Emitter2D {
		
		private var _bmpZone:BitmapZone;
		public function UpdatableBitmapZoneEmitter(clock:Clock, x:Number, y:Number, scaleX:Number, scaleY:Number) {
			super(clock);
			
			//initializers
			var sectorZone:LazySectorZone = new LazySectorZone(3, 0.3);
			_bmpZone = new BitmapZone(null, x, y, scaleX, scaleY);
			addInitializer(new DisplayObjectClass(Spark));
			addInitializer(new Position(_bmpZone));
			addInitializer(new Life(new UniformRandom(15, 3)));
			addInitializer(new Velocity(sectorZone));
			
			//actions
			var gravity:Gravity = new Gravity();
			gravity.addField(new UniformField(0, 0.2));
			addAction(gravity);
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Move());
			addAction(new Oriented());
			addAction(new ScaleCurve(0, 15));
		}
		
		public function update(bitmapData:BitmapData):void {
			_bmpZone.update(bitmapData);
		}
	}
}