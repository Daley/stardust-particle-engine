package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.BillboardOriented;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.StardustSpriteUpdate3D;
	import idv.cjcat.stardust.threeD.initializers.DisplayObjectClass3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.zones.SinglePoint3D;
	import idv.cjcat.stardust.threeD.zones.SphereShell;
	
	public class AdorablePinkTriangleEmitter extends PausibleEmitter3D {
		
		public function AdorablePinkTriangleEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			addInitializer(new Position3D(new SinglePoint3D(0, 50, 0)));
			addInitializer(new DisplayObjectClass3D(AdorablePinkTriangleWrapper));
			addInitializer(new Velocity3D(new SphereShell(0, 0, 0, 3, 4)));
			addInitializer(new Life(new UniformRandom(100, 20)));
			addInitializer(new Scale(new UniformRandom(2, 0)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Move3D());
			actions.addAction(new ScaleCurve(10, 20));
			actions.addAction(new StardustSpriteUpdate3D());
			
			//this action cannot be paused
			//it must be executed non-stopped to properly update the billboards orientation
			addAction(new BillboardOriented());
		}
	}
}