package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class Multiply<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                     BinaryOperation<D,R,F>
{
  public Multiply(Expression<D, R, F> expression,
                  Node<D,R,F> left,
                  Node<D,R,F> right)
  {
    super(expression,
          left,
          "mul",
          right);
  }
}