package arb.algebraic.expressions;

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
