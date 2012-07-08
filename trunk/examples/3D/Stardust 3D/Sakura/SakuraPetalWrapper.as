﻿package {
	
	import flash.display.*;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.display.StardustSprite;

	public class SakuraPetalWrapper extends StardustSprite {
		
		private var innerWrapper:Sprite;
		private var selfOmega:Number;
		private var petalOmega:Number;
		private var scaleXRate:Number;
		private var petel:SakuraPetal;
		private var phase:Number;
		
		public function SakuraPetalWrapper() {
			phase = 0;
			petel = new SakuraPetal();
			innerWrapper = new Sprite();
			innerWrapper.addChild(petel);
			petel.rotation = Math.random() * 360;
			rotation *= Math.random() * 360;
			selfOmega = Math.random() * 10;
			petalOmega = Math.random() * 10;
			scaleXRate = Math.random() * 0.03 + 0.07;
			addChild(innerWrapper);
		}
		
		override public function update(emitter:Emitter, particle:Particle, time:Number):void {
			petel.rotation += petalOmega;
			rotation += selfOmega;
			phase++;
			innerWrapper.scaleX = Math.sin(scaleXRate * phase);
		}
	}
}