//change the path to your Stardust library path
var path = "file:///D:/CJDocs/CJ classes/AS3/Stardust/SVN/trunk/examples/";
var errorPath = path + "JSFLPublishError.txt";

var pathList = [];

//2D
pathList.push(path + "2D/Blizzard/Blizzard.fla");
pathList.push(path + "2D/BoundaryCollisionSparks/BoundaryCollisionSparks.fla");
pathList.push(path + "2D/DampedStars/DampedStars.fla");
pathList.push(path + "2D/Drips/Drips.fla");
pathList.push(path + "2D/ExplodingImage/ExplodingImage.fla");
pathList.push(path + "2D/Fireworks/Fireworks.fla");
pathList.push(path + "2D/MaskedCollision/MaskedCollision.fla");
pathList.push(path + "2D/Multisource/Multisource.fla");
pathList.push(path + "2D/PointUniburst/PointUniburst.fla");
pathList.push(path + "2D/SnapshotRestoration/SnapshotRestoration.fla");
pathList.push(path + "2D/Sprinkles/Sprinkles.fla");
pathList.push(path + "2D/StarFireworks/StarFireworks.fla");
pathList.push(path + "2D/SynchronizedMovieClipTest/SynchronizedMovieClipTest.fla");
pathList.push(path + "2D/TextSpark/TextSpark.fla");
pathList.push(path + "2D/TextZone/TextZone.fla");
pathList.push(path + "2D/TiledTurbulence/TiledTurbulence.fla");
pathList.push(path + "2D/TrailDust/TrailDust.fla");
pathList.push(path + "2D/Turbulence/Turbulence.fla");
pathList.push(path + "2D/TurbulentBlast/TurbulentBlast.fla");
pathList.push(path + "2D/TurbulentPixels/TurbulentPixels.fla");
pathList.push(path + "2D/Waypoints/Waypoints.fla");

//3D - Flare3D
pathList.push(path + "3D/Flare3D/FireflySprites/FireflySprites.fla");
pathList.push(path + "3D/Flare3D/GoldenStars/GoldenStars.fla");

//3D - ND3D
pathList.push(path + "3D/ND3D/DistanceBlurSwarm/DistanceBlurSwarm.fla");

//3D - Papervision3D
pathList.push(path + "3D/Papervision3D/CollidingCubes/CollidingCubes.fla");
pathList.push(path + "3D/Papervision3D/CubedStars/CubedStars.fla");
pathList.push(path + "3D/Papervision3D/DisplayObject3DParticles/DisplayObject3DParticles.fla");
pathList.push(path + "3D/Papervision3D/OrientedCones/OrientedCones.fla");

//3D - Stardust 3D
pathList.push(path + "3D/Stardust 3D/MagicSparks/MagicSparks.fla");
pathList.push(path + "3D/Stardust 3D/OrientedBillboards/OrientedBillboards.fla");
pathList.push(path + "3D/Stardust 3D/Sakura/Sakura.fla");

//3D - ZedBox
pathList.push(path + "3D/ZedBox/DepthOfField/DepthOfField.fla");
pathList.push(path + "3D/ZedBox/DuoFirewheel/DuoFirewheel.fla");

var resultMsg = "";
var i;
var len = pathList.length;
for(i = 0; i < len; ++i) {
        var uri = pathList[i];
        if(FLfile.exists(uri)){
                var doc = fl.openDocument(uri);
                doc.publish()
				fl.compilerErrors.save(errorPath, true);
                doc.close();
				
                resultMsg += "[SUCCESS]" + uri + "\n";
        }else{
                resultMsg += "[ERROR]" + uri + "\n";
        }
}
var errorMessage = FLfile.read(errorPath);
FLfile.remove(errorPath);

fl.outputPanel.trace(resultMsg);
fl.outputPanel.trace(errorMessage);