package {
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Color;
	import idv.cjcat.stardust.common.initializers.Mass;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.FollowWaypoints;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.SpeedLimit;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	
	public class PixelEmitter extends Emitter2D {
		
		public function PixelEmitter(clock:Clock, nodes:Array) {
			super(clock);
			
			//initializers
			addInitializer(new Color(0x66FF33));
			addInitializer(StartNode(nodes[0]).position);
			addInitializer(new Mass(new UniformRandom(4, 1)));
			
			//actions
			var waypoints:Array = [];
			for (var i:int = 1; i < nodes.length; i++) {
				waypoints.push(Node(nodes[i]).waypoint);
			}
			addAction(new FollowWaypoints(waypoints, false, false));
			addAction(EndNode(nodes[nodes.length - 1]).deathZone);
			addAction(new Move());
			addAction(new SpeedLimit(3));
		}
	}
}