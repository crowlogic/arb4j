package arb.expressions.nodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class Conjugate<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
                      FunctionCall<D, R, F>
{

  public Conjugate(Expression<D, R, F> parser,
                   String functionName,
                   Node<D,R,F> argument,
                   int depth)
  {
    super(parser,
          "neg",
          argument,
          depth + 1);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}
