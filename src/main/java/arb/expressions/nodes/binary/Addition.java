package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Addition<D, R, F extends Function<? extends D, ? extends R>> extends
                     BinaryOperation<D, R, F>
{

  @Override
  public String typeset()
  {
    return format("\\left(%s + %s\\right)", left.typeset(), right.typeset());
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

 

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new Addition<E, S, G>(newExpression,
                                 left.spliceInto(newExpression),
                                 right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
  {
    return null;
  }



}