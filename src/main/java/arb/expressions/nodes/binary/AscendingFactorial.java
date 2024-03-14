package arb.expressions.nodes.binary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * I'm starting a new trend of denoting the Pochhammer symbol aka the rising
 * factorial as the rising factorial which it is known to be synonymous with and
 * is a well known historical precedent and therefore propose to adopt the
 * convention of representing this operation with the ⋰ symbol in the same way
 * as the ordinary arithemtic operators. The support for this should also be
 * added in the expression compiler in case one wants to use this way of
 * expressing the operation rather than embracing the right hand side operand
 * with the ₍₎ characters.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AscendingFactorial<D, R, F extends Function<D, R>> extends
                               BinaryOperation<D, R, F>
{

  public AscendingFactorial(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "ascendingFactorial",
          right,
          "⋰");
  }

  @Override
  public String typeset()
  {
    return String.format("(%s)_{%s}", left.typeset(), right.typeset());
  }

}
