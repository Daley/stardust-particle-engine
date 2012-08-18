package idv.cjcat.stardust.common
{
  import flash.utils.Dictionary;
  import idv.cjcat.stardust.common.StardustElement;
  
  public class XMLSerializer
  {
    private var elements_:Dictionary = null;
    
    /**
     * Serializes a Stardust element, considering all directly and indirectly 
     * related elements. Beware that this method goes into infinite loop if 
     * there is a cycle in the element relationship.
     */
    public function serialize(element:StardustElement):XML
    {
      //add all related elements
      elements_ = new Dictionary();
      addRelatedElements(element);
      
      //append XML representation of each element
      var xml:XML = <particleSystem/>;
      for (var key:* in elements_)
      {
        var e:StardustElement = elements_[key];
        xml.appendChild(e.toXML());
      }
      
      return xml;
    }
    
    private function addRelatedElements(element:StardustElement):void
    {
      //check duplicate element name
      if (elements_[element.name]) throw new Error("Duplicate element name: " + element.name);
      
      //insert element dictionary entry
      elements_[element.name] = element;
      
      //recursively add all related elements
      var relatedElements:Array = element.getRelatedElements();
      for (var i:int = 0, len:int = relatedElements.length; i < len; ++i)
      {
        addRelatedElements(relatedElements[i]);
      }
    }
  }
}
