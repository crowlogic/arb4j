package arb.functions.real;

import static java.lang.System.out;

import arb.Integer;
import arb.RealPolynomial;
import junit.framework.TestCase;

public class HypergeometricFunctionSequenceTest extends
                                                TestCase
{
  public static void test3F1()
  {
    try ( HypergeometricFunctionSequence F = new HypergeometricFunctionSequence(3,
                                                                          1))
    {
      F.α.set(1, 4, -4);
      F.β.set(0.5);

      try ( var index = new Integer())
      {
        for (int n = 0; n < 5; n++)
        {
          RealPolynomial fn = F.F.evaluate(index.set(n), 0, 128, new RealPolynomial());
          out.format("F(%d,x)=%s\n", n, fn);
        }
      }
    }
  }
}
