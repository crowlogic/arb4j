package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class GeneratedProductTest implements
                                  RealNullaryFunction
{
  Integer                 startIndex  = new Integer("1");
  Integer                 endIndex    = new Integer("3");
  public Integer          k;
  public Real             ℝ1          = new Real();
  Function<Integer, Real> factor;
  Real                    factorValue = new Real();

  public Real evaluate(Void in, int order, int bits, Real result)
  {
    ℝ1.multiplicativeIdentity();
    k.set(startIndex);

    do
    {
      ℝ1.mul(factor.evaluate(k, bits, factorValue), bits);
    }
    while (k.increment().compareTo(endIndex) <= 0);

    return result.set(ℝ1);
  }

  public void close()
  {
    startIndex.close();
    endIndex.close();
    ℝ1.close();
  }

  public static void main(String args[])
  {
    GeneratedProductTest prod = new GeneratedProductTest();
    prod.factor = (t, order, bits, res) ->
    {
      System.out.format("factor %s\n", t);
      return res.set(t);
    };
    Real result = prod.evaluate(null, 128, new Real());
    System.out.println("Result=" + result);
  }
}
