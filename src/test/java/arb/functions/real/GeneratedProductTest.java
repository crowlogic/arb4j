package arb.functions.real;

import arb.Integer;
import arb.Real;
import junit.framework.TestCase;

public class GeneratedProductTest extends
                                  TestCase implements
                                  RealNullaryFunction
{
  Integer             startIndex;
  Integer             endIndex;
  public Integer      k           = new Integer();
  public Real         ℝ1;
  public final factor factor      = new factor();
  public Real         factorValue = new Real();

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

  public GeneratedProductTest()
  {
    startIndex = new Integer("1");
    endIndex   = new Integer("3");
    ℝ1         = new Real();
  }

  public void close()
  {
    startIndex.close();
    endIndex.close();
    ℝ1.close();
  }

  public static void testProd()
  {
    try ( GeneratedProductTest prod = new GeneratedProductTest())
    {
      Real result = prod.evaluate(null, 128, new Real());
      System.out.println("Result=" + result);
      assertEquals( 6.0, result.doubleValue() );
      assertTrue( result.isExact() );
    }
  }
}
