package {
	import flash.display.Bitmap;
	
	public class FastArrow extends Bitmap {
		
		public function FastArrow() {
			
		}
		
		override public function get rotation():Number { return super.rotation; }
		override public function set rotation(value:Number):void {
			var rotation:Number = value;
			while (rotation >= 360) rotation -= 360;
			while (rotation < 0) rotation += 360;
			this.bitmapData = ArrowBitmapDataPool.getInstance().getRotationBMPD(rotation);
		}
	}
}