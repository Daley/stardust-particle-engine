package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import idv.cjcat.stardust.twoD.deflectors.CircleDeflector;
	
	public class Obstacle extends MovieClip {
		
		public var circleDeflector:CircleDeflector
		
		public function Obstacle() {
			circleDeflector = new CircleDeflector(0, 0, 50);
			circleDeflector.bounce = 0;
			
			follow();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, follow);
		}
		
		
		protected function follow(e:MouseEvent = null):void {
			x = parent.mouseX;
			y = parent.mouseY;
			
			circleDeflector.x = x;
			circleDeflector.y = y;
			
			if (e) e.updateAfterEvent();
		}
	}
}