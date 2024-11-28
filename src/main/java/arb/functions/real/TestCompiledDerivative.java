package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.DerivativeNode;
import junit.framework.TestCase;

/**
 * Decompiled {@link DerivativeNode} test function
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TestCompiledDerivative implements
                                    RealFunctional<Object, RealFunction>,
                                    Typesettable,
                                    AutoCloseable,
                                    Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ2     = new Integer("3");
  public final Integer cℤ1     = new Integer("2");
  public final Integer cℤ4     = new Integer("1");
  public final Integer cℤ3     = new Integer("0");
  public Real          a;
  public Real          b;
  public Real          c;
  public Real          ifuncℝ4 = new Real();
  public Real          ifuncℝ5 = new Real();
  public Integer       iℤ2     = new Integer();
  public Real          ifuncℝ6 = new Real();
  public Integer       iℤ1     = new Integer();
  public Real          ifuncℝ7 = new Real();
  public Real          ifuncℝ1 = new Real();
  public Real          ifuncℝ2 = new Real();
  public Real          ifuncℝ3 = new Real();
  public Real          ifuncℝ8 = new Real();

  public static void main(String args[])
  {
    try ( TestCompiledDerivative derivative = new TestCompiledDerivative())
    {
      derivative.a = Real.named("a").set(2);
      derivative.b = Real.named("b").set(4);
      derivative.c = Real.named("c").set(6);

      RealFunction d   = derivative.evaluate(null, 128);
      double       val = d.eval(2.3);
      TestCase.assertEquals(115.61999999999998, val);
      System.out.format("%s(2.3)=%s\n", d, val);
    }

  }

  @Override
  public Class<RealFunction> coDomainType()
  {
    return RealFunction.class;
  }

  @Override
  public RealFunction evaluate(Object in, int order, int bits, RealFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }
    RealFunction realFunction = new RealFunction()
    {

      @Override
      public Real evaluate(Real input, int order, int bits, Real res)
      {

        return a.add(b.mul(cℤ1.mul(input.pow(cℤ1.sub(cℤ4, bits, iℤ1), bits, ifuncℝ1), bits, ifuncℝ2), bits, ifuncℝ3),
                     bits,
                     ifuncℝ4)
                .add(c.mul(cℤ2.mul(input.pow(cℤ2.sub(cℤ4, bits, iℤ2), bits, ifuncℝ5), bits, ifuncℝ6), bits, ifuncℝ7),
                     bits,
                     ifuncℝ8);

      }

      @Override
      public String toString()
      {
        return TestCompiledDerivative.this.toString();
      }
    };
    return realFunction;
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
    ifuncℝ4.close();
    ifuncℝ5.close();
    iℤ2.close();
    ifuncℝ6.close();
    iℤ1.close();
    ifuncℝ7.close();
    ifuncℝ1.close();
    ifuncℝ2.close();
    ifuncℝ3.close();
    ifuncℝ8.close();
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
