package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class factorr̅1 implements
                       Function<Integer, RealPolynomial>
{
  Integer               c1  = new Integer("1");
  public Integer        n;
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public RealPolynomial r̅1 = new RealPolynomial();

  public static void main( String args[] )
  {
    try ( factorr̅1 factor = new factorr̅1())
    {
      factor.α = Real.newVector(4).set(1.0, 2.0, 3.0, 4.0);
      Integer        in       = new Integer(1);
      RealPolynomial evaluate = factor.evaluate(in, 128, new RealPolynomial());
      System.out.format("factor(%s)=%s\n", in, evaluate);
    } 
  }
  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    return α.get(in).risingFactorial(result.identity().sub(c1, bits, r̅1), bits, result);
  }

  public void close()
  {
    c1.close();
    r̅1.close();
  }
}
