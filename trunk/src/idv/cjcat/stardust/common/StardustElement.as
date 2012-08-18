package idv.cjcat.stardust.common
{
  import flash.utils.Dictionary;
  import flash.utils.getQualifiedClassName;
  
  /**
   * All Stardust elements are subclasses of this class.
   */
  public class StardustElement
  {
    private static var counter_:Dictionary = new Dictionary();
    
    public var name:String;
    
    public function StardustElement()
    {
      var ElementClass:Class = Class(Object(this).constructor);
      
      if (counter_[ElementClass] == undefined) counter_[ElementClass] = 0;
      else ++counter_[ElementClass];
      
      name = getQualifiedClassName(ElementClass).substring("::")[1] + "_" + counter_[ElementClass];
    }
    
    //XML
    //------------------------------------------------------------------------------------------------
    
    public function toXML():XML
    {
      var node:XML    = <element/>;
      
      //add name and class name attributes
      node.@name      = name;
      node.@className = getQualifiedClassName(Class(Object(this).constructor));
      
      return node;
    }
    
    public function getRelatedElements():Array
    { return []; }
    
    public function parseXML(xml:XML, deserializer:XMLDeserializer = null):void
    { }
    
    //------------------------------------------------------------------------------------------------
    //end of XML
  }
}
