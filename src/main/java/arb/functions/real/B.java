package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;

public class B implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0001;
  public Real          ℝ0007;
  public Real          ℝ0008;
  public Real          ℝ0005;
  public Real          ℝ0006;
  public Real          ℝ0004;
  public Fraction      f0009;
  public C             C = new C();
  public Real          α;
  public Real          β;

  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  @Override
  public Fraction evaluate(Integer n, int order, int bits, Fraction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return n.add(α, bits, ℝ0004)
            .sub(cℤ0001, bits, ℝ0005)
            .mul(n.add(β, bits, ℝ0006).sub(cℤ0001, bits, ℝ0007), bits, ℝ0008)
            .mul(C.evaluate(n, order, bits, f0009), bits, result);
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
      throw new AssertionError("B.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("B.β is null");
    }
    else
    {
      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  public B()
  {
    cℤ0001 = new Integer("1");
    ℝ0007  = new Real();
    ℝ0008  = new Real();
    ℝ0005  = new Real();
    ℝ0006  = new Real();
    ℝ0004  = new Real();
    f0009  = new Fraction();
  }

  @Override
  public void close()
  {
    cℤ0001.close();
    ℝ0007.close();
    ℝ0008.close();
    ℝ0005.close();
    ℝ0006.close();
    ℝ0004.close();
    f0009.close();
    C.close();
  }

  @Override
  public String toString()
  {
    return "B:n➔(n+α)-1*(n+β)-1*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\left(n + α-1\\right) \\cdot \\left(n + β-1\\right) \\cdot \\C(n)";
  }
}
