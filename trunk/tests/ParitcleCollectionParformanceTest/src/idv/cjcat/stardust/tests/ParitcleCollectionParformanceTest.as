package idv.cjcat.stardust.tests {
	import com.bit101.components.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import idv.cjcat.stardust.common.particles.*;
	import idv.cjcat.stardust.twoD.particles.*;
	
	[SWF(backgroundColor="#FFFFFF", width=300, height=400, frameRate=60)]
	public class ParitcleCollectionParformanceTest extends Sprite {
		
		private const LENGTH:int = 10000;
		
		private var particles:Array = new Array(LENGTH);
		
		private var startBtn:PushButton;
		private var outputLabel:Label;
		
		public function ParitcleCollectionParformanceTest() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			new PushButton(this, 10, 10, "Start Tests", startTests);
			outputLabel = new Label(this, 20, 30);
			
			for (var i:int = 0; i < LENGTH; i++) {
				var p:Particle2D = new Particle2D();
				p.x = Math.random();
				particles[i] = p;
			}
		}
		
		private function startTests(e:Event):void {
			outputLabel.text = "";
			
			var pcClasses:Array = 
				[
					ParticleArray, 
					ParticleFastArray, 
					ParticleList
				];
			
			for each (var pcClass:Class in pcClasses) {
				traverse(new pcClass());
				splice(new pcClass());
				sort(new pcClass());
			}
		}
		
		
		//------------------------------------------------------------------------------------------------
		
		
		private function traverse(pc:ParticleCollection):void {
			dumpParticles(pc);
			
			var p:Particle;
			var iter:ParticleIterator = pc.getIterator();
			
			var t:int = getTimer();
			while (p = iter.particle) {
				iter.next();
			}
			println(pc + "\n Traversal: " + (getTimer() - t) + "ms\n" + "------------------");
		}
		
		private function splice(pc:ParticleCollection):void {
			dumpParticles(pc);
			
			var p:Particle;
			var iter:ParticleIterator = pc.getIterator();
			
			var t:int = getTimer();
			while (p = iter.particle) {
				iter.remove();
			}
			println(pc + "\n Splicing: " + (getTimer() - t) + "ms\n" + "------------------");
		}
		
		private function sort(pc:ParticleCollection):void {
			dumpParticles(pc);
			
			var iter:ParticleIterator = pc.getIterator();
			
			var t:int = getTimer();
			pc.sort();
			println(pc + "\n Sorting: " + (getTimer() - t) + "ms\n" + "------------------");
		}
		
		
		//------------------------------------------------------------------------------------------------
		
		
		private function dumpParticles(pc:ParticleCollection):void {
			for each (var p:Particle in particles) {
				pc.add(p);
			}
		}
		
		private function println(text:String = ""):void {
			outputLabel.text += text + "\n";
		}
	}
}