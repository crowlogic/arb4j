package arb.expressions.nodes.unary;

import arb.Real;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Absolute value function
 * 
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
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

}