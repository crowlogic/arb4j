package arb.operators;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import arb.Complex;
import arb.Real;

public class LaplaceTransformTest
{

  @Test
  public void test()
  {
    LaplaceTransform laplaceTransform = new LaplaceTransform((z, o, p, r) ->
                                      {
                                        r.getReal().set(z);
                                        return r;
                                      });
    Complex          evaluate         = laplaceTransform.evaluate(new Real("0.5",
                                                                           128),
                                                                  1,
                                                                  128,
                                                                  new Complex());
    evaluate.getReal().printPrecision = true;
    assertEquals(4, evaluate.getReal().getMid().doubleValue(), 0);
  }

}
