package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import junit.framework.TestCase;

public class xRealFuncTweaked implements
               RealPolynomialNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean        isInitialized;
  public final Integer  cℤ2  = new Integer("3");
  public final Integer  cℤ1  = new Integer("2");
  public final Integer  cℤ4  = new Integer("1");
  public final Integer  cℤ3  = new Integer("0");
  public Real           a;
  public Real           b;
  public Real           c;
  public RealPolynomial iXℝ3 = new RealPolynomial();
  public RealPolynomial iXℝ2 = new RealPolynomial();
  public Integer        iℤ2  = new Integer();
  public RealPolynomial iXℝ5 = new RealPolynomial();
  public Integer        iℤ1  = new Integer();
  public RealPolynomial iXℝ4 = new RealPolynomial();
  public RealPolynomial iXℝ1 = new RealPolynomial();
  public RealPolynomial iXℝ7 = new RealPolynomial();
  public RealPolynomial iXℝ6 = new RealPolynomial();
  public RealPolynomial iXℝ8 = new RealPolynomial();

  public static void main( String args[] )
  {
    try ( xRealFuncTweaked x = new xRealFuncTweaked())
    {
      x.a = Real.named("a").set(2);
      x.b = Real.named("b").set(4);
      x.c = Real.named("c").set(6);
      RealPolynomial val = x.evaluate(128);
      System.out.println( x + "=" + val );
      TestCase.assertEquals("18*x² + 8*x + 2", val.toString());
    }
  }
  
  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  @Override
  public RealPolynomial evaluate(Object in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return a.add(b.mul(cℤ1.mul(result.identity().pow(cℤ1.sub(cℤ4, bits, iℤ1), bits, iXℝ1), bits, iXℝ2), bits, iXℝ3),
                 bits,
                 iXℝ4)
            .add(c.mul(cℤ2.mul(result.identity().pow(cℤ2.sub(cℤ4, bits, iℤ2), bits, iXℝ5), bits, iXℝ6), bits, iXℝ7),
                 bits,
                 result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (a == null)
    {
      throw new AssertionError("x-∂a*x+b*x²+c*x³⁄∂x.a is null");
    }
    else if (b == null)
    {
      throw new AssertionError("x-∂a*x+b*x²+c*x³⁄∂x.b is null");
    }
    else if (c == null)
    {
      throw new AssertionError("x-∂a*x+b*x²+c*x³⁄∂x.c is null");
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
    cℤ4.close();
    cℤ3.close();
    iXℝ3.close();
    iXℝ2.close();
    iℤ2.close();
    iXℝ5.close();
    iℤ1.close();
    iXℝ4.close();
    iXℝ1.close();
    iXℝ7.close();
    iXℝ6.close();
    iXℝ8.close();
  }

  @Override
  public String toString()
  {
    return "x➔∂a*x+b*x²+c*x³/∂x";
  }

  @Override
  public String typeset()
  {
    return "a + b \\cdot 2 \\cdot {x}^{(\\left(2-1\\right))} + c \\cdot 3 \\cdot {x}^{(\\left(3-1\\right))}";
  }
}
