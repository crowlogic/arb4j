package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class C implements
               RealFunction
{
  public Integer const1 = new Integer("2");
  public Real    α;
  public Real    β;
  public Real    G;
  public Real    r1     = new Real();
  public Real    r2     = new Real();

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
    else
    {
      return this.const1.mul(in, bits, this.r1).add(this.α, bits, this.r2).add(this.β, bits, result);
    }
  }

  public C()
  {
    this.initializeContextualFunctions();
  }

  public void initializeContextualFunctions()
  {
  }

  public void close()
  {
    this.const1.close();
    this.r1.close();
    this.r2.close();
  }
}
