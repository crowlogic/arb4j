package arb.expression;

public class Constant implements
                      Expression
{
  private final float value;

  public Constant(float value)
  {
    this.value = value;
  }

  public float evaluate()
  {
    return this.value;
  }

  public String toString()
  {
    return "#" + this.value;
  }
}