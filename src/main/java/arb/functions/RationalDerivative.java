package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.rational.RationalNullaryFunction;

public class RationalDerivative implements RationalNullaryFunction,Typesettable,AutoCloseable,Initializable,Named
{
  public boolean          isInitialized;
  public Context          context = new Context();
  public final Integer    cℤ0000  = new Integer("2");
  public final Integer    cℤ0001  = new Integer("3");
  public final Integer    cℤ0002  = new Integer("0");
  public final Integer    cℤ0003  = new Integer("1");
  public RationalFunction vℚ0001  = new RationalFunction();
  public RationalFunction vℚ0002  = new RationalFunction();
  public RationalFunction vℚ0003  = new RationalFunction();
  public RationalFunction vℚ0004  = new RationalFunction();
  public RationalFunction vℚ0005  = new RationalFunction();
  public RationalFunction vℚ0006  = new RationalFunction();
  public RationalFunction vℚ0007  = new RationalFunction();
  public Real             a;
  public Real             b;
  public Real             c;

  @Override
  public Class<Object> domainType()
  {
    return Object.class;
  }

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Object x, int order, int bits, RationalFunction result)
  {
    if (order > 1)
    {
      throw new AssertionError("TODO: implement order=" + order + ">1");
    }
    else
    {
      if (!isInitialized)
      {
        initialize();
      }

      return a.add(cℤ0000.mul(((RationalFunction) x).pow(cℤ0003, bits, vℚ0001), bits, vℚ0002)
                         .mul(b, bits, vℚ0003),
                   bits,
                   vℚ0004)
              .add(cℤ0001.mul(((RationalFunction) x).pow(cℤ0000, bits, vℚ0005), bits, vℚ0006)
                         .mul(c, bits, vℚ0007),
                   bits,
                   result);
    }
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
      throw new AssertionError("a is null");
    }
    else if (b == null)
    {
      throw new AssertionError("b is null");
    }
    else if (c == null)
    {
      throw new AssertionError("c is null");
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
    cℤ0002.close();
    cℤ0003.close();
    vℚ0001.close();
    vℚ0002.close();
    vℚ0003.close();
    vℚ0004.close();
    vℚ0005.close();
    vℚ0006.close();
    vℚ0007.close();
  }

  @Override
  public String getName()
  {
    return null;
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "x➔(a+((2*(x^1))*b))+((3*(x^2))*c)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left(a + \\left(\\left(2 \\cdot {x}^{1}\\right) \\cdot b\\right)\\right) + \\left(\\left(3 \\cdot {x}^{2}\\right) \\cdot c\\right)\\right)";
  }
}
