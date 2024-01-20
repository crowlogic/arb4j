package arb.functions;

import arb.Integer;
import arb.Real;

public class F implements
               Function<Integer, Real>
{
  public Integer const1 = new Integer("1");
  public Real    α;
  public Real    β;
  public Real    G;
  public Real    r1     = new Real();
  public Integer i1     = new Integer();
  public Real    r2     = new Real();
  public Real    r3     = new Real();
  public Real    r4     = new Real();
  public C       C;

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    if (this.C == null)
    {
      throw new AssertionError("C is null");
    }
    else
    {
      return ((Real) this.C.evaluate(this.r1.set(((Integer) in).sub(this.const1, bits, this.i1)),
                                     order,
                                     bits,
                                     this.r2)).mul((Real) this.C.evaluate(this.r3.set((Integer) in),
                                                                          order,
                                                                          bits,
                                                                          this.r4),
                                                   bits,
                                                   (Real) result);
    }
  }

  public F()
  {
    this.initializeContextualFunctions();
  }

  public void initializeContextualFunctions()
  {
    C var10001 = this.C = new C();
    this.C.initializeContextualFunctions();
    this.C = var10001;
  }

  public void close()
  {
    this.const1.close();
    this.r1.close();
    this.i1.close();
    this.r2.close();
    this.r3.close();
    this.r4.close();
  }
}
