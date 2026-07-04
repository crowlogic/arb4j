package arb.expressions.nodes;

import arb.Real;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

public class ErrorFunctionDerivativeTest extends
                                         TestCase
{
  static final int bits = 128;

  private static void assertBallEquals(RealFunction lhs, RealFunction rhs, String at)
  {
    try ( Real x = new Real(at,
                            bits);
          Real a = new Real(); Real b = new Real())
    {
      lhs.evaluate(x, 1, bits, a);
      rhs.evaluate(x, 1, bits, b);
      assertTrue(lhs + "(" + at + ")=" + a + " must overlap " + rhs + "(" + at + ")=" + b, a.overlaps(b));
    }
  }

  public void testErfDerivative()
  {
    try ( RealFunction d = RealFunction.express("diff(erf(x),x)");
          RealFunction reference = RealFunction.express("2*exp(-x²)/sqrt(π)"))
    {
      assertBallEquals(d, reference, "7/10");
    }
  }

  public void testErfcDerivative()
  {
    try ( RealFunction d = RealFunction.express("diff(erfc(x),x)");
          RealFunction reference = RealFunction.express("-2*exp(-x²)/sqrt(π)"))
    {
      assertBallEquals(d, reference, "-3/2");
    }
  }

  public void testErfiDerivative()
  {
    try ( RealFunction d = RealFunction.express("diff(erfi(x),x)");
          RealFunction reference = RealFunction.express("2*exp(x²)/sqrt(π)"))
    {
      assertBallEquals(d, reference, "1/3");
    }
  }

  public void testErfcChainRule()
  {
    try ( RealFunction d = RealFunction.express("diff(erfc(3*x+1),x)");
          RealFunction reference = RealFunction.express("-6*exp(-(3*x+1)²)/sqrt(π)"))
    {
      assertBallEquals(d, reference, "2/5");
    }
  }

  public void testErfcSecondSymbolicOrder()
  {
    try ( RealFunction d = RealFunction.express("diff(erfc(x),x^(2))");
          RealFunction reference = RealFunction.express("4*x*exp(-x²)/sqrt(π)"))
    {
      assertBallEquals(d, reference, "9/8");
    }
  }

  public void testErfAtZeroDerivativeIsTwoOverSqrtPi()
  {
    try ( RealFunction d = RealFunction.express("diff(erf(x),x)");
          RealNullaryFunction reference = RealNullaryFunction.express("2/sqrt(π)");
          Real x = new Real(); Real lhs = new Real(); Real rhs = new Real())
    {
      d.evaluate(x.zero(), 1, bits, lhs);
      reference.evaluate(bits, rhs);
      assertTrue(lhs + " must overlap " + rhs, lhs.overlaps(rhs));
    }
  }
}
