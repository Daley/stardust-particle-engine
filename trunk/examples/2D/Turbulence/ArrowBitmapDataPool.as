package {
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import idv.cjcat.stardust.common.math.StardustMath;
	
	public class ArrowBitmapDataPool {
		
		private static var _instance:ArrowBitmapDataPool;
		public static function getInstance():ArrowBitmapDataPool {
			if (_instance == null) _instance = new ArrowBitmapDataPool();
			return _instance;
		}
		
		private var _rotations:Array;
		public function getRotationBMPD(rotation:Number):BitmapData {
			return _rotations[int(rotation)] as BitmapData;
		}
		
		public function ArrowBitmapDataPool() {
			_rotations = new Array(360);
			var arrow:Arrow = new Arrow();
			for (var i:int = 0; i < 360; i++) {
				var bmpd:BitmapData = new BitmapData(32, 32);
				bmpd.fillRect(bmpd.rect, 0x00000000);
				var matrix:Matrix = new Matrix();
				matrix.rotate(i * StardustMath.DEGREE_TO_RADIAN);
				matrix.translate(16, 16);
				bmpd.draw(arrow, matrix);
				_rotations[i] = bmpd;
			}
		}
	}
}