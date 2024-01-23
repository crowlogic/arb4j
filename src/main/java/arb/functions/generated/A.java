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
    if (!this.isInitialized)
    {
      this.initializeVariableReferences();
    }

    return ((Real) this.F.evaluate(in, order, bits, this.ℝ1)).mul(result.identity(), bits, this.𝕽1)
                                                             .add((Real) this.G.evaluate(null, order, bits, this.ℝ2),
                                                                  bits,
                                                                  this.𝕽2)
                                                             .mul(((Real) this.C.evaluate(this.ℝ3.set(in),
                                                                                          order,
                                                                                          bits,
                                                                                          this.ℝ4)).sub(this.const2,
                                                                                                        bits,
                                                                                                        this.ℝ5),
                                                                  bits,
                                                                  this.𝕽3)
                                                             .div(this.const3, bits, result);
  }

  public A()
  {
    this.const1 = new Integer("0");
    this.const2 = new Integer("1");
    this.const3 = new Integer("2");
    this.ℝ1     = new Real();
    this.𝕽1    = new RealPolynomial();
    this.ℝ2     = new Real();
    this.𝕽2    = new RealPolynomial();
    this.ℝ3     = new Real();
    this.ℝ4     = new Real();
    this.ℝ5     = new Real();
    this.𝕽3    = new RealPolynomial();
  }

  public void initializeVariableReferences()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.F.α           = this.α;
      this.F.β           = this.β;
      this.G.α           = this.α;
      this.G.β           = this.β;
      this.isInitialized = true;
    }
  }

  public void close()
  {
    this.const1.close();
    this.const2.close();
    this.const3.close();
    this.ℝ1.close();
    this.𝕽1.close();
    this.ℝ2.close();
    this.𝕽2.close();
    this.ℝ3.close();
    this.ℝ4.close();
    this.ℝ5.close();
    this.𝕽3.close();
  }
}
