package arb.expressions.nodes.unary;

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
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FactorialNode<D, R, F extends Function<? extends D, ? extends R>> extends
                          FunctionNode<D, R, F>
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

  public FactorialNode(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super("factorial",
          argument,
          parser);
  }

  @Override
  public char symbol()
  {
    return '!';
  }

}
