package arb.functions.generated;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class A implements
               Function<Integer, RealPolynomial>
{
  private boolean       isInitialized;
  Integer               const1;
  Integer               const2;
  Integer               const3;
  public Real           α;
  public Real           β;
  public Real           ℝ1;
  public RealPolynomial 𝕽1;
  public Real           ℝ2;
  public RealPolynomial 𝕽2;
  public Real           ℝ3;
  public Real           ℝ4;
  public Real           ℝ5;
  public RealPolynomial 𝕽3;
  public final C        C = new C();
  public final F        F = new F();
  public final G        G = new G();

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initializeVariableReferences();
    }

    return F.evaluate(in, order, bits, ℝ1)
            .mul(result.identity(), bits, 𝕽1)
            .add(G.evaluate(null, order, bits, ℝ2), bits, 𝕽2)
            .mul(C.evaluate(ℝ3.set(in), order, bits, ℝ4).sub(const2, bits, ℝ5), bits, 𝕽3)
            .div(const3, bits, result);
  }

  public A()
  {
    const1 = new Integer("0");
    const2 = new Integer("1");
    const3 = new Integer("2");
    ℝ1     = new Real();
    𝕽1    = new RealPolynomial();
    ℝ2     = new Real();
    𝕽2    = new RealPolynomial();
    ℝ3     = new Real();
    ℝ4     = new Real();
    ℝ5     = new Real();
    𝕽3    = new RealPolynomial();
  }

  public void initializeVariableReferences()
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
      C.α           = α;
      C.β           = β;
      F.α           = α;
      F.β           = β;
      G.α           = α;
      G.β           = β;
      isInitialized = true;
    }
  }

  public void close()
  {
    const1.close();
    const2.close();
    const3.close();
    ℝ1.close();
    𝕽1.close();
    ℝ2.close();
    𝕽2.close();
    ℝ3.close();
    ℝ4.close();
    ℝ5.close();
    𝕽3.close();
  }
}
