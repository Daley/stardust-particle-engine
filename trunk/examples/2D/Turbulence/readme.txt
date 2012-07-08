All arrows are prerendered bitmaps. This technique was inspired by ClockMaker's work.
There are 360 prerendered bitmaps of arrows, containing "snapshots" of an arrow rotated at 0~359 degrees.
Each visible arrow in the example is a Bitmap object, and it choose its BitmapData object from the prerendered 360 bitmaps according to the rotation value.
The turbulence is created using the Gravity action with a BitmapField, which internally calculates gravitational acceleration from a perlin noise bitmap.