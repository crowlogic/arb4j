package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.utensils.ShellFunctions;

public class x implements
               RealPolynomialNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean        isInitialized;
  public final Integer  cℤ0000  = new Integer("2");
  public final Integer  cℤ0001  = new Integer("3");
  public final Integer  cℤ0003  = new Integer("1");
  public RealPolynomial vXℝ0001 = new RealPolynomial();
  public RealPolynomial vXℝ0002 = new RealPolynomial();
  public RealPolynomial vXℝ0003 = new RealPolynomial();
  public RealPolynomial vXℝ0004 = new RealPolynomial();
  public RealPolynomial vXℝ0005 = new RealPolynomial();
  public RealPolynomial vXℝ0006 = new RealPolynomial();
  public RealPolynomial vXℝ0007 = new RealPolynomial();
  public RealPolynomial vXℝ0008 = new RealPolynomial();
  public RealPolynomial vXℝ0009 = new RealPolynomial();
  public RealPolynomial vXℝ0010 = new RealPolynomial();
  public RealPolynomial vXℝ0011 = new RealPolynomial();
  public RealPolynomial vXℝ0012 = new RealPolynomial();
  public RealPolynomial vXℝ0013 = new RealPolynomial();
  public Integer        vℤ0001  = new Integer();
  public Integer        vℤ0002  = new Integer();
  public Real           a;
  public Real           b;
  public Real           c;

  public static void main(String args[])
  {
    var context = new Context(Real.named("a").set(2),
                              Real.named("b").set(4),
                              Real.named("c").set(6));
    x   x       = new x();
    context.injectReferences(x);
    var y = x.evaluate(128);
    System.out.println(x + "=" + y);
    ShellFunctions.inspect(x);
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

    RealPolynomial r1 = vXℝ0001.identity().pow(cℤ0000, bits, vXℝ0002);
    Integer        r2 = cℤ0000.mul(cℤ0003, bits, vℤ0001);
    RealPolynomial r3 = r2.div(vXℝ0003.identity(), bits, vXℝ0004);
    RealPolynomial r4 = vXℝ0008.identity().pow(cℤ0001, bits, vXℝ0009);
    RealPolynomial r5 = r1.mul(r3, bits, vXℝ0005);
    Integer        r6 = cℤ0001.mul(cℤ0003, bits, vℤ0002);
    RealPolynomial r7 = r6.div(vXℝ0010.identity(), bits, vXℝ0011);
    RealPolynomial r8 = r5.mul(b, bits, vXℝ0006);
    RealPolynomial r9 = r4.mul(r7, bits, vXℝ0012);
    RealPolynomial r10 = a.add(r8, bits, vXℝ0007);
    RealPolynomial r11 = r9.mul(c, bits, vXℝ0013);
    return r10.add(r11, bits, result);
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
    cℤ0000.close();
    cℤ0001.close();
    cℤ0003.close();
    vXℝ0001.close();
    vXℝ0002.close();
    vXℝ0003.close();
    vXℝ0004.close();
    vXℝ0005.close();
    vXℝ0006.close();
    vXℝ0007.close();
    vXℝ0008.close();
    vXℝ0009.close();
    vXℝ0010.close();
    vXℝ0011.close();
    vXℝ0012.close();
    vXℝ0013.close();
    vℤ0001.close();
    vℤ0002.close();
  }

  @Override
  public String toString()
  {
    return "((a+(((x^2)*((2*1)/x))*b))+(((x^3)*((3*1)/x))*c))";
  }

  @Override
  public String typeset()
  {
    return "a + {x}^{2} \\cdot \\frac{2 \\cdot 1}{x} \\cdot b + {x}^{3} \\cdot \\frac{3 \\cdot 1}{x} \\cdot c";
  }
}
