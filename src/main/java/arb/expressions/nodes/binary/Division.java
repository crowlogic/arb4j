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
public class Division<D, R, F extends Function<D, R>> extends
                     BinaryOperation<D, R, F>
{
  @Override
  public boolean hasSingleLeaf()
  {
    return false;
  }

  public Division(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "div",
          right,
          "/");
  }

  @Override
  public String typeset()
  {
    return format("\\frac{%s}{%s}", left.typeset(), right.typeset());
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

}