package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Factorialize a number, where the factorial is of course defined by
 * 
 * <pre>
 *   n! = n*(n - 1)!
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Factorialization<D, R, F extends Function<? extends D, ? extends R>> extends
                             FunctionCall<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format(arg.isLeaf() ? "%s!" : "(%s)!", arg);
  }

  @Override
  public String typeset()
  {
    return String.format(arg.isLeaf() ? "%s!" : "(%s)!", arg.typeset());
  }

  @Override
  public Class<?> type()
  {
    return arb.Integer.class;
  }

  public Factorialization(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super("factorial",
          argument,
          parser);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}
