package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Factorial<D, R, F extends Function<D, R>> extends
                      FunctionCall<D, R, F>
{

  @Override
  public Class<?> type()
  {
    return arb.Integer.class;
  }

  public Factorial(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super(parser,
          "factorial",
          argument);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}
