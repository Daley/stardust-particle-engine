﻿package {
	import flash.display.BitmapData;
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Rotation;
	import idv.cjcat.stardust.twoD.zones.BitmapZone;
	
	public class BitmapZoneEmitter extends Emitter2D {
		
		private var _bmpd:BitmapData;
		public function BitmapZoneEmitter(clock:Clock, bitmapData:BitmapData, x:Number, y:Number) {
			super(clock);
			_bmpd = bitmapData
			
			//initializers
			var bmpZone:BitmapZone = new BitmapZone(bitmapData, x, y);
			bmpZone.update(bitmapData);
			addInitializer(new DisplayObjectClass(Square));
			addInitializer(new Position(bmpZone));
			addInitializer(new Rotation(new UniformRandom(0, 180)));
			addInitializer(new Life(new UniformRandom(70, 0)));
			
			//actions
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new ScaleCurve(10, 10));
		}
	}
}