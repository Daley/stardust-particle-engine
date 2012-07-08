package {
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.twoD.actions.DeathZone;
	import idv.cjcat.stardust.twoD.actions.Explode;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	
	public class ExplosionEmitter extends Emitter2D {
		
		public var explode:Explode;
		
		public function ExplosionEmitter(clock:Clock) {
			super(clock);
			
			//actions
			explode = new Explode(0, 0, 3, 10, 640);
			addAction(explode);
			addAction(new Move());
			addAction(new DeathZone(new RectZone(0 - 10, 0 - 10, 640 + 10, 490 + 10), true));
		}
	}
}