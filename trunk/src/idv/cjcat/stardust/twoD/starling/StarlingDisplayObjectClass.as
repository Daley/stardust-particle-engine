package idv.cjcat.stardust.twoD.starling 
{
  import idv.cjcat.stardust.common.initializers.Initializer;
  import idv.cjcat.stardust.common.particles.Particle;
  import idv.cjcat.stardust.common.utils.construct;
  
	public class StarlingDisplayObjectClass extends Initializer
  {
    public var displayObjectClass:Class;
    public var constructorParams:Array;
    
    public function StarlingDisplayObjectClass(displayObjectClass:Class, constructorParams:Array = null)
    {
      this.displayObjectClass = displayObjectClass;
      this.constructorParams = constructorParams;
    }
    
    override public function initialize(particle:Particle):void 
    {
      particle.target = construct(displayObjectClass, constructorParams);
    }
  }
}