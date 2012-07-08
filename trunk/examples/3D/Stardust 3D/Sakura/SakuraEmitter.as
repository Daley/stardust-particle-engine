﻿package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.AlphaCurve;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.StardustSpriteUpdate3D;
	import idv.cjcat.stardust.threeD.initializers.DisplayObjectClass3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.zones.CubeZone;
	
	public class SakuraEmitter extends PausibleEmitter3D {
		
		public function SakuraEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			addInitializer(new DisplayObjectClass3D(SakuraPetalWrapper));
			addInitializer(new Life(new UniformRandom(120, 40)));
			addInitializer(new Position3D(new CubeZone( -200, -900, -200, 1600, 300, 1600)));
			addInitializer(new Velocity3D(new CubeZone( -30, 10, -30, 30, 10, 30)));
			addInitializer(new Scale(new UniformRandom(1.4, 0.3)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new Move3D());
			actions.addAction(new DeathLife());
			actions.addAction(new StardustSpriteUpdate3D());
			actions.addAction(new AlphaCurve(15, 15));
		}
	}
}