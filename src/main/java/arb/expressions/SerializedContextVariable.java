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
  
  public int bits;
  
  public SerializedContextVariable(Named integer)
  {
    value = integer.toStringWithoutName();
    type  = integer.getClass().getName();
  }

  public String value;
  public String type;
}