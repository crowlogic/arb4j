package arb.functions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;

/**
 * F(x) = ∫_a^x f(t) dt
 *
 * The grid grows rightward from {@code a} with fixed step {@code dt} as larger
 * values of x are requested. Cumulative trapezoid sums are cached so any
 * previously-reached x is answered by a direct bin lookup with no
 * recomputation.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NumericalRealFunctionIntegral implements
                                            RealFunction,
                                            AutoCloseable
{
  private static final Logger log = LoggerFactory.getLogger(NumericalRealFunctionIntegral.class);

  RealFunction source;
  double       a;
  double       dt;
  int          bits;
  boolean      initialized;

  Real         yValues;    // sampled integrand values f(a + j*dt)
  Real         cumulative; // cumulative[j] = F(a + j*dt)
  int          count;      // number of points sampled so far

  /**
   * No-arg constructor for use by the expression-compiler intermediate-variable
   * machinery. {@link #init(RealFunction, double, double, int)} must be called
   * before {@link #evaluate(Real, int, int, Real)}.
   */
  public NumericalRealFunctionIntegral()
  {
  }

  public NumericalRealFunctionIntegral(RealFunction source, double a, double dt, int bits)
  {
    init(source, a, dt, bits);
  }

  /**
   * Bind the integrand and the grid parameters and seed the cumulative cache at
   * j=0 with F(a)=0. May be called repeatedly to rebind — each call discards
   * any previously sampled grid and reseeds. This is required when the
   * enclosing expression's evaluate() runs multiple times with different
   * outer free variables (e.g. an outer parameter sweep where the integrand
   * closes over the outer's input variable): the cumulative cache from a
   * previous binding is no longer valid, since the integrand is effectively
   * a different function.
   */
  public NumericalRealFunctionIntegral init(RealFunction source, double a, double dt, int bits)
  {
    if (initialized)
    {
      // Release previously allocated buffers before rebinding.
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

    yValues     = Real.newVector(1);
    cumulative  = Real.newVector(1);

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
  public Real evaluate(Real x, int order, int bits, Real result)
  {
    double xd      = x.getMid().doubleValue();
    int    jTarget = (int) Math.round((xd - a) / dt);
    jTarget = Math.max(0, jTarget);

    if (jTarget >= count)
    {
      int newCount = jTarget + 1;
      yValues    = yValues.resize(newCount);
      cumulative = cumulative.resize(newCount);

      try ( Real t = new Real(); Real trap = new Real(); Real halfDt = new Real().set(dt / 2.0))
      {
        for (int j = count; j < newCount; j++)
        {
          if (Expression.trace)
          {
            log.info("TRAPEZOID [j={}/{}, a={}, dt={}]", j, newCount - 1, a, dt);
          }
          t.set(a + j * dt);
          source.evaluate(t, 1, bits, yValues.get(j));
          yValues.get(j - 1).add(yValues.get(j), bits, trap);
          trap.mul(halfDt, bits, trap);
          cumulative.get(j - 1).add(trap, bits, cumulative.get(j));
          if (Expression.trace)
          {
            log.info("TRAPEZOID [j={}/{}, t={}, y[j]={}, trap={}, cum[j]={}]",
                     j, newCount - 1,
                     t, yValues.get(j), trap, cumulative.get(j));
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