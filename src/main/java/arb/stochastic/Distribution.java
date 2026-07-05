package arb.stochastic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * Probability law for arb4j-style stochastic models. The density is the
 * derivative of the distribution function.
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

    Real       θ     = Real.newVector(n);
    θ.set(initialParameters);
    zeroRadius(θ);
    RealMatrix U     = RealMatrix.newMatrix(n, 1);
    RealMatrix M     = RealMatrix.newMatrix(n, n);
    RealMatrix δ     = RealMatrix.newMatrix(n, 1);

    boolean converged = false;
    int     iteration = 0;

    // Newton–Kantorovich iteration for F(θ)=U(θ)=∇ℓ=0 with F'(θ)=−M(θ),
    // M=−∇²ℓ the observed information: θ ← θ + M(θ)⁻¹U(θ). No damping, no free
    // parameters; the convergence tolerance 2⁻ᵇⁱᵗˢ/² is fixed by the requested
    // precision, not chosen.
    try ( Real logL      = new Real();
          Real magnitude = new Real();
          Real stepNorm  = new Real();
          Real tolerance = new Real().one().mul2e(-bits / 2))
    {
      for (; iteration < maxIterations; iteration++)
      {
        evaluateAt(θ, ℓ, score, info, observations, bits, logL, U, M);
        M.solve(U, bits, δ);

        stepNorm.zero();
        for (int j = 0; j < n; j++)
        {
          θ.get(j).add(δ.get(j, 0), bits, θ.get(j));
          θ.get(j).getRad().zero();
          δ.get(j, 0).abs(bits, magnitude);
          if (magnitude.compareTo(stepNorm) > 0)
          {
            stepNorm.set(magnitude);
          }
        }

        log.debug("iter={} θ={} ‖δ‖={}", iteration, θ, stepNorm);

        if (stepNorm.compareTo(tolerance) < 0)
        {
          converged = true;
          iteration++;
          break;
        }
      }
    }

    setParameters(θ);
    invalidate(ℓ, score, info);

    observedInformation = RealMatrix.newMatrix(n, n);
    try ( Real logLfinal = new Real())
    {
      evaluateAt(θ, ℓ, score, info, observations, bits, logLfinal, U, observedInformation);
    }
    parameterCovariance = RealMatrix.newMatrix(n, n);
    observedInformation.inverse(bits, parameterCovariance);

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
   * Set the parameters to {@code point}, refresh the compiled functions, and
   * evaluate the log-likelihood, the score U = ∇ℓ, and the observed information
   * M = −∇²ℓ summed over the sample.
   */
  private void evaluateAt(Real point, RealFunction ℓ, RealFunction[] score, RealFunction[][] info,
                          Real observations, int bits, Real logL, RealMatrix U, RealMatrix M)
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
      for (int i = 0; i < observations.dim(); i++)
      {
        Real x = observations.get(i);
        ℓ.evaluate(x, 1, bits, term);
        logL.add(term, bits, logL);
        for (int j = 0; j < n; j++)
        {
          score[j].evaluate(x, 1, bits, term);
          U.get(j, 0).add(term, bits, U.get(j, 0));
          for (int k = 0; k < n; k++)
          {
            info[j][k].evaluate(x, 1, bits, term);
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
