package arb.expressions.context;

import java.util.Objects;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SerializedContextVariable
{
  @Override
  public int hashCode()
  {
    return Objects.hash(type, value);
  }


  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    SerializedContextVariable other = (SerializedContextVariable) obj;
    return Objects.equals(type, other.type) && Objects.equals(value, other.value);
  }


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