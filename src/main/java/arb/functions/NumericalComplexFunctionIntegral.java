package arb.functions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;

/**
 * F(x) = ∫_a^x f(t) dt where f : ℝ → ℂ is a {@link RealToComplexFunction}.
 *
 * Complex-valued counterpart of {@link NumericalRealFunctionIntegral}. The grid
 * grows rightward from {@code a} with fixed step {@code dt} as larger values of
 * x are requested. Cumulative trapezoid sums are cached so any
 * previously-reached x is answered by a direct bin lookup with no
 * recomputation.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NumericalComplexFunctionIntegral implements
                                              RealToComplexFunction,
                                              AutoCloseable
{
  private static final Logger log = LoggerFactory.getLogger(NumericalComplexFunctionIntegral.class);

  RealToComplexFunction source;
  double                a;
  double                dt;
  int                   bits;
  boolean               initialized;

  Complex               yValues;    // sampled integrand values f(a + j*dt)
  Complex               cumulative; // cumulative[j] = F(a + j*dt)
  int                   count;      // number of points sampled so far

  /**
   * No-arg constructor for use by the expression-compiler intermediate-variable
   * machinery. {@link #init(RealToComplexFunction, double, double, int)} must
   * be called before {@link #evaluate(Real, int, int, Complex)}.
   */
  public NumericalComplexFunctionIntegral()
  {
  }

  public NumericalComplexFunctionIntegral(RealToComplexFunction source, double a, double dt, int bits)
  {
    init(source, a, dt, bits);
  }

  /**
   * Bind the integrand and the grid parameters and seed the cumulative cache at
   * j=0 with F(a)=0. May be called repeatedly to rebind — each call discards
   * any previously sampled grid and reseeds. This is required when the
   * enclosing expression's evaluate() runs multiple times with different
   * outer free variables (e.g. ν in the Kösters–Tu spectral integral): the
   * cumulative cache from a previous binding is no longer valid, since the
   * integrand is effectively a different function.
   */
  public NumericalComplexFunctionIntegral init(RealToComplexFunction source, double a, double dt, int bits)
  {
    if (initialized)
    {
      if (yValues != null)
      {
        yValues.close();
        yValues = null;
      }
      if (cumulative != null)
      {
        cumulative.close();
        cumulative = null;
      }
    }
    this.source = source;
    this.a      = a;
    this.dt     = dt;
    this.bits   = bits;

    yValues     = Complex.newVector(1);
    cumulative  = Complex.newVector(1);

    try ( Real t0 = new Real().set(a))
    {
      source.evaluate(t0, 1, bits, yValues.get(0));
    }
    cumulative.get(0).zero();
    count       = 1;
    initialized = true;
    return this;
  }

  @Override
  public Complex evaluate(Real x, int order, int bits, Complex result)
  {
    double xd      = x.getMid().doubleValue();
    int    jTarget = (int) Math.round((xd - a) / dt);
    jTarget = Math.max(0, jTarget);

    if (jTarget >= count)
    {
      int     newCount       = jTarget + 1;
      Complex newYValues     = Complex.newVector(newCount);
      Complex newCumulative  = Complex.newVector(newCount);
      for (int i = 0; i < count; i++)
      {
        newYValues.get(i).set(yValues.get(i));
        newCumulative.get(i).set(cumulative.get(i));
      }
      yValues.become(newYValues);
      cumulative.become(newCumulative);

      try ( Real tr = new Real(); Complex trap = new Complex(); Real halfDt = new Real().set(dt / 2.0))
      {
        for (int j = count; j < newCount; j++)
        {
          if (Expression.trace)
          {
            log.info("TRAPEZOID_COMPLEX [j={}/{}, a={}, dt={}]", j, newCount - 1, a, dt);
          }
          tr.set(a + j * dt);
          source.evaluate(tr, 1, bits, yValues.get(j));
          yValues.get(j - 1).add(yValues.get(j), bits, trap);
          trap.mul(halfDt, bits, trap);
          cumulative.get(j - 1).add(trap, bits, cumulative.get(j));
          if (Expression.trace)
          {
            log.info("TRAPEZOID_COMPLEX [j={}/{}, t={}, y[j]={}, trap={}, cum[j]={}]",
                     j, newCount - 1,
                     tr, yValues.get(j), trap, cumulative.get(j));
          }
        }
      }
      count = newCount;
    }

    return result.set(cumulative.get(jTarget));
  }

  @Override
  public String getName()
  {
    return "∫" + source.getName();
  }

  @Override
  public void close()
  {
    if (yValues != null)
    {
      yValues.close();
      yValues = null;
    }
    if (cumulative != null)
    {
      cumulative.close();
      cumulative = null;
    }
  }
}
