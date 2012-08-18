package idv.cjcat.stardust.common.xml 
{
  import idv.cjcat.stardust.common.StardustElement;
  import org.swiftsuspenders.Injector;
	
  public class XMLDeserializer 
  {
    public function XMLDeserializer(xml:XML = null):void
    {
      if (xml) deserialize(xml);
    }
    
    private var injector_:Injector = null;
    public function deserialize(xml:XML):void
    {
      injector_ = new Injector();
      
      for each (var node:XML in xml.*)
      {
        var ElementClass:Class = getDefinitionByName(node.name());
        var element:StardustElement = new ElementClass();
        element.deserialize(node, this);
        
        injector_.map(ElementClass, element.name).toValue(element);
      }
    }
    
    public function getElement(ElementClass:Class, name:String):*
    {
      if (injector_) return injector_.getInstance(ElementClass, name);
      throw new Error("The deserializer hasn't deserialize any XMl data yet.");
      return null;
    }
  }
}