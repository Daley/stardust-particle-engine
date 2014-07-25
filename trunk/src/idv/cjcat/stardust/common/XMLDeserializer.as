package idv.cjcat.stardust.common 
{
  import flash.utils.Dictionary;
  import flash.utils.getDefinitionByName;
  import idv.cjcat.stardust.common.StardustElement;
	
  public class XMLDeserializer 
  {
    public function XMLDeserializer(xml:XML = null):void
    {
      if (xml) deserialize(xml);
    }
    
    private var elements_:Dictionary = null;
    public function deserialize(xml:XML):void
    {
      elements_ = new Dictionary();
      
      var node        :XML;
      var ElementClass:Class;
      var element     :StardustElement;
      
      //first pass, instantiate all elements
      for each (node in xml.*)
      {
        ElementClass = getDefinitionByName(node.name());
        element      = new ElementClass();
        element.name = String(node.@name);
        
        if (elements_[element.name])
        {
          throw new Error("Duplicate element name: " + element.name);
        }
        
        elements_[element.name] = element;
      }
      
      //second pass, deserialize XML
      for each (node in xml.*)
      {
        ElementClass = getDefinitionByName(node.name());
        element      = elements_[String(node.@name)];
        
        element.deserialize(node, this);
      }
    }
    
    public function getElement(name:String):*
    {
      if (elements_) return elements_[name];
      else throw new Error("The deserializer hasn't deserialize any XMl data yet.");
      return null;
    }
  }
}