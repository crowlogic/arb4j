package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

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
  final RealToComplexFunction source;
  final double                a;
  final double                dt;
  final int                   bits;

  Complex                     yValues;    // sampled integrand values f(a + j*dt)
  Complex                     cumulative; // cumulative[j] = F(a + j*dt)
  int                         count;      // number of points sampled so far

  public NumericalComplexFunctionIntegral(RealToComplexFunction source, double a, double dt, int bits)
  {
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
    count = 1;
  }

  @Override
  public Complex evaluate(Real x, int order, int bits, Complex result)
  {
    double xd      = x.getMid().doubleValue();
    int    jTarget = (int) Math.round((xd - a) / dt);
    jTarget = Math.max(0, jTarget);

    if (jTarget >= count)
    {
      int newCount = jTarget + 1;
      yValues    = yValues.resize(newCount);
      cumulative = cumulative.resize(newCount);

      try ( Real tr = new Real(); Complex trap = new Complex(); Real halfDt = new Real().set(dt / 2.0))
      {
        for (int j = count; j < newCount; j++)
        {
          tr.set(a + j * dt);
          source.evaluate(tr, 1, bits, yValues.get(j));

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
