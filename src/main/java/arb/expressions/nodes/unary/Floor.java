package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Floor function<br><br>
 * 
 * <pre>
 *   y = x - frac(x)
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Floor<D, R, F extends Function<? extends D, ? extends R>> extends
                  FunctionCall<D, R, F>
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

  public Floor(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super("floor",
          argument,
          parser);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }
}