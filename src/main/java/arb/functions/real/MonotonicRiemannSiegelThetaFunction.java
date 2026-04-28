package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.exceptions.ArbException;

/**
 * Strictly increasing modification of the Riemann–Siegel theta function on
 * [0, ∞) defined by additive linear shift
 *
 * <pre>
 *   Φ(t) := ϑ(t) + c·t
 * </pre>
 *
 * where
 *
 * <pre>
 *   ϑ(t) := im(lnΓ(¼ + ⅈ·t/2)) − (t·log(π)/2)
 * </pre>
 *
 * is the {@link RiemannSiegelThetaFunction}. The derivative is
 *
 * <pre>
 *   ϑ′(t) = ½·Re(ψ(¼ + ⅈ·t/2)) − ½·log(π),
 * </pre>
 *
 * which is strictly increasing on [0, ∞) (since ϑ is convex there) and attains
 * its infimum at t = 0:
 *
 * <pre>
 *   ϑ′(0) = ½·Re(ψ(¼)) − ½·log(π)
 *         = −½·(γ + π/2 + 3·log(2) + log(π))
 *         ≈ −2.6857...
 * </pre>
 *
 * (using the closed form ψ(¼) = −γ − π/2 − 3·log(2)). Therefore Φ′(t) ≥ 0 on
 * [0, ∞) iff c ≥ −ϑ′(0) ≈ 2.6857..., and Φ is strictly increasing iff c is
 * strictly greater than that threshold. The default value c = 3 satisfies this
 * with a comfortable margin.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MonotonicRiemannSiegelThetaFunction implements
                                                 RealFunction
{
  Real           c       = Real.named("c").set(3.0);

  public Context context = new Context(c);

  /**
   * The slope constant c in Φ(t) = ϑ(t) + c·t.
   */
  public Real c()
  {
    return c;
  }

  @Override
  public String toString()
  {
    return monotoneϑ.toString();
  }

  RiemannSiegelThetaFunction ϑ             = new RiemannSiegelThetaFunction();

  RealFunction               monotoneϑ     = RealFunction.express("monotoneϑ:t->ϑ(t)+c*t", context);

  RealFunction               diffMonotoneϑ = RealFunction.express("diffmonotoneϑ:t->diff(ϑ(t),t)+c", context);

  @Override
  public RealFunction derivative()
  {
    return diffMonotoneϑ;
  }

  public MonotonicRiemannSiegelThetaFunction()
  {
  }

  /**
   * Evaluates the Taylor jet of Φ(t+x) = ϑ(t+x) + c·(t+x) in x to the requested
   * order. Coefficient 0 is Φ(t) = ϑ(t)+c·t; coefficient 1 is Φ′(t) = ϑ′(t)+c;
   * higher coefficients are inherited unchanged from ϑ, since c·(t+x) is linear
   * in x.
   */
  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    ϑ.evaluate(t, order, bits, res);
    if (order >= 1)
    {
      try ( Real ct = Real.valueOf(0.0))
      {
        c.mul(t, bits, ct);
        res.get(0).add(ct, bits, res.get(0));
      }
      if (order >= 2)
      {
        res.get(1).add(c, bits, res.get(1));
      }
    }
    return res;
  }

  /**
   * Returns the inverse map Φ⁻¹ : [Φ(0), ∞) → [0, ∞). Implementation seeds with
   * the Lambert‐W asymptotic inversion of the Stirling form
   *
   * <pre>
   *   Φ(t) ≈ (t/2) (log(t/(2π)) + 2c − 1) − π/8
   * </pre>
   *
   * giving the closed-form seed t₀(u) = 2π v / W(v·e^A) with A = 2c − 1 and v =
   * u/π + 1/8 (valid where the asymptotic expansion of ϑ is good, i.e.
   * t ≳ 2π). For u below Φ(2π) the seed t₀ = u/c is used (where ct dominates
   * ϑ(t)). The seed is then refined by Newton iteration on
   *
   * <pre>
   *   t ← t − (Φ(t) − u) / Φ′(t)
   * </pre>
   *
   * which converges quadratically since Φ is C∞ and Φ′ ≥ c − |ϑ′(0)| > 0 on
   * [0, ∞). Iteration terminates when the iterate carries at least the
   * requested {@code bits} of relative accuracy, or throws after a safety cap
   * of 64 iterations.
   */
  public RealFunction inverse()
  {
    return new RealFunction()
    {
      static final int MAX_ITER = 64;

      @Override
      public Real evaluate(Real u, int order, int bits, Real res)
      {
        assert order == 1 : "Φ⁻¹ jet not implemented; only order=1 supported.";

        // Evaluate Φ at a higher working precision than the requested bits.
        // Φ = ϑ + c·t involves several arblib operations whose accumulated
        // round‐off contaminates the residual radius; doubling the precision
        // and adding a constant guard pushes that floor well below the
        // requested termination threshold.
        int workingBits = 2 * bits + 32;
        // Termination at (bits − 4) of relative accuracy: the standard 4‐bit
        // guard for forward error in interval Newton.
        int targetBits  = bits - 4;

        try ( Real seed         = Real.valueOf(0.0);
              Real jet          = Real.newVector(2);
              Real residual     = Real.valueOf(0.0);
              Real step         = Real.valueOf(0.0);
              Real twoPi        = Real.valueOf(0.0);
              Real Φ2π         = Real.valueOf(0.0);
              Real π            = Real.valueOf(0.0))
        {
          arb.arblib.arb_const_pi(π, workingBits);
          twoPi.set(π).mul(2, workingBits, twoPi);

          MonotonicRiemannSiegelThetaFunction.this.evaluate(twoPi, 2, workingBits, jet);
          Φ2π.set(jet.get(0));

          if (u.compareTo(Φ2π) <= 0)
          {
            u.div(c, workingBits, seed);
          }
          else
          {
            seedFromLambertW(u, workingBits, π, seed);
          }

          for (int i = 0; i < MAX_ITER; i++)
          {
            MonotonicRiemannSiegelThetaFunction.this.evaluate(seed, 2, workingBits, jet);
            jet.get(0).sub(u, workingBits, residual);
            // step = residual / Φ′
            residual.div(jet.get(1), workingBits, step);
            seed.sub(step, workingBits, seed);
            // Newton converges on the midpoint; collapse the iterate's radius
            // so it does not balloon iteration after iteration. The convergence
            // test below uses the freshly‐computed |step|, which is the
            // forward‐error estimate (Φ⁻¹)′ · residual on the iterate.
            seed.getRad().zero();
            // Convergence: the next Newton correction would change seed by
            // less than 2^(-bits) of |seed|. Equivalently, place |step| as
            // the error radius around the current midpoint and ask whether
            // it carries at least {@code bits} of relative accuracy.
            try ( Real seedWithError = Real.valueOf(0.0))
            {
              seedWithError.set(seed);
              step.absUpperBound(seedWithError.getRad());
              if (seedWithError.relAccuracyBits() >= targetBits)
              {
                res.set(seed);
                return res;
              }
            }
          }
          throw new ArbException("Φ⁻¹ Newton iteration failed to converge in "
                                 + MAX_ITER
                                 + " steps for u = "
                                 + u);
        }
      }

      /**
       * Seed t₀ = 2π v / W(v e^A) with A = 2c − 1, v = u/π + 1/8.
       */
      private void seedFromLambertW(Real u, int workingBits, Real π, Real out)
      {
        try ( Real A     = Real.valueOf(0.0);
              Real v     = Real.valueOf(0.0);
              Real expA  = Real.valueOf(0.0);
              Real arg   = Real.valueOf(0.0);
              Real W     = Real.valueOf(0.0);
              Real twoPi = Real.valueOf(0.0))
        {
          // A = 2c - 1
          c.mul(2, workingBits, A);
          A.sub(1, workingBits, A);

          // v = u/π + 1/8
          u.div(π, workingBits, v);
          try ( Real oneEighth = Real.valueOf(0.125))
          {
            v.add(oneEighth, workingBits, v);
          }

          // arg = v * exp(A)
          A.exp(workingBits, expA);
          v.mul(expA, workingBits, arg);

          // W = LambertW_0(arg)
          arg.W0(workingBits, W);

          // out = 2π * v / W
          twoPi.set(π).mul(2, workingBits, twoPi);
          twoPi.mul(v, workingBits, out);
          out.div(W, workingBits, out);
        }
      }

      @Override
      public Class<Real> domainType()
      {
        return Real.class;
      }

      @Override
      public Class<Real> coDomainType()
      {
        return Real.class;
      }
    };
  }

}
