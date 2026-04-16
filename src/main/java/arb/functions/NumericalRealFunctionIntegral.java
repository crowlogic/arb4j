package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
  final RealFunction source;
  final double       a;
  final double       dt;
  final int          bits;

  Real               yValues;    // sampled integrand values f(a + j*dt)
  Real               cumulative; // cumulative[j] = F(a + j*dt)
  int                count;      // number of points sampled so far

  public NumericalRealFunctionIntegral(RealFunction source, double a, double dt, int bits)
  {
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
    count = 1;
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
          t.set(a + j * dt);
          source.evaluate(t, 1, bits, yValues.get(j));

          // cumulative[j] = cumulative[j-1] + (y[j-1] + y[j]) * dt/2
          yValues.get(j - 1).add(yValues.get(j), bits, trap);
          trap.mul(halfDt, bits, trap);
          cumulative.get(j - 1).add(trap, bits, cumulative.get(j));
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
    yValues.close();
    cumulative.close();
  }
}