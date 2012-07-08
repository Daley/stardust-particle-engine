﻿package  {
	import idv.cjcat.stardust.common.actions.CompositeAction;
	import idv.cjcat.stardust.common.actions.triggers.DeathTrigger;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Mask;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.DeathZone;
	import idv.cjcat.stardust.twoD.actions.Gravity;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Oriented;
	import idv.cjcat.stardust.twoD.actions.Spawn;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.fields.UniformField;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.Line;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class DripEmitter extends Emitter2D {
		
		public function DripEmitter(clock:Clock) {
			super(clock);
			
			//spawn
			var spawn:Spawn = new Spawn(new UniformRandom(4, 1));
			var lazySector:LazySectorZone = new LazySectorZone(2.5, 1.5);
			lazySector.direction.set(0, 1);
			lazySector.directionVar = 70;
			spawn.addInitializer(new Velocity(lazySector));
			spawn.addInitializer(new Position(new SinglePoint(0, -10))); //moves new particles up, avoiding death zone
			spawn.addInitializer(new Mask(2));
			spawn.addInitializer(new DisplayObjectClass(Drip));
			
			//initializers
			addInitializer(new Mask(1));
			addInitializer(new DisplayObjectClass(Drip));
			addInitializer(new Position(new Line(0, 60, 640, 60)));
			
			//common actions
			var gravity:Gravity = new Gravity();
			gravity.addField(new UniformField(0, 0.2));
			var commonActions:CompositeAction = new CompositeAction();
			commonActions.mask = 1 | 2;
			commonActions.addAction(gravity);
			commonActions.addAction(new Move());
			commonActions.addAction(new Oriented());
			commonActions.addAction(new DeathZone(new RectZone(0, 0, 640, 420), true));
			addAction(commonActions);
			
			//drip actions
			var deathTrigger:DeathTrigger = new DeathTrigger();
			deathTrigger.addAction(spawn);
			var dripActions:CompositeAction = new CompositeAction();
			dripActions.mask = 1;
			dripActions.addAction(deathTrigger);
			addAction(dripActions);
		}
	}
}