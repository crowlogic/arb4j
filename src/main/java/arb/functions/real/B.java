package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.RealSequence;

public class B implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ1;
  public Real          iℝ15;
  public Real          iℝ16;
  public Real          iℝ17;
  public Real          iℝ12;
  public Real          iℝ13;
  public Real          iℝ14;
  public C             C = new C();
  public Real          α;
  public Real          β;

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Integer n, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return n.add(α, bits, iℝ12)
            .sub(cℤ1, bits, iℝ13)
            .mul(n.add(β, bits, iℝ14).sub(cℤ1, bits, iℝ15), bits, iℝ16)
            .mul(C.evaluate(n, order, bits, iℝ17), bits, result);
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
    cℤ1  = new Integer("1");
    iℝ15 = new Real();
    iℝ16 = new Real();
    iℝ17 = new Real();
    iℝ12 = new Real();
    iℝ13 = new Real();
    iℝ14 = new Real();
  }

  @Override
  public void close()
  {
    cℤ1.close();
    iℝ15.close();
    iℝ16.close();
    iℝ17.close();
    iℝ12.close();
    iℝ13.close();
    iℝ14.close();
    C.close();
  }

  @Override
  public String toString()
  {
    return "B:n➔(n+α-1)*(n+β-1)*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\left(n + α-1\\right) \\cdot \\left(n + β-1\\right) \\cdot \\C(n)";
  }
}