package arb.functions.integer;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
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

  @Override
  public default RealPolynomialSequence integral()
  {
    return (n, order, bits, res) -> evaluate(n, order, bits, res).integral();
  }

  @Override
  public default RealPolynomialSequence derivative()
  {
    return (n, order, bits, res) -> evaluate(n, order, bits, res).derivative();
  }

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

  public static Expression<Integer, RealPolynomial, RealPolynomialSequence>
         parse(String className, String expression, Context context)
  {
    if (className == null)
    {
      className = Parser.hashString(expression);
    }
    return Sequence.parse(className,
                          RealPolynomialSequence.class,
                          RealPolynomial.class,
                          expression,
                          context);
  }

  public static Expression<Integer, RealPolynomial, RealPolynomialSequence> parse(String className,
                                                                                  String string)
  {
    return parse(className, string, null);
  }

  public static Expression<Integer, RealPolynomial, RealPolynomialSequence> parse(String string)
  {
    return parse(null, string, null);
  }

  public static Expression<Integer, RealPolynomial, RealPolynomialSequence> parse(String string,
                                                                                  Context context)
  {
    return parse(null, string, context);
  }

}
