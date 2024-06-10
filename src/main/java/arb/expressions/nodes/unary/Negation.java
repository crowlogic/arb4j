package arb.expressions.nodes.unary;

import arb.Polynomial;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Negation<D, R, F extends Function<? extends D, ? extends R>>
                     extends
                     FunctionCall<D, R, F>
{

  @Override
  public boolean isBitless()
  {
    return true;
  }

  public Negation(Expression<D, R, F> expression, Node<D, R, F> argument)
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
  public Class<?> resultTypeFor(String functionName)
  {
    Class<?> resultTypeFor = super.resultTypeFor(functionName);
    if (functionName.equals("neg"))
    {
      return arg.type();
    // boolean constantaArg = arg.isConstant();
      //assert !Polynomial.class.isAssignableFrom(resultTypeFor) : "wtf";
    }
    return resultTypeFor;
  }

}
