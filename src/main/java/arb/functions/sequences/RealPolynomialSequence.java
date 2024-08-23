package arb.functions.sequences;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.polynomials.PolynomialSequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealPolynomialSequence extends
                                        PolynomialSequence<Real, RealPolynomial>
{

  public static RealPolynomialSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealPolynomialSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealPolynomialSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class,
                            RealPolynomial.class,
                            RealPolynomialSequence.class,
                            name,
                            expression,
                            context);
  }

  public static Expression<Integer, RealPolynomial, RealPolynomialSequence> parse(String className,
                                                                                  String string)
  {
    return Sequence.parse(className, RealPolynomialSequence.class, RealPolynomial.class, string);
  }

}
