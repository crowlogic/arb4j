package arb.expressions.nodes.binary;

import static java.lang.String.format;

import arb.Quaternion;
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
public class MultiplicationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{
  @Override
  public Node<D, R, F> simplify()
  {
    assert false : "wtf";
    
    if (left.isConstant() && left.toString().equals("0"))
    {
      assert false : "TODO";
    }
    return this;
  }

  public MultiplicationNode(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "mul",
          right,
          "*");
  }

  @Override
  public String typeset()
  {
    return format("%s \\cdot %s", left.typeset(), right.typeset());
  }

  /**
   * @return true if {@link Expression#coDomainType} is not a {@link Quaternion}
   */
  @Override
  public boolean isCommutative()
  {
    return !expression.coDomainType.equals(Quaternion.class);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new MultiplicationNode<E, S, G>(newExpression,
                                           left.spliceInto(newExpression),
                                           right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return left.differentiate(variable).mul(right).add(left.mul(right.differentiate(variable)));
  }

}