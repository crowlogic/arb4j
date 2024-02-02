package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

/**
 * FIXME: make this a prototype then isolate the product part of it then run
 * asmifier on it then work back from there
 * 
 */
public class F implements
               Function<Integer, RealPolynomial>
{
  private boolean       isInitialized;
  Integer               c1  = new Integer("0");
  Integer               c2  = new Integer("1");
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public Integer        ℤ1  = new Integer();
  public RealPolynomial r̅1 = new RealPolynomial();
  public RealPolynomial r̅2 = new RealPolynomial();
  public Integer        ℤ2  = new Integer();
  public Real           ℝ2  = new Real();
  public Integer        ℤ3  = new Integer();
  public Real           ℝ3  = new Real();
  public Real           ℝ1  = new Real();
  public F              prevF;
  public Integer        k   = new Integer();

  public static void main(String args[])
  {
    F f = new F(2,
                1);
    f.α.set(3, -3);
    f.β.set(0.5);
    for (int i = 0; i < 20; i++)
    {
      RealPolynomial fk = f.evaluate(new Integer(i), 128, new RealPolynomial());
      System.out.format("f[%d]=%s\n", i, fk);
    }

  }

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }
    return switch (in.getSignedValue())
    {
    case 0 -> result.set(c2);
    default ->
    {
      if (prevF == null)
      {
        prevF = new arb.functions.real.F(this);
      }

      yield result.identity()
                  .mul(prevF.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅1), bits, r̅2)
                  .div(α.get(k)
                        .risingFactorial(in.sub(c2, bits, ℤ2), bits, ℝ2)
                        .div(β.get(k).risingFactorial(in.sub(c2, bits, ℤ3), bits, ℝ3), bits, ℝ1),
                       bits,
                       result);
    }
    };
  }

  public F(int p, int q)
  {
    this.p = new Integer(p);
    this.q = new Integer(q);
    this.α = Real.newVector(p);
    this.β = Real.newVector(q);
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
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (q == null)
    {
      throw new AssertionError("q is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  public F(F f)
  {
    this(f.p.getSignedValue(),
         f.q.getSignedValue());
    if (f.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (f.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      p = f.p;
      α = f.α;
      q = f.q;
      β = f.β;
    }
  }

  public void close()
  {
    c1.close();
    c2.close();
    ℤ1.close();
    r̅1.close();
    r̅2.close();
    ℤ2.close();
    ℝ2.close();
    ℤ3.close();
    ℝ3.close();
    ℝ1.close();
    prevF.close();
  }

}
