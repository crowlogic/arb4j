package arb.algebraic.expressions;

/**
 * An {@link Expression} can be a {@link Constant}, {@link Variable},
 * {@link BinaryExpression}, {@link FunctionInvocation}, or {@link UnaryExpression}
 *
 */
@FunctionalInterface
public interface Expression<X>
{
  public X evaluate();

  /**
   * 
   * @return true if this is an instance of a {@link BinaryExpression}
   */
  public default boolean isBinary()
  {
    return this instanceof BinaryExpression;
  }
}
