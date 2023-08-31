package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class Add<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                BinaryOperation<D, R, F>
{
  public Add(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right, int depth)
  {
    super(expression,
          left,
          "add",
          right,
          depth);
  }
}