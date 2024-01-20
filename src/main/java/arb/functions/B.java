package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class B implements
               RealFunction
{
  public Integer              const1 = new Integer("1");
  public Real                 α;
  public Real                 β;
  public Real                 G;
  public Real                 r1     = new Real();
  public Real                 r2     = new Real();
  public Real                 r3     = new Real();
  public Real                 r4     = new Real();
  public Real                 r5     = new Real();
  public Real                 r6     = new Real();
  public Function<Real, Real> C;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else if (this.C == null)
    {
      throw new AssertionError("C is null");
    }
    else
    {
      return in.add(this.α, bits, this.r1)
               .sub(this.const1, bits, this.r2)
               .mul(in.add(this.β, bits, this.r3).sub(this.const1, bits, this.r4), bits, this.r5)
               .mul((Real) this.C.evaluate(in, order, bits, this.r6), bits, result);
    }
  }

  public B()
  {
    this.initializeContext();
  }

  public void initializeContext()
  {
    this.C = new C();
  }

  public void close()
  {
    this.const1.close();
    this.r1.close();
    this.r2.close();
    this.r3.close();
    this.r4.close();
    this.r5.close();
    this.r6.close();
  }
}
