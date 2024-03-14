package arb.expressions.nodes.unary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;
import arb.functions.sequences.IntegerSequence;

/**
 * Swingingly factorialize a number, where the swinging factorial is defined by
 * 
 * <pre>
 *  n≀=n!/⌊n/2⌋!²
 * </pre>
 * @see IntegerSequence#swingingFactorials
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SwingingFactorialization<D, R, F extends Function<D, R>> extends
                                     FunctionCall<D, R, F>
{

  @Override
  public String typeset()
  {
    return String.format((arg instanceof Variable) || (arg instanceof LiteralConstant) ? "%s≀" : "(%s)≀",
                         arg.typeset());
  }

  @Override
  public Class<?> type()
  {
    return arb.Integer.class;
  }

  public SwingingFactorialization(Expression<D, R, F> parser, Node<D, R, F> argument)
  {
    super(parser,
          "swingingFactorial",
          argument);
  }

  @Override
  public boolean isReusable()
  {
    return false;
  }

}