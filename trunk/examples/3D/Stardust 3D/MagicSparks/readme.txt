The StardustPetalWrapper is a StardustSprite subclass.
The StardustSpriteUpdate3D action calls the StardustSprite.update() method on each emitter step, 
which is overridden in the StardustPetalWrapper class to keep the AdorablePinkTriangle movie clips playing.
The CalculateScreenVelocity and BillboardOriented objects were not disabled when paused, 
so the particles still update and align their direciton to the projected 2D velocity vectors on screen from 3D velocity vectors, 
while the user rotates the camera.