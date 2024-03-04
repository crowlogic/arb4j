package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class A implements
               Function<Integer, RealPolynomial>
{
  private boolean       isInitialized;
  Integer               c1;
  Integer               c2;
  public Real           α;
  public Real           β;
  public Real           ℝ1;
  public RealPolynomial r̅1;
  public Real           ℝ2;
  public RealPolynomial r̅2;
  public Real           ℝ3;
  public Real           ℝ4;
  public Real           ℝ5;
  public RealPolynomial r̅3;
  public final C        C = new C();
  public final F        F = new F();
  public final G        G = new G();

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return (F.evaluate(in, order, bits, ℝ1)).mul(result.identity(), bits, r̅1)
                                            .add(G.evaluate(null, order, bits, ℝ2), bits, r̅2)
                                            .mul((C.evaluate(ℝ3.set(in), order, bits, ℝ4)).sub(c1, bits, ℝ5),
                                                 bits,
                                                 r̅3)
                                            .div(c2, bits, result);
  }

  public A()
  {
    c1  = new Integer("1");
    c2  = new Integer("2");
    ℝ1  = new Real();
    r̅1 = new RealPolynomial();
    ℝ2  = new Real();
    r̅2 = new RealPolynomial();
    ℝ3  = new Real();
    ℝ4  = new Real();
    ℝ5  = new Real();
    r̅3 = new RealPolynomial();
  }

  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
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
    c1.close();
    c2.close();
    ℝ1.close();
    r̅1.close();
    ℝ2.close();
    r̅2.close();
    ℝ3.close();
    ℝ4.close();
    ℝ5.close();
    r̅3.close();
  }
}
