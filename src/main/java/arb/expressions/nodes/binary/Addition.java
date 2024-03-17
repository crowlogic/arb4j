package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Addition<D, R, F extends Function<D, R>> extends
                     BinaryOperation<D, R, F>
{

  @Override
  public String typeset()
  {
    return format("%s + %s", left.typeset(), right.typeset());
  }

  public Addition(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "add",
          right,
          "+");
  }

  @Override
  public boolean isCommutative()
  {
    return true;
  }

}