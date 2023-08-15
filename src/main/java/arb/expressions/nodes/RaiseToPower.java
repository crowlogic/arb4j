package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Represents the 'RaiseToPower' binary expression node.
 * 
 * TODO: specialize this for integers and use the int-constructor which would be
 * expected to be higher-performance than string parser
 */
public class RaiseToPower<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                         BinaryOperation<D, R, F>
{
  public RaiseToPower(Expression<D, R, F> expression, Node<D, R, F> base, Node<D, R, F> exponent)
  {
    super(expression,
          base,
          "pow",
          exponent);
  }
}