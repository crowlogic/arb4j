package arb.expression;

public interface Expression
{
  public float evaluate();

  /**
   * 
   * @return true if this is an instance of a {@link BinaryExpression}
   */
  public default boolean isBinary()
  {
    return this instanceof BinaryExpression;
  }
}
