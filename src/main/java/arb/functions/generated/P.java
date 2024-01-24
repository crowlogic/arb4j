package arb.functions.generated;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class P implements
               Function<Integer, RealPolynomial>
{
  private boolean       isInitialized;
  Integer               const1;
  Integer               const2;
  Integer               const3;
  public Real           α;
  public Real           β;
  public Real           ℝ1;
  public Real           ℝ2;
  public RealPolynomial 𝕽1;
  public RealPolynomial 𝕽2;
  public RealPolynomial 𝕽3;
  public RealPolynomial 𝕽4;
  public Integer        ℤ1;
  public RealPolynomial 𝕽5;
  public RealPolynomial 𝕽6;
  public Real           ℝ3;
  public Real           ℝ4;
  public Integer        ℤ2;
  public RealPolynomial 𝕽7;
  public RealPolynomial 𝕽8;
  public RealPolynomial r9;
  public Real           ℝ5;
  public Real           ℝ6;
  public P              P;
  public final A        A = new A();
  public final B        B = new B();
  public final C        C = new C();
  public final E        E = new E();

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initializeVariableReferences();
    }

    if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      return switch (in.getSignedValue())
      {
      case 0 -> result.set(const2);
      case 1 -> C.evaluate(ℝ1.set(const2), order, bits, ℝ2)
                 .mul(result.identity(), bits, 𝕽1)
                 .sub(β, bits, 𝕽2)
                 .add(α, bits, 𝕽3)
                 .div(const3, bits, result);
      default ->
      {
        if (P == null)
        {
          P = new P(this);
        }

        yield A.evaluate(in, order, bits, 𝕽4)
               .mul(P.evaluate(in.sub(const2, bits, ℤ1), order, bits, 𝕽5), bits, 𝕽6)
               .sub(B.evaluate(ℝ3.set(in), order, bits, ℝ4)
                     .mul(P.evaluate(in.sub(const3, bits, ℤ2), order, bits, 𝕽7), bits, 𝕽8),
                    bits,
                    r9)
               .div(E.evaluate(ℝ5.set(in), order, bits, ℝ6), bits, result);
      }
      };
    }
  }

  public P()
  {
    const1 = new Integer("0");
    const2 = new Integer("1");
    const3 = new Integer("2");
    ℝ1     = new Real();
    ℝ2     = new Real();
    𝕽1    = new RealPolynomial();
    𝕽2    = new RealPolynomial();
    𝕽3    = new RealPolynomial();
    𝕽4    = new RealPolynomial();
    ℤ1     = new Integer();
    𝕽5    = new RealPolynomial();
    𝕽6    = new RealPolynomial();
    ℝ3     = new Real();
    ℝ4     = new Real();
    ℤ2     = new Integer();
    𝕽7    = new RealPolynomial();
    𝕽8    = new RealPolynomial();
    r9     = new RealPolynomial();
    ℝ5     = new Real();
    ℝ6     = new Real();
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
      A.α           = B.α = C.α = E.α = α;
      A.β           = B.β = C.β = E.β = β;
      isInitialized = true;
    }
  }

  public P(P var1)
  {
    this();
    if (var1.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (var1.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      α = var1.α;
      β = var1.β;
    }
  }

  public void close()
  {
    const1.close();
    const2.close();
    const3.close();
    ℝ1.close();
    ℝ2.close();
    𝕽1.close();
    𝕽2.close();
    𝕽3.close();
    𝕽4.close();
    ℤ1.close();
    𝕽5.close();
    𝕽6.close();
    ℝ3.close();
    ℝ4.close();
    ℤ2.close();
    𝕽7.close();
    𝕽8.close();
    r9.close();
    ℝ5.close();
    ℝ6.close();
    P.close();
  }
}
