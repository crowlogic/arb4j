package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BinomialCoeffecient<D, R, F extends Function<? extends D, ? extends R>> extends
                                BinaryOperation<D, R, F>
{
  @Override
  public String typeset()
  {
    return format("\\binom{%s}{%s}", left.typeset(), right.typeset());
  }

  public BinomialCoeffecient(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "binomial",
          right,
          "ℭ");
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public Node<D, R, F> integral(Variable<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new BinomialCoeffecient<E, S, G>(newExpression,
                                            left.spliceInto(newExpression),
                                            right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

}
