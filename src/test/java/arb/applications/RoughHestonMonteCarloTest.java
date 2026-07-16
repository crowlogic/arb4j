package arb.applications;

import arb.Real;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

public class RoughHestonMonteCarloTest extends TestCase
{
  public void testFullTruncationExpressionCompilation()
  {
    final int bits = 64;
    final int numSteps = 50;

    try ( Context ctx = new Context();
          Real s = new Real("1",       bits, "s");
          Real r = new Real("0",       bits, "r");
          Real q = new Real("0",       bits, "q");
          Real T = new Real("1",       bits, "T");
          Real κ = new Real("0.3",     bits, "κ");
          Real θ = new Real("0.02",    bits, "θ");
          Real σ = new Real("0.3",     bits, "σ");
          Real v = new Real("0.02",    bits, "v");
          Real ρ = new Real("-0.7",    bits, "ρ");
          Real K = new Real("1.0",     bits, "K");
          Real h = new Real("0.02",    bits, "h");
          Real d = new Real("0",       bits, "d");
          Real N = Real.valueOf(numSteps);
          Real W = Real.newVector(numSteps);
          Real Z = Real.newVector(numSteps); )
    {
      N.setName("N");
      W.setName("W");
      Z.setName("Z");

      ctx.registerVariables(s, r, q, T, κ, θ, σ, v, ρ, K, h, d, N);
      ctx.registerVariable(W);
      ctx.registerVariable(Z);

      ctx.declare("V", Integer.class, Real.class, RealSequence.class);

      RealSequence.express("V",
        "V:n➔when(n=0, v, else, "
      + "max(V(n-1)+0, 0) + κ*(θ - max(V(n-1)+0, 0))*h + σ*√(max(V(n-1)+0, 0))*(ρ*W[n-1] + √(1-ρ²)*Z[n-1]))",
        ctx);

      RealNullaryFunction.express(
        "max(s*exp(d*T + Σ_{n=0}^{N-1}( -max(V(n)+0, 0)/2*h + √(max(V(n)+0, 0))*W[n] )) - K, 0)",
        ctx);
      RealNullaryFunction.express(
        "max(K - s*exp(d*T + Σ_{n=0}^{N-1}( -max(V(n)+0, 0)/2*h + √(max(V(n)+0, 0))*W[n] )), 0)",
        ctx);

      assertTrue(true);
    }
  }
}
