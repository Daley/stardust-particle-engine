package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.Oriented3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.papervision3d.initializers.PV3DDisplayObject3DClass;
	import idv.cjcat.stardust.threeD.zones.SinglePoint3D;
	import idv.cjcat.stardust.threeD.zones.SphereZone;
	import org.papervision3d.core.proto.LightObject3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.objects.primitives.Cone;
	
	public class ConeEmitter extends PausibleEmitter3D {
		
		public var light:LightObject3D;
		
		public function ConeEmitter(clock:Clock) {
			super(clock);
			
			var displayObject3DClass:PV3DDisplayObject3DClass = new PV3DDisplayObject3DClass(Cone);
			light = new LightObject3D();
			light.y = 600;
			light.z = -600;
			var mat:FlatShadeMaterial = new FlatShadeMaterial(light, 0x33CC33, 0xF339933);
			displayObject3DClass.constructorParams = [mat, 15, 70, 4, 1];
			
			//initializers
			addInitializer(displayObject3DClass);
			addInitializer(new Position3D(new SinglePoint3D(0, 0, 0)));
			addInitializer(new Velocity3D(new SphereZone(0, 0, 0, 10)));
			addInitializer(new Life(new UniformRandom(45, 0)));
			addInitializer(new Scale(new UniformRandom(2, 0.5)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Move3D());
			actions.addAction(new Oriented3D());
			actions.addAction(new ScaleCurve(5, 10));
		}
	}
}