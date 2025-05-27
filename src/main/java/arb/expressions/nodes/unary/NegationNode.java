package arb.expressions.nodes.unary;

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
public class NegationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         FunctionNode<D, R, F>
{

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new NegationNode<E, S, G>(newExpression,
                                     arg.spliceInto(newExpression));
  }

  @Override
  public boolean isPossiblyNegative()
  {
    return !arg.isPossiblyNegative();
  }

  @Override
  public Class<?> type()
  {
    return arg.type();
  }

  @Override
  public String toString()
  {
    return String.format("-%s", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("-%s", arg.typeset());
  }

  @Override
  public boolean isBitless()
  {
    return true;
  }

  public NegationNode(Expression<D, R, F> expression, Node<D, R, F> argument)
  {
    super("neg",
          argument,
          expression);
  }

  @Override
  public char symbol()
  {
    return '-';
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return arg.integrate(variable).neg();
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return arg.differentiate(variable).neg();
  }

}
