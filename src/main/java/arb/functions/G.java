package arb.functions;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

public class G implements
               NullaryFunction<Fraction>,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("2");
  public Real          vℝ0002 = new Real();
  public Real          vℝ0003 = new Real();
  public Real          α;
  public Real          β;

  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  @Override
  public Fraction evaluate(Object in, int order, int bits, Fraction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return α.pow(cℤ0000, bits, vℝ0002).sub(β.pow(cℤ0000, bits, vℝ0003), bits, result);
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
    cℤ0000.close();
    vℝ0002.close();
    vℝ0003.close();
  }

  @Override
  public String toString()
  {
    return "G:(α^2)-(β^2)";
  }

  @Override
  public String typeset()
  {
    return "\\left({α}^{2}-{β}^{2}\\right)";
  }
}
