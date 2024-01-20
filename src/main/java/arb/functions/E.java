package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class E implements
               RealFunction
{
  public Integer const1 = new Integer("2");
  public Integer const2 = new Integer("1");
  public Real    α;
  public Real    β;
  public Real    G;
  public Real    r1     = new Real();
  public Real    r2     = new Real();
  public Real    r3     = new Real();
  public Real    r4     = new Real();
  public Real    r5     = new Real();
  public C       C;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    if (this.C == null)
    {
      throw new AssertionError("C is null");
    }
    else
    {
      return ((Real) in).mul((Real) this.C.evaluate(((Real) in).div(this.const1, bits, this.r1),
                                                    order,
                                                    bits,
                                                    this.r2),
                             bits,
                             this.r3)
                        .mul((Real) this.C.evaluate(((Real) in).sub(this.const2, bits, this.r4),
                                                    order,
                                                    bits,
                                                    this.r5),
                             bits,
                             (Real) result);
    }
  }

  public E()
  {
    this.initializeContextualFunctions();
  }

  public void initializeContextualFunctions()
  {
    C var10001 = this.C = new C();
    this.C.initializeContext();
    this.C = var10001;
  }

  public void close()
  {
    this.const1.close();
    this.const2.close();
    this.r1.close();
    this.r2.close();
    this.r3.close();
    this.r4.close();
    this.r5.close();
  }
}
