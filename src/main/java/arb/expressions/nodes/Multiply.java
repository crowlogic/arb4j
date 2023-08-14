package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class Multiply<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                     BinaryOperation
{
  public Multiply(Expression<D, R, F> expression,
                  Node left,
                  Node right)
  {
    super(expression,
          left,
          "mul",
          right);
  }
}