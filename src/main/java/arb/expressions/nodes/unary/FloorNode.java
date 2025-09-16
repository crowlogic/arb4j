package arb.expressions.nodes.unary;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Floor function<br>
 * <br>
 * 
 * <pre>
 * y = x - frac(x)
 * </pre>
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FloorNode<D, R, F extends Function<? extends D, ? extends R>> extends
                      FunctionNode<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format("⌊%s⌋", arg.typeset());
  }

  @Override
  public String typeset()
  {
    return String.format("\\lfloor{%s}\\rfloor", arg.typeset());
  }

  @Override
  public Class<?> type()
  {
    return arb.Integer.class;
  }

  public FloorNode(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super("floor",
          argument,
          parser);
  }
}