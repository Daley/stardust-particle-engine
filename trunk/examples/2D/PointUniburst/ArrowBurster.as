package {
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.bursters.PointUniburster;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	
	public class ArrowBurster extends PointUniburster {
		
		public function ArrowBurster() {
			count = 5;
			x = 320;
			y = 240;
			speed = 5;
			
			addInitializer(new DisplayObjectClass(Arrow));
			addInitializer(new Life(new UniformRandom(60, 0)));
		}
	}
}