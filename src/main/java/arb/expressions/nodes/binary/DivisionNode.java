package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DivisionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                     BinaryOperationNode<D, R, F>
{

  public DivisionNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
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

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
   // return  new 
    assert false : "TODO: implement integration rule for division, left=" + left + " right=" + right;
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new DivisionNode<E, S, G>(newExpression,
                                 left.spliceInto(newExpression),
                                 right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> derivative(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

}