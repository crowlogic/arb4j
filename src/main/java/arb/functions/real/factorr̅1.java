package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

/**
 * n is incorrectly identified as independent variable representing a polynomial
 * 
 */
public class factorr̅1 implements
                       Function<Integer, Real>
{
  Integer        c1 = new Integer("1");
  public Integer n;
  public Integer p;
  public Integer q;
  public Real    α;
  public Real    β;
  public Integer z1 = new Integer();

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    return α.get(in).risingFactorial(n.sub(c1, bits, z1), bits, result);
  }

  public void close()
  {
    c1.close();
    z1.close();
  }
}
