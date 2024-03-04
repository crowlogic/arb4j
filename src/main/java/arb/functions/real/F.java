package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements
               Function<Integer, Real>
{
  private boolean       isInitialized;
  Integer               c1;
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public Real           valueℝ1;
  public Integer        k;
  public Real           productℝ1;
  public Integer        endIndexℤ1;
  public Real           valueℝ2;
  public Real           productℝ2;
  public Integer        endIndexℤ2;
  public final factorℝ2 factorℝ2 = new factorℝ2();
  public final factorℝ1 factorℝ1 = new factorℝ1();

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    factorℝ1.n = in;
    productℝ1.multiplicativeIdentity();
    k.set(c1);
    endIndexℤ1.set(p);

    do
    {
      productℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
    }
    while (k.increment().compareTo(endIndexℤ1) <= 0);

    Real var10000 = productℝ1;
    factorℝ2.n = in;
    productℝ2.multiplicativeIdentity();
    k.set(c1);
    endIndexℤ2.set(q);

    do
    {
      productℝ2.mul(factorℝ2.evaluate(k, bits, valueℝ2), bits);
    }
    while (k.increment().compareTo(endIndexℤ2) <= 0);

    return var10000.div(productℝ2, bits, result);
  }

  public F()
  {
    c1         = new Integer("1");
    valueℝ1    = new Real();
    k          = new Integer();
    productℝ1  = new Real();
    endIndexℤ1 = new Integer();
    valueℝ2    = new Real();
    productℝ2  = new Real();
    endIndexℤ2 = new Integer();
  }

  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (p == null)
    {
      throw new AssertionError("p is null");
    }
    else if (q == null)
    {
      throw new AssertionError("q is null");
    }
    else
    {
      factorℝ2.p    = p;
      factorℝ2.q    = q;
      factorℝ2.α    = α;
      factorℝ2.β    = β;
      factorℝ1.p    = p;
      factorℝ1.q    = q;
      factorℝ1.α    = α;
      factorℝ1.β    = β;
      isInitialized = true;
    }
  }

  public void close()
  {
    c1.close();
    valueℝ1.close();
    k.close();
    productℝ1.close();
    endIndexℤ1.close();
    valueℝ2.close();
    productℝ2.close();
    endIndexℤ2.close();
  }
}
