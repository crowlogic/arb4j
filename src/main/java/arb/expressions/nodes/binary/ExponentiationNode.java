package arb.expressions.nodes.binary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents the binary exponentiation operation: left^right<br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExponentiationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                               BinaryOperationNode<D, R, F>
{

  public String format(Node<D, R, F> side)
  {
    return side.isLeaf() ? "%s" : "(%s)";
  }

  @Override
  public String typeset()
  {
    return String.format(String.format("{%s}^{%s}", format(left), format(right)), left.typeset(), right.typeset());
  }

  public ExponentiationNode(Expression<D, R, F> expression, Node<D, R, F> base, Node<D, R, F> exponent)
  {
    super(expression,
          base,
          "pow",
          exponent,
          "^");
  }

  @Override
  public boolean isCommutative()
  {
    return false;
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
    return new ExponentiationNode<E, S, G>(newExpression,
                                           left.spliceInto(newExpression),
                                           right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return this;
  }

  @Override
  public Class<?> type()
  {
    if (right.isPossiblyNegative())
    {
      assert false : "todo: type of exponetiation node can not be represented in the codomain type "
                     + expression.coDomainType
                     + " because the exponent of "
                     + this
                     + " can be negative";
      return null;
    }
    else
    {
      return super.type();

    }

  }
}