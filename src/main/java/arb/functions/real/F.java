package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.RealSequence;

public class F implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ1;
  public Integer       iℤ2;
  public Real          iℝ3;
  public Real          iℝ2;
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

    return C.evaluate(n.sub(cℤ1, bits, iℤ2), order, bits, iℝ2).mul(C.evaluate(n, order, bits, iℝ3), bits, result);
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
      throw new AssertionError("F.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("F.β is null");
    }
    else
    {
      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  public F()
  {
    cℤ1 = new Integer("1");
    iℤ2 = new Integer();
    iℝ3 = new Real();
    iℝ2 = new Real();
  }

  @Override
  public void close()
  {
    cℤ1.close();
    iℤ2.close();
    iℝ3.close();
    iℝ2.close();
    C.close();
  }

  @Override
  public String toString()
  {
    return "F:n➔C(n-1)*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\C(\\left(n-1\\right)) \\cdot \\C(n)";
  }
}
