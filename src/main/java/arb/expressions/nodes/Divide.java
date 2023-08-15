package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class Divide<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                   BinaryOperation<D, R, F>
{
  public Divide(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "div",
          right);
  }
}