package arb;

public class Integer
{
  private long value;

  public Integer(long value)
  {
    this.value = value;
  }

  public long getValue()
  {
    return value;
  }

  public void setValue(long value)
  {
    this.value = value;
  }

  public boolean isPointer()
  {
    return (value & (1L << 62)) != 0;
  }
}
