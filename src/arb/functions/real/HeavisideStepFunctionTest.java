package arb.functions.real;

import static arb.util.Utils.*;

import org.junit.*;

import arb.*;

public class HeavisideStepFunctionTest
{

  @SuppressWarnings("resource")
  @Test
  public void test()
  {
    Real                  t    = new Real().set(2);
    HeavisideStepFunction h    = new HeavisideStepFunction();
    Real                  step = h.evaluate(t, 1, 128, new Real());
    println("step=" + step);
//    FourierTransform<HeavisideStepFunction> ft = new FourierTransform<HeavisideStepFunction>(h);

    // ft.left.assign("0.00000000001", 128 );
    //ft.integrationOptions.verbose = true;

   // println("z=" + z);
    // This should be equal to 1/(t*i) but its not
  }

}
