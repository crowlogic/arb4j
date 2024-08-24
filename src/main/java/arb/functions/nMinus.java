package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Typesettable;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.sequences.LommelPolynomial;

public class nMinus implements
                    RationalFunctionSequence,
                    Typesettable,
                    AutoCloseable,
                    Initializable
{
  public boolean                  isInitialized;
  public final Integer            cℤ2       = new Integer("3");
  public final Integer            cℤ1       = new Integer("1");
  public final Integer            cℤ3       = new Integer("2");
  public RationalFunction         q1        = new RationalFunction();
  public RationalFunction         q2        = new RationalFunction();
  public RationalFunction         q3        = new RationalFunction();
  public RationalFunction         q4        = new RationalFunction();
  public RationalFunction         q5        = new RationalFunction();
  public RationalFunction         q6        = new RationalFunction();
  public RationalFunction         q7        = new RationalFunction();
  public RationalFunction         q8        = new RationalFunction();
  public RationalFunction         q9        = new RationalFunction();
  public RationalFunction         elementq2 = new RationalFunction();
  public RationalFunction         elementq1 = new RationalFunction();
  public LommelPolynomial seqqR1    = new LommelPolynomial();
  public RationalFunction         q11       = new RationalFunction();
  public RationalFunction         q10       = new RationalFunction();
  public RationalFunction         q13       = new RationalFunction();
  public LommelPolynomial seqqR2    = new LommelPolynomial();
  public RationalFunction         q12       = new RationalFunction();
  public RationalFunction         q14       = new RationalFunction();

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    q1.identity();
    q3.set(elementq1).mul(q4.identity().sin(bits, q5), bits, q6);
    q7.identity();
    return q8.sub(q9.set(elementq2).mul(q10.identity().cos(bits, q11), bits, q12), bits, q13)
             .div(q14.identity(), bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    q1.close();
    q2.close();
    q3.close();
    q4.close();
    q5.close();
    q6.close();
    q7.close();
    q8.close();
    q9.close();
    elementq2.close();
    elementq1.close();
    seqqR1.close();
    q11.close();
    q10.close();
    q13.close();
    seqqR2.close();
    q12.close();
    q14.close();
  }

  @Override
  public String toString()
  {
    return "n➔(R(n,½;x)*sin(x) - R(n-1,3⁄2;x)*cos(x))/x";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(R_{n, \\frac{1}{2}}(x) \\cdot \\sin(x)-R_{\\left(n-1\\right), \\frac{3}{2}}(x) \\cdot \\cos(x)\\right)}{x}";
  }
}
