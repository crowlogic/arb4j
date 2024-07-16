package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RealConstants;
import arb.RealRationalFunction;
import arb.Typesettable;

public class Larg implements RealRationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean              isInitialized;
  Integer                     cℤ1 = new Integer("2");
  public RealRationalFunction fℝ1 = new RealRationalFunction();

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  @Override
  public RealRationalFunction evaluate(Object in, int order, int bits, RealRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    result.identity();
    System.out.println("result.identity=" + result );
    result.div(cℤ1, bits, fℝ1);
    System.out.println("fℝ1=" + fℝ1);
    return RealConstants.half.sub(fℝ1, bits, result);
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
    cℤ1.close();
    fℝ1.close();
  }

  @Override
  public String toString()
  {
    return "½-(x/2)";
  }

  @Override
  public String typeset()
  {
    return "(\\frac{1}{2}-\\frac{x}{2})";
  }
}
