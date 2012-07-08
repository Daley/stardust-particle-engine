﻿package  {
	import idv.cjcat.stardust.common.actions.CompositeAction;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.CollisionRadius;
	import idv.cjcat.stardust.common.initializers.CompositeInitializer;
	import idv.cjcat.stardust.common.initializers.Mask;
	import idv.cjcat.stardust.common.initializers.SwitchInitializer;
	import idv.cjcat.stardust.twoD.actions.Collide;
	import idv.cjcat.stardust.twoD.actions.Deflect;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.deflectors.BoundingBox;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	
	public class BallEmitter extends Emitter2D {
		
		public function BallEmitter(clock:Clock) {
			super(clock);
			
			//initializers
			var redInit:CompositeInitializer = new CompositeInitializer();
			var greenInit:CompositeInitializer = new CompositeInitializer();
			var blueInit:CompositeInitializer = new CompositeInitializer();
			redInit.addInitializer(new Mask(1 | 2 | 4));
			redInit.addInitializer(new DisplayObjectClass(RedBall));
			greenInit.addInitializer(new Mask(2));
			greenInit.addInitializer(new DisplayObjectClass(GreenBall));
			blueInit.addInitializer(new Mask(4));
			blueInit.addInitializer(new DisplayObjectClass(BlueBall));
			addInitializer(new SwitchInitializer([redInit, greenInit, blueInit], [1, 1, 1]));
			addInitializer(new CollisionRadius(20));
			addInitializer(new Position(new RectZone(0, 60, 640, 360)));
			addInitializer(new Velocity(new LazySectorZone(2, 1.5)));
			
			//actions
			var actions:CompositeAction = new CompositeAction();
			actions.mask = 1 | 2 | 4;
			var boundingBox:BoundingBox = new BoundingBox(0, 60, 640, 360);
			var deflect:Deflect = new Deflect();
			deflect.addDeflector(boundingBox);
			actions.addAction(deflect);
			actions.addAction(new Move());
			actions.addAction(new Collide());
			addAction(actions);
		}
	}
}