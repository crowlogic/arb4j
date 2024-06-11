package arb.expressions.nodes.binary;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * The rising factorial, ironically, denoted as x₍ₙ₎, for a {@link Field} x and a
 * non-negative integer n is defined by the product:
 * 
 * x₍ₙ₎ = x⋰n = ∏x+k{k=0..n-1}  
 * 
 * x₍₀₎ = 1
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AscendingFactorialization<D, R, F extends Function<? extends D, ? extends R>> extends
                                      BinaryOperation<D, R, F>
{

  public AscendingFactorialization(Node<D, R, F> left,
                                   Node<D, R, F> right,
                                   Expression<D, R, F> expression)
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
    return new AscendingFactorialization<E, S, G>(left.spliceInto(newExpression),
                                                  right.spliceInto(newExpression),
                                                  newExpression);
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

}
