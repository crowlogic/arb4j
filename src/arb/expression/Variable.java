package arb.expression;

public class Variable implements
                      Expression
{
  private float value;

  public Variable(float value)
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