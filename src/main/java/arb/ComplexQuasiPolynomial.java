package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.sequences.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexQuasiPolynomial implements ComplexFunction

{

  public static Expression<Integer, ComplexQuasiPolynomial, Sequence<ComplexQuasiPolynomial>>
         parseSequence(String className, String expression)
  {
    return parseSequence(className, expression, null);
  }

  public static Expression<Integer, ComplexQuasiPolynomial, Sequence<ComplexQuasiPolynomial>>
         parseSequence(String className, String expression, Context context)
  {
    return Function.parse(className,
                          expression,
                          context,
                          Integer.class,
                          ComplexQuasiPolynomial.class,
                          Sequence.class,
                          null,
                          null);
  }

  @Override
  public String toString()
  {
    return String.format("%s(%s)", f, p);
  }

  ComplexPolynomial p;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    p.evaluate(z, order, prec, w);
    return f.evaluate(w, order, prec, w);
  }

  public ComplexFunction f;

  public ComplexQuasiPolynomial(ComplexPolynomial p, ComplexFunction f)
  {
    this.p = p;
    this.f = f;
  }

  public ComplexQuasiPolynomial(ComplexFunction f)
  {
    this.f = f;
  }

  public ComplexQuasiPolynomial()
  {
  }

  public ComplexQuasiPolynomial mul(Integer pow, int bits, ComplexQuasiPolynomial xℝ3)
  {
    assert false : "TODO";
    return this;
  }

  @SuppressWarnings("resource")
  public ComplexQuasiPolynomial identity()
  {
    if (p != null)
    {
      p.close();
      p = new ComplexPolynomial().identity();
    }
    return this;
  }

}
