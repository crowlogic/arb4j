package arb.stochastic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Jacobian;
import arb.functions.real.RealFunction;

/**
 * Maximum-likelihood estimation of the {@link NegativeBinomialDistribution}
 * parameters (r,p) from a sample y₁,…,y_N by the Levenberg–Marquardt
 * algorithm, in arbitrary-precision {@link Real}/{@link RealMatrix}
 * arithmetic throughout, following Crowley, <i>Maximum Likelihood Estimation
 * of the Negative Binomial Distribution</i>, vixra 1211.0113 (2012).
 *
 * <p>
 * The log-likelihood of the sample is ℓ(r,p|y₁…N) = Σᵢ ℓ(r,p|yᵢ) with the
 * per-observation ℓ compiled once from expression-language source by
 * {@link NegativeBinomialDistribution}. The score — the residual vector the
 * algorithm drives to zero — is the symbolic Jacobian of ℓ with respect to
 * the variable-name sequence {"r","p"}, obtained from
 * {@link RealFunction#jacobian(String[])}:
 *
 * <pre>
 * S(r,p) = Σᵢ [ ∂ℓ/∂r , ∂ℓ/∂p ](yᵢ)
 *        = [ Σᵢ ψ(r+yᵢ) - N·ψ(r) + N·ln(p) ,  N·r/p - Σᵢ yᵢ/(1-p) ]
 * </pre>
 *
 * and the Jacobian of the score — the Hessian of ℓ — is the second symbolic
 * pass: each score component is itself a compiled expression, so its own
 * {@code jacobian({"r","p"})} yields
 *
 * <pre>
 * H = Σᵢ ⎡ ψ′(r+yᵢ)-ψ′(r)      1/p            ⎤
 *        ⎣ 1/p                 -r/p² - yᵢ/(1-p)² ⎦
 * </pre>
 *
 * The damped step solves (-H + μ·diag(-H))·δ = S via
 * {@link RealMatrix#solve} — a Levenberg–Marquardt-damped Newton ascent of
 * the concave log-likelihood; μ rises threefold on a rejected step and falls
 * on an accepted one, and acceptance is a strict increase of Σᵢ ℓ(yᵢ).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NegativeBinomialMaximumLikelihoodEstimation implements
                                                         AutoCloseable
{

  private static final Logger    log       = LoggerFactory.getLogger(NegativeBinomialMaximumLikelihoodEstimation.class);

  public static final String[]   VARIABLES =
  { "r", "p" };

  /**
   * Estimation outcome: the estimates, the log-likelihood L = Σᵢ ℓ(yᵢ) at the estimates, the iteration
   * count, and the convergence flag.
   */
  public static final class Result implements
                                   AutoCloseable
  {
    public final Real    r, p;
    public final Real    objective;
    public final int     iterations;
    public final boolean converged;

    Result(Real r, Real p, Real objective, int iterations, boolean converged)
    {
      this.r          = r;
      this.p          = p;
      this.objective  = objective;
      this.iterations = iterations;
      this.converged  = converged;
    }

    @Override
    public String toString()
    {
      return String.format("Result[r=%s, p=%s, L=%s, iterations=%d, converged=%b]",
                           r,
                           p,
                           objective,
                           iterations,
                           converged);
    }

    @Override
    public void close()
    {
      r.close();
      p.close();
      objective.close();
    }
  }

  final NegativeBinomialDistribution                     distribution;
  final Real                                             samples;
  final int                                              sampleCount;
  final int                                              bits;

  /**
   * The score [∂ℓ/∂r, ∂ℓ/∂p]: the symbolic Jacobian of the compiled
   * log-density over the variable-name sequence {@link #VARIABLES}.
   */
  public final Jacobian<Real, Real, RealFunction>        score;

  /**
   * Row i of the Hessian of ℓ: the symbolic Jacobian of score component i over
   * {@link #VARIABLES} — the second symbolic-differentiation pass.
   */
  public final Jacobian<Real, Real, RealFunction>[]      hessianRows;

  public int                                             maxIterations = 200;
  public int                                             maxDamping    = 40;

  /**
   * @param distribution the distribution whose parameter handles r,p are the
   *                     working variables of the iteration
   * @param samples      sample vector y₁,…,y_N (dimension {@code sampleCount})
   * @param sampleCount  N
   * @param bits         working precision
   */
  @SuppressWarnings("unchecked")
  public NegativeBinomialMaximumLikelihoodEstimation(NegativeBinomialDistribution distribution,
                                                     Real samples,
                                                     int sampleCount,
                                                     int bits)
  {
    this.distribution = distribution;
    this.samples      = samples;
    this.sampleCount  = sampleCount;
    this.bits         = bits;
    this.score        = distribution.logDensity.jacobian(VARIABLES);
    this.hessianRows  = new Jacobian[VARIABLES.length];
    for (int i = 0; i < VARIABLES.length; i++)
    {
      hessianRows[i] = score.partials[i].jacobian(VARIABLES);
    }
    log.info("score: ∂ℓ/∂r = {}", score.partials[0]);
    log.info("score: ∂ℓ/∂p = {}", score.partials[1]);
    for (int i = 0; i < VARIABLES.length; i++)
    {
      for (int j = 0; j < VARIABLES.length; j++)
      {
        log.info("Hessian: ∂²ℓ/∂{}∂{} = {}", VARIABLES[i], VARIABLES[j], hessianRows[i].partials[j]);
      }
    }
  }

  /**
   * Accumulate the log-likelihood L = Σᵢ ℓ(yᵢ), the score S = Σᵢ ∇ℓ(yᵢ), and
   * the Hessian H = Σᵢ ∇²ℓ(yᵢ) at the current parameter handles in a single
   * pass over the sample.
   */
  void accumulate(Real L, RealMatrix S, RealMatrix H)
  {
    int n = VARIABLES.length;
    L.zero();
    for (int i = 0; i < n; i++)
    {
      S.get(i, 0).zero();
      for (int j = 0; j < n; j++)
      {
        H.get(i, j).zero();
      }
    }
    try ( Real value = new Real())
    {
      for (int k = 0; k < sampleCount; k++)
      {
        Real y = samples.get(k);
        L.add(distribution.logDensity.evaluate(y, 1, bits, value), bits, L);
        for (int i = 0; i < n; i++)
        {
          S.get(i, 0).add(score.partials[i].evaluate(y, 1, bits, value), bits, S.get(i, 0));
          for (int j = 0; j < n; j++)
          {
            H.get(i, j).add(hessianRows[i].partials[j].evaluate(y, 1, bits, value), bits, H.get(i, j));
          }
        }
      }
    }
  }

  /**
   * The log-likelihood L = Σᵢ ℓ(yᵢ) alone, at the current parameter handles —
   * the candidate-acceptance criterion, evaluated without touching the score
   * and Hessian of the incumbent point.
   */
  void logLikelihood(Real L)
  {
    L.zero();
    try ( Real value = new Real())
    {
      for (int k = 0; k < sampleCount; k++)
      {
        L.add(distribution.logDensity.evaluate(samples.get(k), 1, bits, value), bits, L);
      }
    }
  }

  boolean admissible(RealMatrix x)
  {
    try ( Real one = new Real())
    {
      one.one();
      return x.get(0, 0).sign() > 0 && x.get(1, 0).sign() > 0 && x.get(1, 0).compareTo(one) < 0;
    }
  }

  static void maxAbs(RealMatrix v, Real result)
  {
    try ( Real a = new Real())
    {
      result.zero();
      for (int i = 0; i < v.getNumRows(); i++)
      {
        v.get(i, 0).abs(a);
        if (a.compareTo(result) > 0)
        {
          result.set(a);
        }
      }
    }
  }

  /**
   * Run the damped-Newton (Levenberg–Marquardt) ascent of the log-likelihood
   * from the starting point (r₀,p₀): each step solves
   *
   * <pre>
   * (-H + μ·diag(-H))·δ = S
   * </pre>
   *
   * via {@link RealMatrix#solve} — the Marquardt damping μ regularizes the
   * Newton system on the positive-definite -H (ℓ is concave in the interior)
   * — and a step is accepted only when it is admissible (r &gt; 0, 0 &lt; p
   * &lt; 1) and strictly increases L = Σᵢ ℓ(yᵢ); a rejected step triples μ, an
   * accepted one divides it by three. Convergence is declared at ‖S‖∞ &lt;
   * 10⁻²⁰ or an accepted step of size ‖δ‖∞ &lt; 10⁻²⁰. The distribution's
   * parameter handles are left at the estimates on return.
   */
  public Result estimate(Real r0, Real p0)
  {
    final int  n    = VARIABLES.length;
    RealMatrix S    = RealMatrix.newMatrix(n, 1);
    RealMatrix H    = RealMatrix.newMatrix(n, n);
    RealMatrix A    = RealMatrix.newMatrix(n, n);
    RealMatrix δ    = RealMatrix.newMatrix(n, 1);
    RealMatrix x    = RealMatrix.newMatrix(n, 1);
    RealMatrix xnew = RealMatrix.newMatrix(n, 1);

    x.get(0, 0).set(r0);
    x.get(1, 0).set(p0);
    distribution.r.set(r0);
    distribution.p.set(p0);
    distribution.context.invalidateAllCaches();

    try ( Real L = new Real(); Real Lnew = new Real(); Real damping = new Real(); Real tmp = new Real();
          Real snorm = new Real(); Real dxnorm = new Real(); Real fac = new Real("3",
                                                                                 bits);
          Real stol = new Real("1e-20",
                               bits);
          Real xtol = new Real("1e-20",
                               bits))
    {
      accumulate(L, S, H);
      log.info("MLE start: L={}  r={}  p={}", L, x.get(0, 0), x.get(1, 0));

      damping.set("1e-3", bits);
      boolean converged  = false;
      int     iterations = 0;
      for (int iter = 0; iter < maxIterations && !converged; iter++)
      {
        iterations = iter + 1;
        maxAbs(S, snorm);
        if (snorm.compareTo(stol) < 0)
        {
          converged  = true;
          iterations = iter;
          log.info("MLE iteration {}: converged ‖S‖∞={}", iter, snorm);
          break;
        }

        boolean stepped = false;
        for (int d = 0; d < maxDamping && !stepped; d++)
        {
          for (int a = 0; a < n; a++)
          {
            for (int b = 0; b < n; b++)
            {
              H.get(a, b).neg(A.get(a, b));            // A = -H
            }
            A.get(a, a).mul(damping, bits, tmp);       // Marquardt scaling:
            A.get(a, a).add(tmp, bits, A.get(a, a));   // + μ·diag(-H)
          }
          if (A.solve(S, bits, δ) == null)
          {
            damping.mul(fac, bits, damping);
            continue;
          }
          for (int j = 0; j < n; j++)
          {
            x.get(j, 0).add(δ.get(j, 0), bits, xnew.get(j, 0));
            // the iterate is a point choice, not a verified enclosure: the
            // Newton ascent is self-correcting, so the candidate is
            // re-midpointed to keep the per-step ball radii from compounding
            // across solves
            xnew.get(j, 0).getRad().zero();
          }
          if (admissible(xnew))
          {
            distribution.r.set(xnew.get(0, 0));
            distribution.p.set(xnew.get(1, 0));
            distribution.context.invalidateAllCaches();
            logLikelihood(Lnew);
            if (Lnew.isFinite() && Lnew.compareTo(L) > 0)
            {
              damping.div(fac, bits, damping);
              stepped = true;
              break;
            }
          }
          damping.mul(fac, bits, damping);
        }

        if (!stepped)
        {
          distribution.r.set(x.get(0, 0));
          distribution.p.set(x.get(1, 0));
          distribution.context.invalidateAllCaches();
          log.info("MLE iteration {}: no admissible ascending step, ‖S‖∞={}", iter, snorm);
          break;
        }

        maxAbs(δ, dxnorm);
        for (int j = 0; j < n; j++)
        {
          x.get(j, 0).set(xnew.get(j, 0));
        }
        L.set(Lnew);
        accumulate(L, S, H);
        log.info("MLE iteration {}: L={}  ‖S‖∞={}  damping={}  r={}  p={}",
                 iter,
                 L,
                 snorm,
                 damping,
                 x.get(0, 0),
                 x.get(1, 0));
        if (dxnorm.compareTo(xtol) < 0)
        {
          converged = true;
        }
      }

      Real rHat = new Real(bits).set(x.get(0, 0));
      Real pHat = new Real(bits).set(x.get(1, 0));
      Real obj  = new Real(bits).set(L);
      return new Result(rHat,
                        pHat,
                        obj,
                        iterations,
                        converged);
    }
    finally
    {
      S.close();
      H.close();
      A.close();
      δ.close();
      x.close();
      xnew.close();
    }
  }

  @Override
  public void close()
  {
    score.close();
    for (Jacobian<Real, Real, RealFunction> row : hessianRows)
    {
      row.close();
    }
  }

  /**
   * Command-line utility: sample N observations from NB(r,p) and estimate
   * (r,p) back from a handful of starting points, reporting the iteration
   * count from each. Launched by {@code bin/negativeBinomialEstimation}.
   *
   * <pre>
   * usage: negativeBinomialEstimation [r p N randomSeed bits]
   * defaults:                          4 0.35 250 7 128
   * </pre>
   */
  public static void main(String[] args) throws Exception
  {
    String rTrue = args.length > 0 ? args[0] : "4";
    String pTrue = args.length > 1 ? args[1] : "0.35";
    int    N     = args.length > 2 ? java.lang.Integer.parseInt(args[2]) : 250;
    long   seed  = args.length > 3 ? Long.parseLong(args[3]) : 7L;
    int    bits  = args.length > 4 ? java.lang.Integer.parseInt(args[4]) : 128;

    try ( NegativeBinomialDistribution nb = new NegativeBinomialDistribution(new Real(rTrue,
                                                                                      bits),
                                                                             new Real(pTrue,
                                                                                      bits),
                                                                             bits);
          Real samples = Real.newVector(N); RandomState state = new RandomState())
    {
      state.initialize().seed(seed);
      nb.sample(state, bits, samples, N);
      log.info("sampled N={} observations from NB(r={}, p={})", N, rTrue, pTrue);

      try ( NegativeBinomialMaximumLikelihoodEstimation mle = new NegativeBinomialMaximumLikelihoodEstimation(nb,
                                                                                                              samples,
                                                                                                              N,
                                                                                                              bits))
      {
        String[][] startingPoints =
        {
          { "1", "0.5" },
          { "2", "0.2" },
          { "8", "0.7" },
          { "0.5", "0.9" } };
        for (String[] start : startingPoints)
        {
          try ( Real r0 = new Real(start[0],
                                   bits);
                Real p0 = new Real(start[1],
                                   bits);
                Result result = mle.estimate(r0, p0))
          {
            log.info("from (r₀={}, p₀={}): {}", start[0], start[1], result);
          }
        }
      }
    }
  }

}
