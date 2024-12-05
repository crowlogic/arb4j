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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return n.mul((Real) this.C.evaluate(n.div(this.cℤ1, bits, this.iℤ3), order, bits, this.iℝ9), bits, this.iℝ10)
            .mul((Real) this.C.evaluate(n.sub(this.cℤ2, bits, this.iℤ4), order, bits, this.iℝ11), bits, result);
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
      throw new AssertionError("E.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("E.β is null");
    }
    else
    {
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.isInitialized = true;
    }
  }

  public E()
  {
    this.cℤ2  = new Integer("1");
    this.cℤ1  = new Integer("2");
    this.iℝ9  = new Real();
    this.iℝ11 = new Real();
    this.iℤ4  = new Integer();
    this.iℤ3  = new Integer();
    this.iℝ10 = new Real();
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.iℝ9.close();
    this.iℝ11.close();
    this.iℤ4.close();
    this.iℤ3.close();
    this.iℝ10.close();
    this.C.close();
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
