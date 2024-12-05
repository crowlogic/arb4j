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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return ((Real) this.C.evaluate(n.sub(this.cℤ1, bits, this.iℤ2),
                                   order,
                                   bits,
                                   this.iℝ2)).mul((Real) this.C.evaluate(n, order, bits, this.iℝ3), bits, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("F.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("F.β is null");
    }
    else
    {
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.isInitialized = true;
    }
  }

  public F()
  {
    this.cℤ1 = new Integer("1");
    this.iℤ2 = new Integer();
    this.iℝ3 = new Real();
    this.iℝ2 = new Real();
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.iℤ2.close();
    this.iℝ3.close();
    this.iℝ2.close();
    this.C.close();
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
