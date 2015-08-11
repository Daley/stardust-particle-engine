![http://cjcat2266.googlepages.com/StardustLogoMediumShadowed.png](http://cjcat2266.googlepages.com/StardustLogoMediumShadowed.png)

This project started off as a student practice project. Some example source files are still outdated; however, I do not intend to update this project in the near future. Sorry about that.

[Plumbee](https://github.com/matyasf/stardust-library-plumbee) has a [fork](https://github.com/matyasf/stardust-library-plumbee) of Stardust and is still maintaining the project at the time of writing.


---


## Stardust is now version 1.3 ##

### [Migrating to Stardust 1.3](http://code.google.com/p/stardust-particle-engine/wiki/MigrationForStardust1_3) ###

**You can grab the latest revision from the
mercurial repository using [TortoiseHg](http://tortoisehg.bitbucket.org/)**

### The manual and tutorial videos are for version 1.2 and are out-of-date. ###

If you've made anything using Stardust, be it a website, game, or even just a simple demo, you can [email the link to me](mailto:cjcat2266@gmail.com). I'd really love to see how Stardust is being used on other projects.

|[TortoiseHg](http://tortoisehg.bitbucket.org/)|[Downloads](http://code.google.com/p/stardust-particle-engine/downloads/list)|[Video Tutorials](http://www.youtube.com/view_play_list?p=79300CF812C795F9)|[ActiveTuts+ Tutorials](http://code.google.com/p/stardust-particle-engine/wiki/activeTutsPlus)|
|:---------------------------------------------|:----------------------------------------------------------------------------|:--------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------|
|[Documentation](http://stardust-particle-engine.googlecode.com/svn/trunk/docs/index.html)|[FlashDevelop Templates](http://stardust-particle-engine.googlecode.com/svn/trunk/FlashDevelop%20templates)|[Blog](http://allenchou.net/blog/)                                         |

Stardust depends on and includes the compiled SWC file of [CJSignals](http://code.google.com/p/cjsignals/), included in the _libs_ folder.

The core class structure was inspired by [Flint Particle System](http://flintparticles.org/).

The particle masking feature was inspired by [Box2D Physics Engine](http://www.box2d.org/).

The gravity field, deflector, and action trigger class structure was inherited from [Emitter](http://code.google.com/p/emitter/), my previous particle engine project.


---


### Stardust Features ###

  * Supports 2D and 3D particle effects.

  * Easy to extend for custom initializers, actions, fields, deflectors, clocks, and 2D/3D renderers.

  * Includes 2D extension for [Pyronova](http://code.google.com/p/pyronova/).

  * Includes 3D extensions for [ZedBox](http://code.google.com/p/zedbox/), [Papervision3D](http://blog.papervision3d.org/), [Alternativa3D](http://alternativaplatform.com/en/alternativa3d/), [Away3D](http://away3d.com), [Flare3D](http://flare3d.com),and [ND3D](http://www.nulldesign.de/projects/nd3d-as3-3d-engine/).

  * Includes a native 3D renderer.

  * Supports particle masking (particles can be affected by selected actions).

  * Uses fast-splicing arrays and object pools to improve performance.

  * Gravity and deflector simulation.

  * Action triggers (for creating complex conditional particle behaviors).

  * XML serialization.


---


### Examples ###

More examples and their source files can be found [here](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/).

You can download all the latest example source files using TortoiseSVN.

(Note that you'll also need the Stardust source files to compile the examples)

Click the icons below to view examples online.

|[![](http://3.bp.blogspot.com/_4-LtXwX7Yuo/S_vZfUEME1I/AAAAAAAAAp4/tJ-jmu1rMRM/s400/goldenstars.jpg)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/Flare3D/GoldenStars/GoldenStars.html)|[![](http://4.bp.blogspot.com/_4-LtXwX7Yuo/Snv2rE_OtJI/AAAAAAAAAZ8/epFhl2_2oq8/s320/turbulent+blast.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/TurbulentBlast/TurbulentBlast.html)|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/SnvvGrtZW8I/AAAAAAAAAZ0/vY1A_qYGi0w/s320/text+spark.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/TextSpark/TextSpark.html)|[![](http://4.bp.blogspot.com/_4-LtXwX7Yuo/SnvG-D72U1I/AAAAAAAAAZs/fyfpuWgtJVY/s320/arrows.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/Turbulence/Turbulence.html)|
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/Sn0jEZ7on1I/AAAAAAAAAaU/IbIpXEFqpwc/s320/fireworks.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/Fireworks/Fireworks.html)|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/Sn-qP2fQS9I/AAAAAAAAAas/SyhlrxnDtiA/s320/exploding+image.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/ExplodingImage/ExplodingImage.html)|[![](http://4.bp.blogspot.com/_4-LtXwX7Yuo/Sm3F-BLEGXI/AAAAAAAAAYc/E2gjCBofdYU/s320/trailsparks.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/TrailDust/TrailDust.html)|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/SoENRcBgPVI/AAAAAAAAAa0/9ZGDE6_qlNs/s320/sakura.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/Stardust%203D/Sakura/Sakura.html)|
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[![](http://4.bp.blogspot.com/_4-LtXwX7Yuo/SoGWm0aZgII/AAAAAAAAAa8/3Fj8VUHuEH4/s320/pink+triangles.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/Stardust%203D/OrientedBillboards/OrientedBillboards.html)|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/SnEypB5JisI/AAAAAAAAAZU/mD1HTLKX6as/s320/cubed+stars.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/Papervision3D/CubedStars/CubedStars.html)|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/SnHQE8WO36I/AAAAAAAAAZc/pLP4iLyjuF4/s320/colliding+cubes.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/Papervision3D/CollidingCubes/CollidingCubes.html)|[![](http://4.bp.blogspot.com/_4-LtXwX7Yuo/SnHQFFMQQYI/AAAAAAAAAZk/smgIVb8Y6ps/s320/oriented+cones.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/Papervision3D/OrientedCones/OrientedCones.html)|
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[![](http://2.bp.blogspot.com/_4-LtXwX7Yuo/Sn0jEPWyhlI/AAAAAAAAAaM/CVtk86IxS-U/s320/DOF.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/3D/ZedBox/DepthOfField/DepthOfField.html)|[![](http://3.bp.blogspot.com/_4-LtXwX7Yuo/Sn7COkKcN7I/AAAAAAAAAak/SPLy4Ekwd10/s320/point+uniburst.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/PointUniburst/PointUniburst.html)|[![](http://3.bp.blogspot.com/_4-LtXwX7Yuo/SpAipSLbwZI/AAAAAAAAAf8/BrwCpJi6-wY/s320/masked+collision.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/MaskedCollision/MaskedCollision.html)|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/SoudDNyvwPI/AAAAAAAAAcY/q9NLNjw78eY/s320/pixel+star.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/StarFireworks/StarFireworks.html)|
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[![](http://1.bp.blogspot.com/_4-LtXwX7Yuo/SpAipJlKT7I/AAAAAAAAAf0/iCjFAwkKy_Q/s320/turbulent+pixels.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/TurbulentPixels/TurbulentPixels.html)|[![](http://4.bp.blogspot.com/_4-LtXwX7Yuo/SpFborUO-YI/AAAAAAAAAgE/4VaGMDduFJs/s320/waypoints.png)](http://stardust-particle-engine.googlecode.com/svn/trunk/examples/2D/Waypoints/Waypoints.html)|
|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|