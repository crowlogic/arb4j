package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.functions.sequences.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuasiPolynomial
                                 extends
                                 QuasiPolynomial<Real, RealPolynomial, RealFunction> implements
                                 RealFunction,
                                 AutoCloseable

{

  @Override
  public String toString()
  {
    return String.format("RealQuasiPolynomial[f=%s, p=%s]", f, p);
  }

  @Override
  public void close()
  {
    if (p != null)
    {
      p.close();
      p = null;
    }
    if (f != null)
    {
      f.close();
      f = null;
    }
  }

  public static Expression<Integer, RealQuasiPolynomial, Sequence<RealQuasiPolynomial>>
         parseSequence(String className, String expression)
  {
    return parseSequence(className, expression, null);
  }

  public static Expression<Integer, RealQuasiPolynomial, Sequence<RealQuasiPolynomial>>
         parseSequence(String className, String expression, Context context)
  {
    return Function.parse(className,
                          expression,
                          context,
                          Integer.class,
                          RealQuasiPolynomial.class,
                          Sequence.class,
                          null,
                          null);
  }

  @SuppressWarnings("resource")
  public RealQuasiPolynomial identity()
  {
    p.identity();
    return this;
  }

  public RealQuasiPolynomial(RealPolynomial p, RealFunction f)
  {
    super(p,
          f);
  }

  public RealQuasiPolynomial(RealFunction f)
  {
    this(new RealPolynomial(),
         f);
  }

  public RealQuasiPolynomial()
  {
    this(null);
  }

  public RealQuasiPolynomial one()
  {
    p.identity();
    return this;
  }

  public RealQuasiPolynomial zero()
  {
    p.zero();
    return this;
  }

  public RealQuasiPolynomial mul(RealQuasiPolynomial operand, int bits, RealQuasiPolynomial result)
  {
    result.p      = p;
    result.f      = new RealFunction()
                  {

                    @Override
                    public Real evaluate(Real t, int order, int rbits, Real res)
                    {
                      try ( Real other = new Real();)
                      {
                        evaluate(t, order, rbits, res);
                        operand.evaluate(t, order, rbits, other);
                        return res.mul(other, rbits, res);
                      }
                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s*%s", RealQuasiPolynomial.this, operand);
                    }
                  };

    result.p.bits = bits;
    return result;
  }

  public RealQuasiPolynomial sqrt(int bits, RealQuasiPolynomial qXℝ2)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public RealQuasiPolynomial mul(Real real, int bits2, RealQuasiPolynomial result)
  {
    result.p      = p;
    result.f      = new RealFunction()
                  {

                    @Override
                    public Real evaluate(Real t, int order, int rbits, Real res)
                    {

                      evaluate(t, order, rbits, res);
                      return res.mul(real, rbits, res);

                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s*%s", RealQuasiPolynomial.this, real);
                    }
                  };

    result.p.bits = bits2;
    return result;
  }

  public RealQuasiPolynomial mul(Integer operand, int bits, RealQuasiPolynomial result)
  {
    result.p      = p;
    result.f      = new RealFunction()
                  {

                    @Override
                    public Real evaluate(Real t, int order, int rbits, Real res)
                    {

                      evaluate(t, order, rbits, res);
                      return res.mul(operand, rbits, res);

                    }

                    @Override
                    public String toString()
                    {
                      return String.format("%s*%s", RealQuasiPolynomial.this, operand);
                    }
                  };

    result.p.bits = bits;
    return result;
  }

}
