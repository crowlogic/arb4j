package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexIdentityFunction;
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
    super(p,
          f);
  }

  @SuppressWarnings("resource")
  public ComplexQuasiPolynomial(ComplexFunction f)
  {
    this(new ComplexPolynomial().identity(),
         f);
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
  public ComplexQuasiPolynomial add(ComplexQuasiPolynomial addend, int bits, ComplexQuasiPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ComplexQuasiPolynomial sub(ComplexQuasiPolynomial subtrahend, int bits, ComplexQuasiPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ComplexQuasiPolynomial mul(ComplexQuasiPolynomial operand, int prec, ComplexQuasiPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public ComplexQuasiPolynomial mul(Complex val, int bits2, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.f      = new ComplexFunction()
                  {

                    @Override
                    public Complex evaluate(Complex t, int order, int rbits, Complex res)
                    {

                      ComplexQuasiPolynomial.this.evaluate(t, order, rbits, res);
                      return res.mul(val, rbits, res);

                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s*%s", ComplexQuasiPolynomial.this, val);
                    }
                  };

    result.p.bits = bits2;
    return result;
  }

  public ComplexQuasiPolynomial set(ComplexQuasiPolynomial complexQuasiPolynomial)
  {
    this.f = complexQuasiPolynomial.f;
    this.p.set(complexQuasiPolynomial.p);
    return this;
  }

  @Override
  public ComplexQuasiPolynomial div(ComplexQuasiPolynomial j, int prec, ComplexQuasiPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public ComplexQuasiPolynomial div(Integer j, int prec, ComplexQuasiPolynomial result)
  {
    result.identity();
    result.f      = new ComplexFunction()
                  {

                    @Override
                    public Complex evaluate(Complex val, int order, int rbits, Complex res)
                    {

                      ComplexQuasiPolynomial.this.evaluate(val, rbits, res);
                      return res.div(val, rbits);

                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s/%s", ComplexQuasiPolynomial.this, j);
                    }
                  };

    result.p.bits = prec;
    return result;
  }

  @Override
  public <N extends Named> N setName(String name)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ComplexQuasiPolynomial pow(Integer power, int bits, ComplexQuasiPolynomial result)
  {
    result.identity();
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
                      return String.format("%s^%s", ComplexQuasiPolynomial.this, power);
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



}
