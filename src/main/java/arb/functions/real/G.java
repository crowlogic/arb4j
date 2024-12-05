package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalNullaryFunction;

public class G implements
               RationalNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ1 = new Integer("2");
  public Real          iℝ5 = new Real();
  public Real          iℝ4 = new Real();
  public Real          α;
  public Real          β;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Object in, int order, int bits, RationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return this.α.pow(this.cℤ1, bits, this.iℝ4).sub(this.β.pow(this.cℤ1, bits, this.iℝ5), bits, result);
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
      throw new AssertionError("G.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("G.β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.iℝ5.close();
    this.iℝ4.close();
  }

  @Override
  public String toString()
  {
    return "G:α²-β²";
  }

  @Override
  public String typeset()
  {
    return "\\left({α}^{2}-{β}^{2}\\right)";
  }
}
