package {
	import flare.basic.Scene3D;
	import flare.loaders.Flare3DLoader;
	import flash.events.Event;
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Damping3D;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.Spin3D;
	import idv.cjcat.stardust.threeD.flare3d.initializers.Flare3DPivot3DClone;
	import idv.cjcat.stardust.threeD.initializers.Omega3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Rotation3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.zones.SinglePoint3D;
	import idv.cjcat.stardust.threeD.zones.SphereShell;
	
	public class StarEmitter extends PausibleEmitter3D {
		
		private var loaderScene:Scene3D;
		private var loader:Flare3DLoader;
		
		public function StarEmitter(scene:Scene3D) {
			super(new SteadyClock(0.1));
			
			loaderScene = scene;
			loaderScene.addEventListener(Scene3D.COMPLETE_EVENT, onComplete);
			loader = loaderScene.addChildFromFile("Star.f3d");
		}
		
		private function onComplete(e:Event):void {
			loaderScene.removeChild(loader);
			
			var random10:Random = new UniformRandom(0, 5);
			var random360:Random = new UniformRandom(0, 180);
			
			//apparently setting a Pivot3D object's scale to zero causes error, so I used 0.1 instead
			var scaleCurve:ScaleCurve = new ScaleCurve(5, 20);
			scaleCurve.inScale = 0.1;
			scaleCurve.outScale = 0.1;
			
			
			//initializers
			addInitializer(new Flare3DPivot3DClone(loader));
			addInitializer(new Position3D(new SinglePoint3D(0, 0, 0)));
			addInitializer(new Rotation3D(random360, random360, random360));
			addInitializer(new Velocity3D(new SphereShell(0, 0, 0, 3, 7)));
			addInitializer(new Omega3D(random10, random10, random10));
			addInitializer(new Life(new UniformRandom(100, 20)));
			addInitializer(new Scale(new UniformRandom(1, 0.7)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Move3D());
			actions.addAction(new Spin3D());
			actions.addAction(new Damping3D(0.1));
			actions.addAction(scaleCurve);
		}
	}
}