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
public class Conjugation<D, R, F extends Function<D, R>> extends
                        FunctionCall<D, R, F>
{

  public Conjugation(Expression<D, R, F> parser, String functionName, Node<D, R, F> argument, int depth)
  {
    super(parser,
          "neg",
          argument);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}
