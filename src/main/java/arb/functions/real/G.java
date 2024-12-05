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
    if (!isInitialized)
    {
      initialize();
    }

    return α.pow(cℤ1, bits, iℝ4).sub(β.pow(cℤ1, bits, iℝ5), bits, result);
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
      throw new AssertionError("G.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("G.β is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    iℝ5.close();
    iℝ4.close();
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
