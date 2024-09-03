package arb.functions;

import arb.Integer;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerPolynomialSequence extends
                                                 Sequence<RealPolynomial>
{

  public static IntegerPolynomialSequence
         express(String functionName,
                 String expression,
                 Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Integer.class,
                                RealPolynomial.class,
                                IntegerPolynomialSequence.class,
                                functionName);
  }

  public static IntegerPolynomialSequence
         express(String expression)
  {
    return Function.instantiate(expression,
                                null,
                                Integer.class,
                                RealPolynomial.class,
                                IntegerPolynomialSequence.class,
                                null);
  }

  public static IntegerPolynomialSequence
         express(String expression,
                 Context context)
  {
    return Function.instantiate(expression,
                                context,
                                Integer.class,
                                RealPolynomial.class,
                                IntegerPolynomialSequence.class,
                                null);
  }

}