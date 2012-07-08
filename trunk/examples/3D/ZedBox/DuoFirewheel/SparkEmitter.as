package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Deflect3D;
	import idv.cjcat.stardust.threeD.actions.Gravity3D;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.Oriented3D;
	import idv.cjcat.stardust.threeD.fields.RadialField3D;
	import idv.cjcat.stardust.threeD.fields.UniformField3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.zedbox.actions.ZBBillboardOriented;
	import idv.cjcat.stardust.threeD.zedbox.actions.ZBStardustSpriteUpdate;
	import idv.cjcat.stardust.threeD.zedbox.initializers.ZBDisplayObjectClass;
	import idv.cjcat.stardust.threeD.zones.DiskZone;
	
	public class SparkEmitter extends PausibleEmitter3D {
		
		public function SparkEmitter(clock:Clock, particleHandler:ParticleHandler) {
			super(clock);
			
			//initiailizers
			addInitializer(new Handler(particleHandler));
			addInitializer(new ZBDisplayObjectClass(SparkWrapper));
			addInitializer(new Life(new UniformRandom(30, 5)));
			var disk:DiskZone = new DiskZone(0, 0, 0);
			disk.maxRadius = 1;
			addInitializer(new Position3D(disk));
			
			//actions
			var gravity:Gravity3D = new Gravity3D();
			gravity.addField(new RadialField3D(0, 0, 0, 0.2));
			gravity.addField(new VortexField3D(0.4));
			gravity.addField(new UniformField3D(0, 0.05, 0));
			actions.addAction(gravity);
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Move3D());
			actions.addAction(new ScaleCurve(10, 15));
			actions.addAction(new ZBStardustSpriteUpdate());
			
			//this action cannot be paused
			//it must be executed non-stopped to properly update the billboards orientation
			addAction(new ZBBillboardOriented());
		}
	}
}