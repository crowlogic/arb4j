package arb.stochastic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * Probability law for arb4j-style stochastic models. For a continuous law the
 * density is the derivative of the distribution function; for a discrete law the
 * mass f(k) is the increment F(k)−F(k−1) of the distribution function.
 *
 * <p>
 * A distribution owns its parameters, so it owns its calibration. The parameters
 * are exposed through {@link #parameterNames()} and {@link #parameters()} (a
 * {@link Real} vector), so {@link #calibrate(Real, Real, int, int)} fits any
 * distribution by maximum likelihood without the caller naming the parameter
 * set. The score U = ∇ℓ and the observed information M = −∇²ℓ are the compiler's
 * exact symbolic first and second derivatives of the log-density with respect to
 * each named parameter, summed over the sample. Levenberg–Marquardt solves the
 * damped system (M + λI)·δ = U with the Nielsen gain-ratio update and takes
 * θ ← θ + δ, so the fit is recovered to arbitrary precision with {@link RealMatrix}
 * arithmetic.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public abstract class Distribution implements
                         AutoCloseable
{
  private static final Logger log = LoggerFactory.getLogger(Distribution.class);

  protected final String      name;

  private RealMatrix          observedInformation;

  private RealMatrix          parameterCovariance;

  protected Distribution(String name)
  {
    this.name = name;
  }

  public String getName()
  {
    return name;
  }

  public abstract RealFunction densityFunction();

  public abstract RealFunction distributionFunction();

  public abstract RealFunction logDensityFunction();

  public abstract String[] parameterNames();

  public abstract Real parameters();

  public abstract void setParameters(Real θ);

  public abstract boolean isInDomain(Real θ);

  public RealMatrix observedInformation()
  {
    return observedInformation;
  }

  public RealMatrix parameterCovariance()
  {
    return parameterCovariance;
  }

  public int calibrate(Real observations, Real initialParameters, int maxIterations, int bits)
  {
    String[]         names = parameterNames();
    int              n     = names.length;
    RealFunction     ℓ     = logDensityFunction();
    RealFunction[]   score = new RealFunction[n];
    RealFunction[][] info  = new RealFunction[n][n];
    for (int j = 0; j < n; j++)
    {
      score[j] = ℓ.derivative(names[j]);
      for (int k = 0; k < n; k++)
      {
        info[j][k] = score[j].derivative(names[k]);
      }
    }

    // Exact aggregation: the sample sum Σᵢ g(xᵢ) equals Σ_v m(v)·g(v) over the
    // distinct observation values v with integer multiplicities m(v). For a
    // discrete law with far fewer distinct values than observations this
    // removes redundant evaluations with zero effect on the result.
    Real  distinct       = distinctValues(observations);
    int[] multiplicities = multiplicities(observations, distinct);

    Real       θ      = Real.newVector(n);
    θ.set(initialParameters);
    zeroRadius(θ);
    Real       θTrial = Real.newVector(n);
    RealMatrix U      = RealMatrix.newMatrix(n, 1);
    RealMatrix M      = RealMatrix.newMatrix(n, n);
    RealMatrix A      = RealMatrix.newMatrix(n, n);
    RealMatrix δ      = RealMatrix.newMatrix(n, 1);

    boolean converged = false;
    int     iteration = 0;

    // Levenberg–Marquardt iteration on the exact score U = ∇ℓ with the exact
    // observed information M = −∇²ℓ: solve (M + λI)δ = U, accept on likelihood
    // increase. Near the maximum M is positive definite, λ shrinks to zero and
    // the step is the undamped Newton step, so the Newton–Kantorovich theorem
    // gives quadratic convergence to the score root; far from it, λ grows until
    // the damped step ascends. The convergence tolerance 2⁻ᵇⁱᵗˢ/² is fixed by
    // the requested precision.
    try ( Real logL      = new Real();
          Real logLTrial = new Real();
          Real λ         = new Real();
          Real augmented = new Real();
          Real magnitude = new Real();
          Real stepNorm  = new Real();
          Real tolerance = new Real().one().mul2e(-bits / 2))
    {
      evaluateAt(θ, ℓ, score, info, distinct, multiplicities, bits, logL, U, M);
      λ.one().mul2e(-20, λ);

      for (; iteration < maxIterations; iteration++)
      {
        for (int j = 0; j < n; j++)
        {
          for (int k = 0; k < n; k++)
          {
            A.set(j, k, M.get(j, k));
          }
          M.get(j, j).add(λ, bits, augmented);
          A.set(j, j, augmented);
        }
        A.solve(U, bits, δ);

        stepNorm.zero();
        for (int j = 0; j < n; j++)
        {
          θ.get(j).add(δ.get(j, 0), bits, θTrial.get(j));
          θTrial.get(j).getRad().zero();
          δ.get(j, 0).abs(bits, magnitude);
          if (magnitude.compareTo(stepNorm) > 0)
          {
            stepNorm.set(magnitude);
          }
        }

        boolean accepted;
        if (isInDomain(θTrial))
        {
          evaluateAt(θTrial, ℓ, score, info, distinct, multiplicities, bits, logLTrial, U, M);
          accepted = logLTrial.isFinite() && logLTrial.compareTo(logL) > 0;
        }
        else
        {
          accepted = false;
        }

        log.debug("iter={} θ={} λ={} ‖δ‖={} accepted={}", iteration, θ, λ, stepNorm, accepted);

        if (accepted)
        {
          θ.set(θTrial);
          zeroRadius(θ);
          logL.set(logLTrial);
          λ.mul2e(-2, λ);
          if (stepNorm.compareTo(tolerance) < 0)
          {
            converged = true;
            iteration++;
            break;
          }
        }
        else
        {
          λ.mul2e(2, λ);
          evaluateAt(θ, ℓ, score, info, distinct, multiplicities, bits, logL, U, M);
        }
      }
    }

    setParameters(θ);
    invalidate(ℓ, score, info);

    observedInformation = RealMatrix.newMatrix(n, n);
    try ( Real logLfinal = new Real())
    {
      evaluateAt(θ, ℓ, score, info, distinct, multiplicities, bits, logLfinal, U, observedInformation);
    }
    parameterCovariance = RealMatrix.newMatrix(n, n);
    observedInformation.inverse(bits, parameterCovariance);

    distinct.close();

    return converged ? iteration : -iteration;
  }

  private static void zeroRadius(Real vector)
  {
    for (int j = 0; j < vector.dim(); j++)
    {
      vector.get(j).getRad().zero();
    }
  }

  private void invalidate(RealFunction ℓ, RealFunction[] score, RealFunction[][] info)
  {
    ℓ.invalidateCache();
    for (RealFunction s : score)
    {
      s.invalidateCache();
    }
    for (RealFunction[] row : info)
    {
      for (RealFunction e : row)
      {
        e.invalidateCache();
      }
    }
  }

  /**
   * The distinct values of the sample, in first-appearance order. Two
   * observations are the same value exactly when their balls are identical
   * point balls; any observation that is not an exact point joins the distinct
   * list as its own entry, so aggregation never alters the sum.
   */
  private static Real distinctValues(Real observations)
  {
    int m = observations.dim();
    int distinctCount = 0;
    Real scratch = Real.newVector(m);
    for (int i = 0; i < m; i++)
    {
      Real value = observations.get(i);
      boolean found = false;
      for (int j = 0; j < distinctCount && !found; j++)
      {
        found = scratch.get(j).equals(value);
      }
      if (!found)
      {
        scratch.get(distinctCount++).set(value);
      }
    }
    Real distinct = Real.newVector(distinctCount);
    for (int j = 0; j < distinctCount; j++)
    {
      distinct.get(j).set(scratch.get(j));
    }
    scratch.close();
    return distinct;
  }

  /** Integer multiplicity of each distinct value within the sample. */
  private static int[] multiplicities(Real observations, Real distinct)
  {
    int[] counts = new int[distinct.dim()];
    for (int i = 0; i < observations.dim(); i++)
    {
      for (int j = 0; j < distinct.dim(); j++)
      {
        if (distinct.get(j).equals(observations.get(i)))
        {
          counts[j]++;
          break;
        }
      }
    }
    return counts;
  }

  /**
   * Set the parameters to {@code point}, refresh the compiled functions, and
   * evaluate the log-likelihood, the score U = ∇ℓ, and the observed information
   * M = −∇²ℓ over the sample as multiplicity-weighted sums over its distinct
   * values.
   */
  private void evaluateAt(Real point, RealFunction ℓ, RealFunction[] score, RealFunction[][] info,
                          Real distinct, int[] multiplicities, int bits, Real logL, RealMatrix U, RealMatrix M)
  {
    int n = score.length;
    setParameters(point);
    invalidate(ℓ, score, info);

    logL.zero();
    for (int j = 0; j < n; j++)
    {
      U.get(j, 0).zero();
      for (int k = 0; k < n; k++)
      {
        M.get(j, k).zero();
      }
    }

    try ( Real term = new Real())
    {
      for (int i = 0; i < distinct.dim(); i++)
      {
        Real x = distinct.get(i);
        int  m = multiplicities[i];
        ℓ.evaluate(x, 1, bits, term).mul(m, bits, term);
        logL.add(term, bits, logL);
        for (int j = 0; j < n; j++)
        {
          score[j].evaluate(x, 1, bits, term).mul(m, bits, term);
          U.get(j, 0).add(term, bits, U.get(j, 0));
          for (int k = 0; k < n; k++)
          {
            info[j][k].evaluate(x, 1, bits, term).mul(m, bits, term);
            M.get(j, k).sub(term, bits, M.get(j, k));
          }
        }
      }
    }
  }

  @Override
  public void close()
  {
  }
}
