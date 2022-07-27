package arb.algebraic.expressions;

public class Constant implements
                      Expression
{
  private final float value;

  public Constant(float value)
  {
    this.value = value;
  }

  @Override
  public Float evaluate()
  {
    return this.value;
  }

  public String toString()
  {
    return "#" + this.value;
  }
}