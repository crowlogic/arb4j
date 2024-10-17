package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NegationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         FunctionNode<D, R, F>
{

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
  public boolean isReusable()
  {
    return false;
  }

  @Override
  public char symbol()
  {
    return '-';
  }

}
