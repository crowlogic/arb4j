package arb.functions.complex;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import arb.Complex;
import arb.Real;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

/**
 * Smoke test for {@link MuntzPadeCumulantGenerator}.
 *
 * <p>
 * Reproduces the rough-Heston CGF setup: assemble a {@link RiccatiMuntzPadeFunctional}
 * for tanh-shaped coefficients and pair it with the rough-Heston lattice weights
 *
 * <pre>
 *   u_k = θλ / (kμ + 1),
 *   w_k = V₀ · Γ((k+1)μ + 1) / Γ(kμ + 2),
 * </pre>
 *
 * then verify {@code Φ(0, T) = exp(0) ⇒} CGF at v=0 equals 0 since p(0)=q(0)=r(0)
 * makes all a_k(0) = 0.
 */
public class MuntzPadeCumulantGeneratorTest
{
  @Test
  public void roughHestonLatticeWeightsCompileAndEvaluate()
  {
    int bits = 128;
    try ( Real μ  = new Real("0.6", bits).setName("μ");
          Real T  = new Real("1.0", bits).setName("T");
          Real λ  = new Real("0.3", bits).setName("λ");
          Real θ  = new Real("0.02", bits).setName("θ");
          Real ν  = new Real("0.3", bits).setName("ν");
          Real V0 = new Real("0.02", bits).setName("V0");
          Real ρ  = new Real("-0.7", bits).setName("ρ"))
    {
      Context ctx = new Context(λ, θ, ν, V0, ρ, T, μ);

      try ( RiccatiMuntzPadeFunctional riccati = new RiccatiMuntzPadeFunctional(
              ctx, μ,
              "v->½⋅(-v²-ⅈ⋅v)",
              "v->λ⋅(ⅈ⋅v⋅ρ⋅ν-1)",
              "v->½⋅(λ⋅ν)²"))
      {
        // Application-supplied lattice weights (rough-Heston-specific).
        RealSequence u = RealSequence.express("u:k➔θ*λ/(k*μ+1)", ctx);
        RealSequence w = RealSequence.express("w:k➔V0*Γ((k+1)*μ+1)/Γ(k*μ+2)", ctx);

        try ( MuntzPadeCumulantGenerator cgf = new MuntzPadeCumulantGenerator(ctx, riccati.a, u, w, 5))
        {
          assertNotNull(cgf.Φ);

          // At v = 0, p(0) = 0, q(0)·0 = 0, r(0)·0 = 0 ⇒ a_k(0) = 0 ∀k ⇒ Φ(0,T) = 0.
          try ( Complex v0 = new Complex(); Complex res = new Complex())
          {
            v0.zero();
            cgf.evaluate(v0, 1, bits, res);
            assertEquals("Re(Φ(0, T)) must be 0", 0.0, res.re().doubleValue(), 1e-10);
            assertEquals("Im(Φ(0, T)) must be 0", 0.0, res.im().doubleValue(), 1e-10);
          }

          // setN should mutate the live truncation.
          cgf.setN(8);
          try ( Complex v = new Complex(); Complex res = new Complex())
          {
            v.re().set("0.5", bits);
            cgf.evaluate(v, 1, bits, res);
            // No assertion on exact value — just smoke-test that evaluation completes
            // at the new truncation order without throwing.
            assertNotNull(res);
          }
        }
      }
    }
  }
}
