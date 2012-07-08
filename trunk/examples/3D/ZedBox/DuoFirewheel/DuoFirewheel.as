package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import idv.cjcat.stardust.common.clocks.SteadyClock;
	import idv.cjcat.stardust.common.math.StardustMath;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.emitters.Emitter3D;
	import idv.cjcat.stardust.threeD.zedbox.handlers.ZBDisplayObjectHandler;
	import idv.cjcat.zedbox.display.ZedSprite;
	
	public class DuoFirewheel extends ZBExample {
		
		private var emitter1:Emitter3D;
		private var emitter2:Emitter3D;
		
		private var glowBMPD:BitmapData;
		private var glowBMP:Bitmap;
		
		public function DuoFirewheel() {
			stage.quality = StageQuality.MEDIUM;
		}
		
		override protected function buildParticleSystem():void {
			glowBMPD = new BitmapData(320, 240, false, 0);
			glowBMP = new Bitmap(glowBMPD);
			glowBMP.scaleX = glowBMP.scaleY = 2;
			glowBMP.blendMode = BlendMode.ADD;
			addChild(glowBMP);
			
			var zbContainer:ZedSprite = new ZedSprite();
			var wheel1:ZedSprite = new ZedSprite();
			wheel1.x = 40;
			wheel1.rotationZ = -90;
			var wheel2:ZedSprite = new ZedSprite();
			wheel2.x = -40;
			wheel2.rotationZ = 90;
			zbContainer.addChild(wheel1);
			zbContainer.addChild(wheel2);
			zbScene.addChild(zbContainer);
			
			emitter1 = new SparkEmitter(new SteadyClock(1), new ZBDisplayObjectHandler(wheel1));
			emitter2 = new SparkEmitter(new SteadyClock(1), new ZBDisplayObjectHandler(wheel2));
		}
		
		private var matrix:Matrix = new Matrix(0.5, 0, 0, 0.5);
		private var filter:BlurFilter = new BlurFilter(8, 8);
		private var point:Point = new Point(0, 0);
		override protected function mainLoop(e:Event):void {
			mouseRotate();
			emitter1.step();
			emitter2.step();
			zbScene.render();
			
			glowBMPD.fillRect(glowBMPD.rect, 0);
			glowBMPD.draw(container, matrix);
			glowBMPD.applyFilter(glowBMPD, glowBMPD.rect, point, filter);
		}
		
		override protected function togglePause(e:MouseEvent):void {
			if (e.target["label"] == "Pause") {
				emitter1.active = false;
				emitter2.active = false;
				PausibleEmitter(emitter1).actions.active = false;
				PausibleEmitter(emitter2).actions.active = false;
				e.target["label"] = "Resume";
			} else {
				emitter1.active = true;
				emitter2.active = true;
				PausibleEmitter(emitter1).actions.active = true;
				PausibleEmitter(emitter2).actions.active = true;
				e.target["label"] = "Pause";
			}
		}
		
		override protected function toggleXML(e:Event):void {
			if (e.target["label"] == "Show XML") {
				e.target["label"] = "Hide XML";
				if (emitter1 != null) {
					xmlText.text = XMLBuilder.buildXML(emitter1).toXMLString() + "\n" + XMLBuilder.buildXML(emitter2).toXMLString();
				}
				xmlTextBox.visible = true;
			} else {
				e.target["label"] = "Show XML";
				xmlTextBox.visible = false;
			}
		}
	}
}