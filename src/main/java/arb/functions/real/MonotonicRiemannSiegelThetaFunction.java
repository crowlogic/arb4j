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

  /**
   * Thin reentrant wrapper around {@code diffMonotoneϑ}. The wrapper itself
   * holds no mutable state — every {@code evaluate} call delegates to the
   * enclosing {@link MonotonicRiemannSiegelThetaFunction}'s own
   * {@code diffMonotoneϑ}. {@link #cloneFunction()} returns a wrapper
   * bound to a freshly-cloned Φ, so that per-worker clones of dΦ do not
   * share the non-reentrant evaluation registers of
   * {@code diffMonotoneϑ} with each other.
   */
  public final class DPhi implements
                          RealFunction
  {
    @Override
    public Real evaluate(Real t, int order, int bits, Real res)
    {
      return diffMonotoneϑ.evaluate(t, order, bits, res);
    }

    @Override
    public arb.functions.Function<Real, Real> cloneFunction()
    {
      MonotonicRiemannSiegelThetaFunction fresh = new MonotonicRiemannSiegelThetaFunction(c.doubleValue());
      return fresh.new DPhi();
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
  }

  @Override
  public RealFunction derivative()
  {
    return new DPhi();
  }

  public MonotonicRiemannSiegelThetaFunction()
  {
  }

  /**
   * Construct a Φ with a specific slope constant {@code c} for the linear
   * shift Φ(t) = ϑ(t) + c·t. The default no-arg constructor uses c = 3,
   * which exceeds the threshold |ϑ′(0)| ≈ 2.6857 required for monotonicity
   * of Φ on [0, ∞). Pass any value ≥ 2.6857 with a margin of safety.
   *
   * @param cValue slope of the linear shift
   */
  public MonotonicRiemannSiegelThetaFunction(double cValue)
  {
    c.set(cValue);
  }

  /**
   * Prototype-pattern clone: returns a brand-new
   * {@link MonotonicRiemannSiegelThetaFunction} with the same slope constant
   * {@code c} as {@code this} and freshly-built internal pieces — a fresh
   * {@link RiemannSiegelThetaFunction} ϑ, a fresh
   * {@link arb.expressions.Context}, and freshly-compiled DSL
   * {@code monotoneϑ} and {@code diffmonotoneϑ}. None of those internal
   * pieces are shared with {@code this}, so the returned Φ may be evaluated
   * concurrently with {@code this} without contention on the
   * non-reentrant evaluation registers of the generated DSL classes.
   *
   * <p>The DSL parse and bytecode generation cost for {@code monotoneϑ} and
   * {@code diffmonotoneϑ} is paid once per clone, in the constructor of the
   * returned object.
   */
  @Override
  public arb.functions.Function<Real, Real> cloneFunction()
  {
    return new MonotonicRiemannSiegelThetaFunction(c.doubleValue());
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
   * Returns the global inverse map Φ⁻¹ : [Φ(0), ∞) → [0, ∞), overriding the
   * default {@link RealFunction#invert} so that the expression compiler’s
   * {@code Φ⁻¹(·)} syntax routes here rather than to local Lagrange series
   * reversion centered at one point. The {@code centerPoint},
   * {@code seriesOrder}, and {@code precision} parameters of the default
   * contract are ignored — the returned function is valid on the whole
   * domain [Φ(0), ∞), and the actual working precision is taken from the
   * {@code bits} argument passed to its {@code evaluate}.
   * <p>
   * Seed: the Lambert‐W asymptotic inversion of the Stirling form
   *
   * <pre>
   *   Φ(t) ≈ (t/2) (log(t/(2π)) + 2c − 1) − π/8
   * </pre>
   *
   * gives the closed-form seed t₀(u) = 2π v / W(v·e^A) with A = 2c − 1 and v =
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
   *
   * @param centerPoint ignored (kept for interface compatibility)
   * @param seriesOrder ignored (kept for interface compatibility)
   * @param precision   ignored — the precision used at evaluation time is the
   *                    {@code bits} argument of the returned function’s
   *                    {@code evaluate}, not this construction parameter
   */
  /**
   * Reentrant Newton inverter for Φ on [Φ(0), ∞). Each {@link InversePhi}
   * holds a reference to its enclosing {@link MonotonicRiemannSiegelThetaFunction}
   * Φ; {@link #cloneFunction()} returns an inverter bound to a freshly cloned
   * Φ so that two workers never share Φ's non-reentrant Taylor-jet scratch
   * buffers ({@link RiemannSiegelThetaFunction} ϑ's evaluation registers).
   */
  public final class InversePhi implements
                          RealFunction
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
            // Exact fixed point: step is exactly 0 means residual is exactly 0
            // means Φ(seed) = u to the working precision. This is the only
            // way the relative-accuracy test below can succeed when the true
            // root is 0 (e.g. u = 0 ⇒ t = 0): for a midpoint of 0 with any
            // non-zero radius, arb_rel_accuracy_bits returns -∞ (no relative
            // accuracy with respect to 0), so the loop would otherwise spin
            // until MAX_ITER and throw.
            if (step.isZero())
            {
              res.set(seed);
              return res;
            }
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
          A.set(c).mul(2, workingBits, A);
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

      @Override
      public arb.functions.Function<Real, Real> cloneFunction()
      {
        MonotonicRiemannSiegelThetaFunction fresh = new MonotonicRiemannSiegelThetaFunction(c.doubleValue());
        return fresh.new InversePhi();
      }
  }

  @Override
  public RealFunction invert(Real centerPoint, int seriesOrder, int precision)
  {
    return new InversePhi();
  }

}
