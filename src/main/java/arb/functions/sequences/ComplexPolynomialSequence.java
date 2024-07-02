package arb.functions.sequences;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
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
public interface ComplexPolynomialSequence extends PolynomialSequence<Complex, ComplexPolynomial>
{

  @Override
  default Class<ComplexPolynomial> coDomainType()
  {
    return ComplexPolynomial.class;
  }

  public static ComplexPolynomialSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static ComplexPolynomialSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static Expression<Integer, ComplexPolynomial, ComplexPolynomialSequence>
         parse(String className, String expression, Context context)
  {
    return Function.parse(className,
                          expression,
                          context,
                          Integer.class,
                          ComplexPolynomial.class,
                          ComplexPolynomialSequence.class,
                          null,
                          null);
  }

  public static ComplexPolynomialSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class,
                            ComplexPolynomial.class,
                            name,
                            expression,
                            context,
                            ComplexPolynomialSequence.class);
  }


}
