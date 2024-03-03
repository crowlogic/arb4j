package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factorℝ1 implements
                      Function<Integer, Real>
{
  private boolean isInitialized;
  Integer         c1 = new Integer("1");
  public Integer  n;
  public Integer  p;
  public Integer  q;
  public Real     α;
  public Real     β;
  public Integer  ℤ1 = new Integer();

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return α.get(in).risingFactorial(n.sub(c1, bits, ℤ1), bits, result);
  }

  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  public void close()
  {
    c1.close();
    ℤ1.close();
  }
}
