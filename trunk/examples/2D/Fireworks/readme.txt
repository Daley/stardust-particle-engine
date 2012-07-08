The HeadSparks burst out first, leaving SparkTrails on the path of movement, and spawn lots of AfterSparks upon death.
These three kinds of particles are all subject to the following actions: Gravity, Age, DeathLife, ScaleCurve, and Damping.
The aforementioned common acitons are packed into a single CompositeAction object, with mask set to (1 | 2 | 4).
HeadSparks have a mask of 1, SparkTrails 2, and AfterSparks 4.
Since the Spawn objects for SparkTrails and AfterSparks both have a mask of 1, the death of SparkTrails and AfterSparks does not trigger further spawning actions.