package arb.functions;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

public class FloorOfOneHundedOverTheSquareRootOfOneHalf implements
                                                        IntegerNullaryFunction,
                                                        Typesettable,
                                                        AutoCloseable,
                                                        Initializable
{
  public static void main(String... args)
  {
    FloorOfOneHundedOverTheSquareRootOfOneHalf f = new FloorOfOneHundedOverTheSquareRootOfOneHalf();
    Integer                                    x = f.evaluate(128);
    System.out.format("f(x)=%s\n", f, x);  }

  public boolean  isInitialized;
  Integer         cℤ2 = new Integer("1");
  Integer         cℤ1 = new Integer("100");
  Integer         cℤ3 = new Integer("2");
  public Real     ℝ1  = new Real();
  public Real     ℝ2  = new Real();
  public Fraction f1  = new Fraction();

  @Override
  public Class<Integer> coDomainType()
  {
    return Integer.class;
  }

  @Override
  public Integer evaluate(Object in, int order, int bits, Integer result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return cℤ1.div(cℤ2.div(cℤ3, bits, f1).sqrt(bits, ℝ1), bits, ℝ2).floor(bits, result);
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
    ℝ1.close();
    ℝ2.close();
    f1.close();
  }

  @Override
  public String toString()
  {
    return "⌊100/√(1⁄2)⌋";
  }

  @Override
  public String typeset()
  {
    return "\\lfloor{\\frac{100}{\\sqrt{\\frac{1}{2}}}}\\rfloor";
  }
}
