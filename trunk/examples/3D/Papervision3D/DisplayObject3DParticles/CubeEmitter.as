package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Rotation3D;
	import idv.cjcat.stardust.threeD.papervision3d.initializers.PV3DDisplayObject3DClass;
	import idv.cjcat.stardust.threeD.zones.CubeZone;
	import org.papervision3d.core.proto.LightObject3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.primitives.Cube;
	
	public class CubeEmitter extends PausibleEmitter3D {
		
		public var light:LightObject3D;
		
		public function CubeEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			var cubeZone:CubeZone = new CubeZone( -300, -300, -300, 600, 600, 600);
			var displayObject3DClass:PV3DDisplayObject3DClass = new PV3DDisplayObject3DClass(Cube);
			light = new LightObject3D();
			light.y = 600;
			light.z = -600;
			var mat:FlatShadeMaterial = new FlatShadeMaterial(light, 0xF9C330, 0xF09400);
			displayObject3DClass.constructorParams = [new MaterialsList( { all:mat } ), 40, 40, 40];
			
			
			//iniitializers
			addInitializer(displayObject3DClass);
			addInitializer(new Position3D(cubeZone));
			addInitializer(new Life(new UniformRandom(60, 0)));
			addInitializer(new Rotation3D(new UniformRandom(0, 180), new UniformRandom(0, 180), new UniformRandom(0, 180)));
			addInitializer(new Scale(new UniformRandom(2, 0.5)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new ScaleCurve(10, 10));
		}
	}
}