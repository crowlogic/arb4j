package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class HeavisideProductDerivativeTest extends
                                            TestCase
{
  static final int bits = 128;

  private static void assertBallEquals(RealFunction lhs, RealFunction rhs, Context ctx, String at)
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

  // d/dw[θ(w−a)·f(w)] = δ(w−a)·f(w) + θ(w−a)·f′(w): the sifting rewrite
  // δ(w−a)·f(w) → δ(w−a)·f(a) applies to the δ term only — the θ term keeps
  // f evaluated at w, never frozen at a.
  public void testHeavisideProductDerivativeKeepsSiblingUnsifted()
  {
    Context ctx = new Context();
    try ( Real a = new Real("7/5",
                            bits).setName("a"))
    {
      ctx.registerVariable(a);
      try ( RealFunction f = RealFunction.express("f:w➔exp(w²/4)", ctx);
            RealFunction derivative = RealFunction.express("dF:w➔diff(θ(w-a)*f(w),w)", ctx);
            RealFunction reference = RealFunction.express("ref:w➔δ(w-a)*f(a)+θ(w-a)*exp(w²/4)*w/2", ctx))
      {
        assertBallEquals(derivative, reference, ctx, "12/5");
        assertBallEquals(derivative, reference, ctx, "1/2");
      }
    }
  }

  // The compiled derivative of the Schwinger–Gauss–erfc function E agrees
  // with its hand-derived form everywhere off the θ jump: E′ = e^{g}g′erfc(z)/2
  // + e^{g}·(−2e^{−z²}/√π)·z′/2 − δ(w−c)e^{g(c)} − θ(w−c)g′e^{g}.
  public void testSchwingerGaussErfcDerivative()
  {
    Context ctx = new Context();
    try ( Real σsq = new Real("3/5",
                              bits).setName("σsq");
          Real ξ = new Real("3/10",
                            bits).setName("ξ");
          Real cLine = new Real("7/5",
                                bits).setName("cLine"))
    {
      ctx.registerVariable(σsq);
      ctx.registerVariable(ξ);
      ctx.registerVariable(cLine);
      try ( RealFunction g = RealFunction.express("g:w➔σsq*w²/2-w*ξ", ctx);
            RealFunction z = RealFunction.express("z:w➔(ξ-σsq*w)/sqrt(2*σsq)", ctx);
            RealFunction E = RealFunction.express("E:w➔exp(g(w))*erfc(z(w))/2-θ(w-cLine)*exp(g(w))", ctx);
            RealFunction derivative = RealFunction.express("dE:w➔diff(E(w),w)", ctx);
            RealFunction reference = RealFunction.express("ref:w➔exp(g(w))*(σsq*w-ξ)*erfc(z(w))/2"
                                                          + "+exp(g(w))*(-(2*exp(-z(w)²))/sqrt(π))*(-σsq/sqrt(2*σsq))/2"
                                                          + "-δ(w-cLine)*exp(g(cLine))"
                                                          + "-θ(w-cLine)*(σsq*w-ξ)*exp(g(w))",
                                                          ctx))
      {
        assertBallEquals(derivative, reference, ctx, "12/5");
        assertBallEquals(derivative, reference, ctx, "3/4");
      }
    }
  }
}
