package arb.expressions.nodes.binary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RisingFactorial<D, R, F extends Function<D, R>> extends
                            BinaryOperation<D, R, F>
{

  public RisingFactorial(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "risingFactorial",
          right);
  }

  @Override
  public String typeset()
  {
    return String.format("(%s)_{%s}", left.typeset(), right.typeset());
  }

}
