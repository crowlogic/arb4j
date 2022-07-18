package arb.expression;

public class VariableExpression implements
                                Expression
{
  private float value;

  public VariableExpression(float value)
  {
    this.set(value);
  }

  public void set(float value)
  {
    this.value = value;
  }

  public float evaluate()
  {
    return this.value;
  }

  public String toString()
  {
    return "{" + this.value + "}";
  }
}