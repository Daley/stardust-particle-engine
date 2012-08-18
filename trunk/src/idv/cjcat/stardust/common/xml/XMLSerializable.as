package idv.cjcat.stardust.common.xml
{
  /**
   * This interface is implemented by all Stardust elements.
   * All Stardust elements can generate XML representation and reconstruct from existing XML data.
   */
  public interface XMLSerializable
  {
    function serialize(serializer:XMLSerializer):void;
    function deserialize(xml:XML, deserializer:XMLDeserializer = null):void;
  }
}