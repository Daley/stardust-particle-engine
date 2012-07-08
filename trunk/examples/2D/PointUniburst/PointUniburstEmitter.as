package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Oriented;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	
	public class PointUniburstEmitter extends Emitter2D {
		
		public function PointUniburstEmitter(clock:Clock) {
			super(clock);
			
			//actions
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Move());
			addAction(new Oriented());
			addAction(new ScaleCurve(0, 70));
		}
	}
}
