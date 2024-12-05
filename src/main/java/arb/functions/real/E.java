package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.RealSequence;

public class E implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ2;
  public final Integer cℤ1;
  public Real          iℝ9;
  public Real          iℝ11;
  public Integer       iℤ4;
  public Integer       iℤ3;
  public Real          iℝ10;
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

    return n.mul(C.evaluate(n.div(cℤ1, bits, iℤ3), order, bits, iℝ9), bits, iℝ10)
            .mul(C.evaluate(n.sub(cℤ2, bits, iℤ4), order, bits, iℝ11), bits, result);
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
      throw new AssertionError("E.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("E.β is null");
    }
    else
    {
      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  public E()
  {
    cℤ2  = new Integer("1");
    cℤ1  = new Integer("2");
    iℝ9  = new Real();
    iℝ11 = new Real();
    iℤ4  = new Integer();
    iℤ3  = new Integer();
    iℝ10 = new Real();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    iℝ9.close();
    iℝ11.close();
    iℤ4.close();
    iℤ3.close();
    iℝ10.close();
    C.close();
  }

  @Override
  public String toString()
  {
    return "E:n➔n*C(n/2)*C(n-1)";
  }

  @Override
  public String typeset()
  {
    return "n \\cdot \\C(\\frac{n}{2}) \\cdot \\C(\\left(n-1\\right))";
  }
}
