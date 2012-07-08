package  {
	import de.nulldesign.nd3d.material.PixelMaterial;
	import de.nulldesign.nd3d.objects.SimpleCube;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.threeD.actions.Deflect3D;
	import idv.cjcat.stardust.threeD.actions.Gravity3D;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.MutualGravity3D;
	import idv.cjcat.stardust.threeD.actions.Oriented3D;
	import idv.cjcat.stardust.threeD.deflectors.BoundingSphere;
	import idv.cjcat.stardust.threeD.fields.RadialField3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.nd3d.initializers.ND3DObject3DClass;
	import idv.cjcat.stardust.threeD.zones.SphereShell;
	import idv.cjcat.stardust.threeD.zones.SphereZone;
	
	public class SwarmEmitter extends PausibleEmitter3D {
		
		public function SwarmEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			var mat:PixelMaterial = new PixelMaterial(0, 1, 3);
			addInitializer(new ND3DObject3DClass(SimpleCube, [mat, 10]));
			addInitializer(new Position3D(new SphereZone(0, 0, 0, 200)));
			addInitializer(new Velocity3D(new SphereShell(0, 0, 0, 1, 1.5)));
			
			//actions
			var deflect:Deflect3D = new Deflect3D();
			deflect.addDeflector(new BoundingSphere(0, 0, 0, 250));
			var gravity:Gravity3D = new Gravity3D();
			gravity.addField(new RadialField3D(0, 0, 0, -1));
			actions.addAction(deflect);
			//actions.addAction(gravity);
			actions.addAction(new Move3D());
			actions.addAction(new MutualGravity3D(2, 200, 1));
			actions.addAction(new MutualGravity3D( -5, 200, 2));
			//actions.addAction(new Damping3D(0.001));
			actions.addAction(new Oriented3D(0.5));
		}
	}
}