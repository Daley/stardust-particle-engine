package {
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.CollisionRadius;
	import idv.cjcat.stardust.common.initializers.Mass;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Collide3D;
	import idv.cjcat.stardust.threeD.actions.Deflect3D;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.Oriented3D;
	import idv.cjcat.stardust.threeD.deflectors.BoundingCube;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.papervision3d.initializers.PV3DDisplayObject3DClass;
	import idv.cjcat.stardust.threeD.zones.CubeZone;
	import idv.cjcat.stardust.threeD.zones.SphereZone;
	import org.papervision3d.core.proto.LightObject3D;
	import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.primitives.Cube;
	
	public class CubeEmitter extends PausibleEmitter3D {
		
		public var light:LightObject3D;
		
		public function CubeEmitter(clock:Clock) {
			super(clock);
			
			var cubeZone:CubeZone = new CubeZone( -320, -320, -320, 640, 640, 640);
			var sphereZone:SphereZone = new SphereZone(0, 0, 0, 10);
			var displayObject3DClass:PV3DDisplayObject3DClass = new PV3DDisplayObject3DClass(Cube);
			light= new LightObject3D();
			light.y = 600;
			light.z = -600;
			var mat:FlatShadeMaterial = new FlatShadeMaterial(light, 0x508DC5, 0x336699);
			displayObject3DClass.constructorParams = [new MaterialsList( { all:mat } ), 40, 40, 40];
			var position:Position3D = new Position3D(cubeZone);
			var velocity:Velocity3D = new Velocity3D(sphereZone);
			var scale:Scale = new Scale(new UniformRandom(1.3, 0.5));
			var radius:CollisionRadius = new CollisionRadius(20);
			var mass:Mass = new Mass(new UniformRandom(1, 0));
			
			//initializers
			addInitializer(displayObject3DClass);
			addInitializer(new Position3D(cubeZone));
			addInitializer(new Velocity3D(sphereZone));
			addInitializer(new Scale(new UniformRandom(1.3, 0.5)));
			addInitializer(new CollisionRadius(20));
			addInitializer(new Mass(new UniformRandom(1, 0)));
			
			//actions
			var deflect:Deflect3D = new Deflect3D();
			deflect.addDeflector(new BoundingCube( -320, -320, -320, 640, 640, 640));
			actions.addAction(deflect);
			actions.addAction(new Move3D());
			actions.addAction(new Oriented3D(0.75));
			actions.addAction(new Collide3D());
		}
	}
}