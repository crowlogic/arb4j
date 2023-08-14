package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class Subtract<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                     BinaryOperation
{
  public Subtract(Expression<D, R, F> expression,
                  Node left,
                  Node right)
  {
    super(expression,
          left,
          "sub",
          right);
  }
}