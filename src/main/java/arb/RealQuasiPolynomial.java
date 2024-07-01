package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.polynomials.quasi.QuasiPolynomial;
import arb.functions.polynomials.quasi.real.RealQuasiPolynomialAddition;
import arb.functions.polynomials.quasi.real.RealQuasiPolynomialDivision;
import arb.functions.polynomials.quasi.real.RealQuasiPolynomialMultiplication;
import arb.functions.polynomials.quasi.real.RealQuasiPolynomialSquareRoot;
import arb.functions.polynomials.quasi.real.RealQuasiPolynomialSubtraction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealIdentityFunction;
import arb.functions.real.RealQuasiPolynomialNullaryFunction;
import arb.functions.sequences.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuasiPolynomial
                                 extends
                                 QuasiPolynomial<Real, RealPolynomial, RealFunction, RealQuasiPolynomial> implements
                                 RealFunction,
                                 AutoCloseable

{

  public static Expression<Object, RealQuasiPolynomial, RealQuasiPolynomialNullaryFunction> parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          Object.class,
                          RealQuasiPolynomial.class,
                          RealQuasiPolynomialNullaryFunction.class,
                          null,
                          null);
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

  public RealQuasiPolynomial()
  {
    this(RealIdentityFunction.instance);
  }

  @SuppressWarnings("resource")
  public RealQuasiPolynomial(RealFunction f)
  {
    this(new RealPolynomial().identity(),
         f);
  }

  public RealQuasiPolynomial(RealPolynomial p, RealFunction f)
  {
    super(p,
          f);
  }

  public RealQuasiPolynomial add(Real addend, int bits, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = bits;
    String str = toString();
    result.f = new RealFunction()
    {

      @Override
      public Real evaluate(Real t, int order, int bits, Real res)
      {
        RealQuasiPolynomial.this.evaluate(t, order, bits, res);
        res.add(addend, bits);
        return res;

      }

      @Override
      public String toString()
      {
        return String.format("%s+%s", str, addend);
      }
    };
    return result;
  }

  @Override
  public RealQuasiPolynomial add(RealQuasiPolynomial operand, int bits, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = bits;
    result.f      = new RealQuasiPolynomialAddition(this,
                                                    operand);

    return result;
  }

  @Override
  public RealQuasiPolynomial additiveIdentity()
  {
    return identity();
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

  public RealQuasiPolynomial div(Integer operand, int bits, RealQuasiPolynomial result)
  {
    p.div(operand, bits, result.p );    
    return result;
  }

  @Override
  public RealQuasiPolynomial div(RealQuasiPolynomial operand, int prec, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = prec;
    result.f      = new RealQuasiPolynomialDivision(this,
                                                    operand);

    return result;
  }

  public RealQuasiPolynomial identity()
  {
    p.identity();
    return this;
  }

  public RealQuasiPolynomial mul(Integer operand, int bits, RealQuasiPolynomial result)
  {
    result.p      = p;
    result.f      = new RealFunction()
                  {

                    @Override
                    public Real evaluate(Real t, int order, int rbits, Real res)
                    {

                      RealQuasiPolynomial.this.evaluate(t, order, rbits, res);
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

  public RealQuasiPolynomial mul(Real real, int bits2, RealQuasiPolynomial result)
  {
    result.identity();
    result.f      = new RealFunction()
                  {

                    @Override
                    public Real evaluate(Real t, int order, int rbits, Real res)
                    {

                      RealQuasiPolynomial.this.evaluate(t, order, rbits, res);
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

  @Override
  public RealQuasiPolynomial mul(RealQuasiPolynomial operand, int prec, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = prec;
    result.f      = new RealQuasiPolynomialMultiplication(this,
                                                          operand);

    return result;
  }

  public RealQuasiPolynomial one()
  {
    p.identity();
    return this;
  }

  @Override
  public RealQuasiPolynomial pow(Integer power, int bits, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = bits;
    result.f      = (x, order, fbits, fresult) ->
                  {
                    RealQuasiPolynomial.this.evaluate(x, order, fbits, fresult.identity());
                    fresult.pow(power, fbits);
                    return fresult;
                  };
    return result;
  }

  public RealQuasiPolynomial pow(RealQuasiPolynomial exponent, int bits, RealQuasiPolynomial res)
  {
    assert false : "TODO";
    return null;
  }

  /**
   * Calls this#p{@link #set(Integer)}
   * 
   * @param integer
   * @return
   */
  public RealQuasiPolynomial set(Integer integer)
  {
    p.set(integer);
    return this;
  }

  @Override
  public <N extends Named> N setName(String name)
  {
    assert false : "TODO";
    return null;
  }

  public RealQuasiPolynomial sqrt(int bits, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = bits;
    result.f      = new RealQuasiPolynomialSquareRoot(this);
    return result;
  }

  @Override
  public RealQuasiPolynomial sub(RealQuasiPolynomial operand, int bits, RealQuasiPolynomial result)
  {
    result.identity();
    result.p.bits = bits;
    result.f      = new RealQuasiPolynomialSubtraction(this,
                                                       operand);

    return result;
  }

  @Override
  public String toString()
  {
    return f.toStringWithoutIndependentVariableSpecified().replaceAll("x", p.toString());
  }

  public RealQuasiPolynomial zero()
  {
    p.zero();
    return this;
  }

}
