package arb.expression;

public class ConstantExpression implements
            Expression
{
  private final float value;

  public ConstantExpression(float value)
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