package {
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.SwitchInitializer;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Rotation;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class MultisourceEmitter extends Emitter2D {
		
		public var points:Array;
		
		private var point1:SinglePoint;
		private var point2:SinglePoint;
		private var point3:SinglePoint;
		private var position1:Position;
		private var position2:Position;
		private var position3:Position;
		private var switchInit:SwitchInitializer;
		
		public function MultisourceEmitter(clock:Clock) {
			super(clock);
			
			point1 = new SinglePoint();
			point2 = new SinglePoint();
			point3 = new SinglePoint();
			points = [point1, point2, point3];
			position1 = new Position(point1);
			position2 = new Position(point2);
			position3 = new Position(point3);
			switchInit = new SwitchInitializer([position1, position2, position3], [1, 1, 1]);
			
			//initializers
			addInitializer(new DisplayObjectClass(Square));
			addInitializer(switchInit);
			addInitializer(new Life(new UniformRandom(30, 5)));
			addInitializer(new Velocity(new LazySectorZone(0.9, 0.3)));
			addInitializer(new Rotation(new UniformRandom(0, 180)));
			
			//actions
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Move());
			addAction(new ScaleCurve(0, 10));
			
			//set names
			point1.name = "point1";
			point2.name = "point2";
			point3.name = "point3";
		}
	}
}