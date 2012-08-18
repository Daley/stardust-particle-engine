package idv.cjcat.stardust.common
{
  import flash.utils.getQualifiedClassName;
  import idv.cjcat.stardust.common.xml.XMLDeserializer;
  import idv.cjcat.stardust.common.xml.XMLSerializer;
  
  /**
   * All Stardust elements are subclasses of this class.
   */
  public class StardustElement implements XMLSerializable
  {
    
    private static var elementCounter:Dictionary = new Dictionary();
    
    public var name:String;
    
    public function StardustElement()
    {
      var str:String = getXMLTagName();
      
      if (elementCounter[str] == undefined)
        elementCounter[str] = 0;
      else
        elementCounter[str]++;
      
      this.name = str + "_" + elementCounter[str];
    }
    
    //XML
    //------------------------------------------------------------------------------------------------
    
    public function toXML():XML
    {
      var node:XML = <element/>;
      node.@className = getQualifiedClassName(Class(Object(this).constructor));
      return node;
    }
    
    public function serialize(serializer:XMLSerializer):void
    {
      serializer.push(toXML());
    }
    
    public function deserialize(xml:XML, deserializer:XMLDeserializer = null):void
    {
      
    }
    
    //------------------------------------------------------------------------------------------------
    //end of XML
  }
}