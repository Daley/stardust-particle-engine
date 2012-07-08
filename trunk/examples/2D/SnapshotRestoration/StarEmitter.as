package {
	import idv.cjcat.stardust.common.easing.Sine;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Damping;
	import idv.cjcat.stardust.twoD.actions.DeathZone;
	import idv.cjcat.stardust.twoD.actions.Deflect;
	import idv.cjcat.stardust.twoD.actions.Explode;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.actions.Snapshot;
	import idv.cjcat.stardust.twoD.actions.SnapshotRestore;
	import idv.cjcat.stardust.twoD.actions.SnapshotRestoreFlag;
	import idv.cjcat.stardust.twoD.deflectors.BoundingBox;
	import idv.cjcat.stardust.twoD.deflectors.WrappingBox;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.zones.RectZone;
	
	public class StarEmitter extends Emitter2D {
		
		public var explode:Explode;
		public var snapshot:Snapshot;
		public var snapshotRestore:SnapshotRestore;
		
		public function StarEmitter() {
			
			//actions
			explode = new Explode(0, 0, 30, 640, 640);
			snapshot = new Snapshot();
			snapshotRestore = new SnapshotRestore(new UniformRandom(30, 10));
			snapshotRestore.flags =
				SnapshotRestoreFlag.POSITION | SnapshotRestoreFlag.ROTATION;
			snapshotRestore.curve = Sine.easeOut;
			var deflect:Deflect = new Deflect();
			deflect.addDeflector(new BoundingBox(0, 60, 640, 360));
			addAction(explode);
			addAction(snapshot);
			addAction(snapshotRestore);
			addAction(deflect);
			addAction(new Move());
			addAction(new Damping(0.1));
		}
	}
}