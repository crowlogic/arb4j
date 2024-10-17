package arb.expressions.nodes.unary;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Absolute value function
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class AbsoluteValueNode<D, R, F extends Function<? extends D, ? extends R>> extends
                              FunctionNode<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format("|%s|", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("|%s|", arg.typeset());
  }

  @Override
  public Class<?> type()
  {
    return Real.class;
  }

  public AbsoluteValueNode(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super("abs",
          argument,
          parser);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }
}