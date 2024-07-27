package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexIdentityFunction;
import arb.functions.complex.ComplexQuasiPolynomialNullaryFunction;
import arb.functions.polynomials.quasi.QuasiPolynomial;
import arb.functions.sequences.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexQuasiPolynomial
                                    extends
                                    QuasiPolynomial<Complex, ComplexPolynomial, ComplexFunction, ComplexQuasiPolynomial>
                                    implements
                                    ComplexFunction

{

  public ComplexQuasiPolynomial add(ComplexQuasiPolynomial q, int prec)
  {
    return add(q, prec, this);
  }

  @Override
  public ComplexQuasiPolynomial add(ComplexQuasiPolynomial operand, int prec, ComplexQuasiPolynomial result)
  {
    assert p != null;
    result.identity();
    result.p.bits = prec;
    assert false : "defunct";

    return result;
  }

  @Override
  public ComplexQuasiPolynomial mul(ComplexQuasiPolynomial operand, int prec, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = prec;
    p.mul(operand.p, prec, result.p);
    result.f      = f;
    return result;
  }

  public ComplexQuasiPolynomial mul(Real scalar, int bits2, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.f      = new ComplexFunction()
                  {

                    @Override
                    public Complex evaluate(Complex t, int order, int rbits, Complex res)
                    {

                      ComplexQuasiPolynomial.this.evaluate(t, order, rbits, res);
                      return res.mul(scalar, rbits, res);

                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s*%s", ComplexQuasiPolynomial.this, scalar);
                    }
                  };

    result.p.bits = bits2;
    return result;
  }

  public ComplexQuasiPolynomial()
  {
    this(ComplexIdentityFunction.instance);
  }

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
    return f.toString().replaceAll("x", p.toString());
  }

  public ComplexPolynomial p;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert f != p : "f should not be equal to p";
    p.evaluate(z, order, prec, w);
    return f.evaluate(w, order, prec, w);
  }

  public ComplexFunction f;

  public ComplexQuasiPolynomial(ComplexPolynomial p, ComplexFunction f)
  {
    super(p,
          f);
    assert f != null;

  }

  @SuppressWarnings("resource")
  public ComplexQuasiPolynomial(ComplexFunction f)
  {
    this(new ComplexPolynomial().identity(),
         f);
    assert f != null;
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
    }
    p = new ComplexPolynomial().identity();
    return this;
  }

  public ComplexQuasiPolynomial multiplicativeIdentity()
  {
    return identity();
  }

  public ComplexQuasiPolynomial zero()
  {
    p.zero();
    return this;
  }

  @Override
  public ComplexQuasiPolynomial sub(ComplexQuasiPolynomial subtrahend, int bits, ComplexQuasiPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public ComplexQuasiPolynomial mul(ComplexQuasiPolynomial operand, int prec)
  {
    return mul(operand, prec, this);
  }

  public ComplexQuasiPolynomial mul(Complex val, int bits2, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.p = p.mul(val, bits2,result.p);
    result.f = f;
    result.p.bits = bits2;
    return result;
  }

  public ComplexQuasiPolynomial set(ComplexQuasiPolynomial complexQuasiPolynomial)
  {
    identity();
    this.f = complexQuasiPolynomial.f;
    this.p.set(complexQuasiPolynomial.p);
    return this;
  }

  @Override
  public ComplexQuasiPolynomial div(ComplexQuasiPolynomial operand, int prec, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.p.div(operand.p, prec, result.p);
    result.f = f;
    return result;
  }

  public ComplexQuasiPolynomial div(Integer j, int prec, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.p.div(j, prec, result.p);
    result.f = f;
    return result;
  }



  @Override
  public ComplexQuasiPolynomial pow(Integer power, int bits, ComplexQuasiPolynomial result)
  {
    assert f != null : "f is null";
    assert p != null : "p is null";
    result.identity();
    final String thisStr = this.toString();
    result.f      = new ComplexFunction()
                  {

                    @Override
                    public Complex evaluate(Complex val, int order, int rbits, Complex res)
                    {

                      ComplexQuasiPolynomial.this.evaluate(val, rbits, res);
                      return res.pow(power.getSignedValue(), rbits);

                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s^%s", thisStr, power);
                    }
                  };

    result.p.bits = bits;
    return result;
  }

  @Override
  public ComplexQuasiPolynomial additiveIdentity()
  {
    return identity().zero();
  }

  public ComplexQuasiPolynomial set(int i)
  {
    identity();
    p.set(i);
    return this;
  }

  public ComplexQuasiPolynomial set(Complex val)
  {
    identity();
    p.set(val);
    return this;
  }

  public static Expression<Object, ComplexQuasiPolynomial, ComplexQuasiPolynomialNullaryFunction>
         parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          Object.class,
                          ComplexQuasiPolynomial.class,
                          ComplexQuasiPolynomialNullaryFunction.class,
                          null,
                          null);
  }

  public ComplexQuasiPolynomial set(Integer integer)
  {
    identity();
    p.set(integer);
    return this;
  }
}
