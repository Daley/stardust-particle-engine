package {
	import flare.basic.Scene3D;
	import flare.core.Texture3D;
	import flare.materials.SpriteTextureMaterial;
	import flash.display.BlendMode;
	import flash.events.Event;
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.threeD.actions.Move3D;
	import idv.cjcat.stardust.threeD.actions.RandomDrift3D;
	import idv.cjcat.stardust.threeD.flare3d.initializers.Flare3DSprite3D;
	import idv.cjcat.stardust.threeD.initializers.Position3D;
	import idv.cjcat.stardust.threeD.initializers.Velocity3D;
	import idv.cjcat.stardust.threeD.zones.SphereZone;
	
	public class FireflyEmitter extends PausibleEmitter3D {
		
		private var loaderScene:Scene3D;
		private var texture:Texture3D;
		private var material:SpriteTextureMaterial;
		
		private var h:ParticleHandler;
		
		public function FireflyEmitter(scene:Scene3D, particleHandler:ParticleHandler) {
			super(new SteadyClock(0.5));
			
			loaderScene = scene;
			loaderScene.addEventListener(Scene3D.COMPLETE_EVENT, onComplete);
			texture = loaderScene.addTextureFromFile("firefly.jpg");
			
			h = particleHandler;
		}
		
		private function onComplete(e:Event):void {
			material = new SpriteTextureMaterial("fireflies", texture, BlendMode.SCREEN);
			
			var random10:Random = new UniformRandom(0, 5);
			var random360:Random = new UniformRandom(0, 180);
			
			//apparently setting a Pivot3D object's scale to zero causes error, so I used 0.1 instead
			var scaleCurve:ScaleCurve = new ScaleCurve(5, 20);
			scaleCurve.inScale = 0.1;
			scaleCurve.outScale = 0.1;
			
			//initializers
			addInitializer(new Flare3DSprite3D(material));
			addInitializer(new Position3D(new SphereZone(0, 0, 0, 200)));
			addInitializer(new Velocity3D(new SphereZone(0, 0, 0, 1)));
			addInitializer(new Life(new UniformRandom(100, 20)));
			addInitializer(new Scale(new UniformRandom(10, 5)));
			
			//actions
			actions.addAction(new Age());
			actions.addAction(new DeathLife());
			actions.addAction(new Move3D());
			actions.addAction(new RandomDrift3D(0.1, 0.1, 0.1));
			actions.addAction(scaleCurve);
			
			particleHandler = h;
		}
	}
}