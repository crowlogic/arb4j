package arb.expressions;

import arb.Named;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SerializedContextVariable
{
  public SerializedContextVariable(String type, String value)
  {
    this.value = value;
    this.type  = type;
  }
  
  
  public SerializedContextVariable(Named integer)
  {
    value = integer.toStringWithoutName();
    type  = integer.getClass().getName();
  }

  public String value;
  public String type;
  @Override
  public String toString()
  {
    return String.format("SerializedContextVariable[type=%s, value=%s]", type, value);
  }

  
}