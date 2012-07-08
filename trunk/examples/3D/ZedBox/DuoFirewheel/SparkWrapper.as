package {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.twoD.display.StardustSprite;
	
	public class SparkWrapper extends StardustSprite {
		
		private var spark:Spark;
		
		public function SparkWrapper() {
			spark = new Spark();
			addChild(spark);
		}
		
		override public function update(emitter:Emitter, particle:Particle, time:Number):void {
			if (spark.currentFrame != spark.totalFrames) spark.nextFrame();
		}
	}
}