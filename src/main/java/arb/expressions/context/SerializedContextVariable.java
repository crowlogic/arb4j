package arb.expressions.context;

import java.util.Objects;

import arb.Named;

public class SerializedContextVariable
{
  public final String type;  // Made public to fix visibility issues
  public final String value; // Made public to fix visibility issues

  public SerializedContextVariable(String type, String value)
  {
    this.type  = Objects.requireNonNull(type, "Type cannot be null");
    this.value = Objects.requireNonNull(value, "Value cannot be null");
  }

  public SerializedContextVariable(Named variable)
  {
    Objects.requireNonNull(variable, "Variable cannot be null");
    this.type  = variable.getClass().getName();
    this.value = variable.toStringWithoutName();
  }

  public String getType()
  {
    return type;
  }

  public String getValue()
  {
    return value;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null || getClass() != obj.getClass())
      return false;
    SerializedContextVariable that = (SerializedContextVariable) obj;
    return Objects.equals(type, that.type) && Objects.equals(value, that.value);
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(type, value);
  }

  @Override
  public String toString()
  {
    return String.format("SerializedContextVariable[type=%s, value=%s]", type, value);
  }
}
