package arb.operators;

import arb.Complex;
import arb.functions.complex.numbertheoretic.XFunction;
import junit.framework.TestCase;

public class ComplexCompositionTest extends
                                    TestCase
{
  public void testEval()
  {
    try ( XFunction xFunc = new XFunction();
          Complex t = new Complex();
          Complex result = xFunc.evaluate(t, 1, 256, new Complex());)
    {
      t.set(0.1, 0.1);
    }
  }

  public void testDerivative()
  {

  }
}
