package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalFunctionSequence;

public class A implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean          isInitialized;
  public final Integer    cℤ0002;
  public final Integer    cℤ0001;
  public RationalFunction ℚ0002;
  public RationalFunction ℚ0003;
  public RationalFunction ℚ0004;
  public RationalFunction ℚ0005;
  public Real             ℝ0003;
  public RationalFunction ℚ0001;
  public Fraction         f0005;
  public Real             ℝ0002;
  public Fraction         f0004;
  public Fraction         f0003;
  public C                C = new C();
  public F                F = new F();
  public Real             α;
  public Real             β;

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

    return F.evaluate(n, order, bits, f0003)
            .mul(ℚ0001.identity(), bits, ℚ0002)
            .add(α.pow(cℤ0001, bits, ℝ0002), bits, ℚ0003)
            .sub(β.pow(cℤ0001, bits, ℝ0003), bits, ℚ0004)
            .mul(C.evaluate(n, order, bits, f0004).sub(cℤ0002, bits, f0005), bits, ℚ0005)
            .div(cℤ0001, bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("A.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("A.β is null");
    }
    else
    {
      C.α           = α;
      C.β           = β;
      F.α           = α;
      F.β           = β;
      isInitialized = true;
    }
  }

  public A()
  {
    cℤ0002 = new Integer("1");
    cℤ0001 = new Integer("2");
    ℚ0002  = new RationalFunction();
    ℚ0003  = new RationalFunction();
    ℚ0004  = new RationalFunction();
    ℚ0005  = new RationalFunction();
    ℝ0003  = new Real();
    ℚ0001  = new RationalFunction();
    f0005  = new Fraction();
    ℝ0002  = new Real();
    f0004  = new Fraction();
    f0003  = new Fraction();
  }

  @Override
  public void close()
  {
    cℤ0002.close();
    cℤ0001.close();
    ℚ0002.close();
    ℚ0003.close();
    ℚ0004.close();
    ℚ0005.close();
    ℝ0003.close();
    ℚ0001.close();
    f0005.close();
    ℝ0002.close();
    f0004.close();
    f0003.close();
    C.close();
    F.close();
  }

  @Override
  public String toString()
  {
    return "A:n➔((F(n)*x+α^2)-(β^2)*C(n)-1)/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\F(n) \\cdot x + {α}^{2}-{β}^{2}\\right) \\cdot \\left(\\C(n)-1\\right)}{2}";
  }
}
