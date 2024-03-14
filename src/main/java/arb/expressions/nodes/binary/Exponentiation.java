package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Represents the binary exponentiation operation: left^right<br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Exponentiation<D, R, F extends Function<D, R>> extends
                           BinaryOperation<D, R, F>
{

  @Override
  public String typeset()
  {
    return format("{%s}^{%s}", left.typeset(), right.typeset());
  }

  public Exponentiation(Expression<D, R, F> expression, Node<D, R, F> base, Node<D, R, F> exponent)
  {
    super(expression,
          base,
          "pow",
          exponent,
          "^");
  }
}