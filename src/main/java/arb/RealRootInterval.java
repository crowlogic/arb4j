package arb;

import static arb.utensils.Utensils.println;
import static java.lang.String.format;
import static java.lang.System.out;

import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRootInterval extends
                              FloatInterval
{
  @Override
  public RealRootInterval set(FloatInterval interval)
  {
    return (RealRootInterval) super.set(interval);
  }

  @Override
  public String toString()
  {
    return String.format("[%s, %s]=%s", getA(), getB(), status);
  }

  public RealRootInterval(double left, double right)
  {
    super(left,
          right);
    assert left < right;
  }

  public RealRootInterval()
  {
  }

  public RealRootInterval(Float left, Float right)
  {
    super(left,
          right);
    assert left.compareTo(right) <= 0;
  }

  public RealRootInterval(FloatInterval interval)
  {
    this(interval.getA(),
         interval.getB());
  }

  public RealRootInterval swap(RealRootInterval u)
  {
    RealRootInterval r      = (RealRootInterval) super.swap(u);
    RootStatus       status = u.status;
    u.status = r.status;
    r.status = status;
    return r;
  }

  public RootStatus status = RootStatus.RootUnknown;

  /**
   * Splits the interval. Chiefly called by
   * {@link RealFunction#recursivelyLocateRoots(Roots, RealRootInterval, int, int, int, RootLocatorOptions)}
   * 
   * @param func
   * @param found
   * @param asign
   * @param bsign
   * @param depth
   * @param config
   * @return
   */
  public boolean split(RealFunction func, Roots found, int asign, int bsign, int depth, RootLocatorOptions config)
  {
    if (RealFunction.verbose)
    {
      println(String.format("%s.split(func=%s, found=%s, asign=%s, bsign=%s, depth=%s)",
                            this,
                            func,
                            found,
                            asign,
                            bsign,
                            depth));
    }
    try ( RealRootInterval L = new RealRootInterval(); RealRootInterval R = new RealRootInterval();)
    {
      int msign = func.calculatePartition(L, R, this, config.prec);
      found.evals++;
      if (msign == 0)
      {
        return false;
      }

      func.recursivelyLocateRoots(found, L, asign, msign, depth + 1, config);
      func.recursivelyLocateRoots(found, R, msign, bsign, depth + 1, config);
    }
    return true;
  }

  public RootStatus determineRootStatus(Roots found, RealFunction func, int asign, int bsign, int prec)
  {
    status = RootStatus.RootUnknown;
    try ( Real t = Real.newVector(2); Real x = new Real())
    {
      func.evaluate(getReal(prec, x), 1, prec, t.get(0));
      found.evals++;

      if (t.isPositive() || t.isNegative())
      {
        status = RootStatus.NoRoot;
      }
      else
      {
        if ((asign < 0 && bsign > 0) || (asign > 0 && bsign < 0))
        {
          Real firstDerivative = func.evaluate(x, 2, prec, t).get(1);
          found.evals++;

          if (firstDerivative.isFinite() && !firstDerivative.containsZero())
          {
            status = RootStatus.RootLocated;
          }
        }
      }
    }

    return status;
  }

  public static enum RefinementResult
  {
   ImpreciseInput,
   Success,
   NoConvergence
  }

  public static final int FLINT_BITS = 64;

  /**
   * Increases the precision of the root
   * 
   * @param f
   * @param highPrec
   * @param w                 3-vector of Taylor jet
   * @param v                 input/output result
   * @param u
   * @param convergenceRegion output
   * @param convergenceFactor output
   * @param rootInterval
   * @return
   */
  public Real refine(RealFunction func,
                     int lowPrec,
                     int digits,
                     Real w,
                     Real v,
                     RealRootInterval u,
                     RealRootInterval convergenceRegion,
                     Float convergenceFactor,
                     boolean verbose)
  {
    if (RealFunction.verbose)
    {
      println(format("%s.refine(func=%s, lowPrec=%d, digits=%d))", this, func, lowPrec, digits));
    }
    int highPrec = (int) (digits * 3.32192809488736 + 10);

    if (status == RootStatus.NoRoot)
    {
      return null;
    }

    if (bisectAndRefine(func, v, convergenceRegion, u, 5, lowPrec) != RefinementResult.Success)
    {
      if (RealFunction.verbose)
      {
        System.out.println("Bisection failed");
      }
    }
    else
    {

      if (convergenceRegion.bisectAndRefine(func, v, this, u, 5, lowPrec) != RefinementResult.Success)
      {
        if (RealFunction.verbose)
        {
          System.out.println("second Bisection failed");
        }
      }

    }

    convergenceRegion.getReal(highPrec, v);

    func.getNewtonConvergenceFactor(v, w, highPrec, convergenceFactor);

    RefinementResult refinementResult = func.refineRootNewton(v,
                                                              getReal(highPrec, w),
                                                              convergenceFactor,
                                                              10,
                                                              highPrec,
                                                              verbose);
    if (refinementResult != RefinementResult.Success)
    {
      if (RealFunction.verbose)
      {
        out.format("Warning: some newton steps failed: refinementResult=%s\n", refinementResult);
      }

    }
    if (RealFunction.verbose)
    {
      System.out.println("Refined root: " + v);
    }
    return v;

  }

  public RefinementResult
         bisectAndRefine(RealFunction func, Real v, RealRootInterval t, RealRootInterval u, int iters, int prec)
  {
    if (RealFunction.verbose)
    {
      println(String.format("%s.bisectAndRefine(func=%s, t=%s, iters=%s, prec=%s)\n", this, func, t, iters, prec));
    }
    try ( Real m = new Real();)
    {
      m.setMid(getA());

      int asign = func.evaluate(m, 1, prec, v).sign();

      m.setMid(getB());
      int bsign = func.evaluate(m, 1, prec, v).sign();

      /* must have proper sign changes */
      if (asign == 0 || bsign == 0 || asign == bsign)
      {
        return RefinementResult.ImpreciseInput;
      }
      else
      {
        for (int i = 0; i < iters; i++)
        {
          int msign = func.calculatePartition(t, u, this, prec);

          /*
           * TODO: handle the case where the value at the midpoint is actually zero even
           * though it can't be distinguished via sign comparison zero, this should be
           * just checking isZero before returning NoConvergence.. right?
           */
          if (msign == 0)
          {
            return RefinementResult.NoConvergence;
          }

          swap(msign == asign ? u : t);
        }
      }
    }

    return RefinementResult.Success;
  }

}
