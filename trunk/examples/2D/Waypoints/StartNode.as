package  {
	import flash.events.MouseEvent;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.zones.CircleZone;
	
	public class StartNode extends Node {
		
		public var circleZone:CircleZone;
		public var position:Position;
		
		public function StartNode() {
			circleZone = new CircleZone();
			circleZone.x = x;
			circleZone.y = y;
			circleZone.radius = 20;
			position = new Position(circleZone);
		}
		
		override protected function follow(e:MouseEvent):void {
			super.follow(e);
			
			circleZone.x = x;
			circleZone.y = y;
		}
	}
}