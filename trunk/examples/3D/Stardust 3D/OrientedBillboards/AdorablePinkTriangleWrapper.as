package {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.twoD.display.StardustSprite;
	
	public class AdorablePinkTriangleWrapper extends StardustSprite {
		
		private var triangle:AdorablePinkTriangle;
		
		public function AdorablePinkTriangleWrapper() {
			triangle = new AdorablePinkTriangle();
			addChild(triangle);
		}
		
		override public function update(emitter:Emitter, particle:Particle, time:Number):void {
			if (triangle.currentFrame != triangle.totalFrames) triangle.nextFrame();
		}
	}
}