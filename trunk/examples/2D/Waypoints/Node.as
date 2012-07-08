package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import idv.cjcat.stardust.twoD.actions.waypoints.Waypoint;
	
	public class Node extends MovieClip {
		
		public var waypoint:Waypoint;
		
		public function Node() {
			waypoint = new Waypoint();
			waypoint.x = x;
			waypoint.y = y;
			waypoint.radius = 20;
			
			addEventListener(MouseEvent.MOUSE_DOWN, startMove);
			addEventListener(MouseEvent.MOUSE_UP, stopMove);
		}
		
		private var px:Number;
		private var py:Number;
		private function startMove(e:MouseEvent):void {
			px = parent.mouseX;
			py = parent.mouseY;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, follow);
		}
		
		private function stopMove(e:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, follow);
		}
		
		
		protected function follow(e:MouseEvent):void {
			x += parent.mouseX - px;
			y += parent.mouseY - py;
			
			waypoint.x = x;
			waypoint.y = y;
			
			px = parent.mouseX;
			py = parent.mouseY;
			e.updateAfterEvent();
		}
	}
}