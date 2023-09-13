package arb.operators.integraltransforms;

import arb.Complex;
import junit.framework.TestCase;

public class LaplaceTransformTest extends
                                  TestCase
{

  public void test()
  {
    var     laplaceTransform = new LaplaceTransform<>((z, o, p, r) ->
                             {
                               r.getReal().set(z);
                               return r;
                             });
    Complex ξ                = new Complex("0.5",
                                           "0",
                                           128);
    Complex x                = laplaceTransform.evaluate(ξ, 1, 128, new Complex());
    x.getReal().printPrecision = true;
    assertEquals(4, x.getReal().getMid().doubleValue(), 0);
  }

}
