package arb;

import static java.lang.System.out;

import arb.functions.real.RealFunction;

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
   * Splits this interval into two halves
   * @param f
   * @param found
   * @param asign
   * @param bsign
   * @param depth
   * @param maxDepth
   * @param maxEvals
   * @param maxFound
   * @param prec
   * @return
   */
  public boolean split(RealFunction func,
                       FoundRoots found,
                       int asign,
                       int bsign,
                       int depth,
                       int maxDepth,
                       int maxEvals,
                       int maxFound,
                       int prec)
  {

    try ( RealRootInterval L = new RealRootInterval(); RealRootInterval R = new RealRootInterval();)
    {
      int msign = func.calculatePartition(L, R, this, prec);
      found.evals++;
      if (msign == 0)
      {
        return false;
      }

      func.recursivelyLocateRoots(found, L, asign, msign, depth + 1, maxDepth, maxEvals, maxFound, prec);
      func.recursivelyLocateRoots(found, R, msign, bsign, depth + 1, maxDepth, maxEvals, maxFound, prec);
    }
    return true;
  }

  public RootStatus determineRootStatus(FoundRoots found, RealFunction func, int asign, int bsign, int prec)
  {
    status = RootStatus.RootUnknown;
    try ( Real t = Real.newVector(2); Real x = new Real())
    {
      func.evaluate(getReal(x, prec), 1, prec, t);
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
   * 
   * @param f
   * @param highPrec
   * @param w                 3-vector of Taylor jet
   * @param v                 input/output result
   * @param convergenceRegion
   * @param convergenceFactor
   * @param rootInterval
   * @return
   */
  public Real refine(RealFunction func,
                     int lowPrec,
                     int digits,
                     Real w,
                     Real v,
                     RealRootInterval convergenceRegion,
                     Float convergenceFactor,
                     boolean verbose)
  {
    int highPrec = (int) (digits * 3.32192809488736 + 10);

    if (status == RootStatus.NoRoot)
    {
      return null;
    }

    if (bisectAndRefine(func, v, convergenceRegion, 5, lowPrec) != RefinementResult.Success)
    {
      System.out.println("Bisection failed");
    }
    else
    {

      if (convergenceRegion.bisectAndRefine(func, v, this, 5, lowPrec) != RefinementResult.Success)
      {
        System.out.println("second Bisection failed");
      }

    }

    convergenceRegion.getReal(v, highPrec);

    func.getNewtonConvergenceFactor(v, w, highPrec, convergenceFactor);

    RefinementResult refinementResult = func.refineRootNewton(v,
                                                              getReal(w, highPrec),
                                                              convergenceFactor,
                                                              10,
                                                              highPrec,
                                                              verbose);
    if (refinementResult != RefinementResult.Success)
    {
      out.format("Warning: some newton steps failed: refinementResult=%s\n", refinementResult);
    }
    System.out.println("Refined root: " + v);
    return v;

  }

  /**
   * 
   * @param f
   * @param v     tmp variable
   * @param t
   * @param iters
   * @param prec
   * @return
   */
  public RefinementResult bisectAndRefine(RealFunction func, Real v, RealRootInterval t, int iters, int prec)
  {
    try ( Real m = new Real(); RealRootInterval u = new RealRootInterval();)
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
           * just checking isZero before returning NoConvergence
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
