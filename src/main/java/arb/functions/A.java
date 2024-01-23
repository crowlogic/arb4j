package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class A implements
               Function<Integer, RealPolynomial>
{
  private boolean       isInitialized;
  public Integer        const1 = new Integer("1");
  public Integer        const2 = new Integer("2");
  public Real           α;
  public Real           β;
  public Real           ℝ1     = new Real();
  public RealPolynomial r1     = new RealPolynomial();
  public Real           ℝ2     = new Real();
  public RealPolynomial r2     = new RealPolynomial();
  public Real           ℝ3     = new Real();
  public Real           ℝ4     = new Real();
  public Real           ℝ5     = new Real();
  public RealPolynomial r3     = new RealPolynomial();
  public A              A;
  public C              C;
  public wtf            F;
  public G              G;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initializeContext();
    }

    return F.evaluate(in, order, bits, ℝ1)
            .mul(result.identity(), bits, r1)
            .add(G.evaluate(null, order, bits, ℝ2), bits, r2)
            .mul(C.evaluate(ℝ3.set(in), order, bits, ℝ4).sub(const1, bits, ℝ5), bits, r3)
            .div(const2, bits, result);
  }

  public void initializeContext()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      C             = new C();
      C.α           = α;
      C.β           = β;
      F             = new wtf();
      F.α           = α;
      F.β           = β;
      G             = new G();
      G.α           = α;
      G.β           = β;
      isInitialized = true;
    }
  }

  public void close()
  {
    const1.close();
    const2.close();
    ℝ1.close();
    r1.close();
    ℝ2.close();
    r2.close();
    ℝ3.close();
    ℝ4.close();
    ℝ5.close();
    r3.close();
  }
}
