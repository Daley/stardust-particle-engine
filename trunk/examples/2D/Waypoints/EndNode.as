package  {
	import flash.events.MouseEvent;
	import idv.cjcat.stardust.twoD.actions.DeathZone;
	import idv.cjcat.stardust.twoD.zones.CircleZone;
	
	public class EndNode extends Node {
		
		public var circleZone:CircleZone;
		public var deathZone:DeathZone;
		
		public function EndNode() {
			circleZone = new CircleZone();
			circleZone.x = x;
			circleZone.y = y;
			circleZone.radius = 20;
			deathZone = new DeathZone(circleZone);
		}
		
		override protected function follow(e:MouseEvent):void {
			super.follow(e);
			
			circleZone.x = x;
			circleZone.y = y;
		}
	}
}