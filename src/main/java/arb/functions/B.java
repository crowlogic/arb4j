package arb.functions;

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
  public final Integer cℤ0000 = new Integer("1");
  public Fraction      vf0016 = new Fraction();
  public Fraction      vf0017 = new Fraction();
  public Real          vℝ0004 = new Real();
  public Real          vℝ0005 = new Real();
  public Real          vℝ0006 = new Real();
  public Real          vℝ0007 = new Real();
  public Real          vℝ0008 = new Real();
  public C             C;
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

    return n.add(α, bits, vℝ0004)
            .sub(cℤ0000, bits, vℝ0005)
            .mul(n.add(β, bits, vℝ0006).sub(cℤ0000, bits, vℝ0007), bits, vℝ0008)
            .mul(C.evaluate(vf0016.set(n), order, bits, vf0017), bits, result);
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
      if (C == null)
      {
        C = new C();
      }

      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vf0016.close();
    vf0017.close();
    vℝ0004.close();
    vℝ0005.close();
    vℝ0006.close();
    vℝ0007.close();
    vℝ0008.close();
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
