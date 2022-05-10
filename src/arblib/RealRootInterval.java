package arblib;

import static java.lang.System.out;

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
  }

  public RealRootInterval()
  {
  }

  public RealRootInterval(Float left, Float right)
  {
    super(left,
          right);
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
      if (verbose)
      {

        System.out.format("split(left=%s right=%s) depth=%d\n", L, R, maxDepth - depth);
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

  public boolean          verbose    = false;

  /**
   * 
   * @param func
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
                     Float convergenceFactor)
  {
    int highPrec = (int) (digits * 3.32192809488736 + 10);

    if (status != RootStatus.RootLocated)
    {
      return null;
    }

    if (bisectAndRefine(func, v, convergenceRegion, 5, lowPrec) != RefinementResult.Success)
    {
      System.out.println("Bisection failed");
    }
    else
    {
      if (verbose)
      {
        out.println("After bisection 1 : " + this);
      }
      if (convergenceRegion.bisectAndRefine(func, v, this, 5, lowPrec) != RefinementResult.Success)
      {
        System.out.println("second Bisection failed");
      }
      else
      {
        if (verbose)
        {
          out.println("After bisection 2 : " + convergenceRegion);
        }
      }

    }

    if (verbose)
    {
      out.println("highPrec=" + highPrec);
    }
    convergenceRegion.getReal(v, highPrec);

    System.out.println( "convergence region: " + convergenceRegion + " = \n " + " convergence region:" + v);

    func.getNewtonConvergenceFactor(v, w, highPrec, convergenceFactor);
    System.out.println("Newton convergence factor: " + convergenceFactor);

    if (refineRootNewton(func, v, getReal(w, highPrec), convergenceFactor, 10, highPrec) != RefinementResult.Success)
    {
      System.out.println("Warning: some newton steps failed\n");
    }
    System.out.println("Refined root: " + v);
    return v;

  }

  public RefinementResult refineRootNewton(RealFunction func,
                                           Real r,
                                           Real convergenceRegion,
                                           Float convergenceFactor,
                                           int eval_extra_prec,
                                           int prec)
  {
    int precs[] = new int[FLINT_BITS];
    int i, iters, wp, padding, start_prec;
    int result;

    start_prec = arblib.arb_rel_accuracy_bits(r);

    if (verbose)
    {
      System.out.format("newton initial accuracy: %d\n", start_prec);
    }

    padding  = arblib.arf_abs_bound_lt_2exp_si(convergenceFactor);
    padding  = Math.min(padding, prec) + 5;
    padding  = Math.max(0, padding);
    precs[0] = prec + padding;
    iters    = 1;
    while ((iters < FLINT_BITS) && (precs[iters - 1] + padding > 2 * start_prec))
    {
      precs[iters] = (precs[iters - 1] / 2) + padding;
      iters++;

      if (iters == FLINT_BITS)
      {
        return RefinementResult.ImpreciseInput;
      }
    }

    System.out.println("iters=" + iters);
    for (i = iters - 1; i >= 0; i--)
    {
      wp = precs[i] + eval_extra_prec;

      if (verbose)
      {
        System.out.printf("newton step: wp = %d + %d = %d      r=%s\n", precs[i], eval_extra_prec, wp, r);
      }

      if (!func.calculateNewtonStep(r, r, convergenceRegion, convergenceFactor, wp))
      {
        return RefinementResult.NoConvergence;
      }
    }

    return RefinementResult.Success;
  }

  /**
   * 
   * @param func
   * @param v     tmp variable
   * @param t
   * @param iters
   * @param prec
   * @return
   */
  public RefinementResult bisectAndRefine(RealFunction func, Real v, RealRootInterval t, int iters, int prec)
  {
    int  asign, bsign, msign, result;
    long i;

    try ( Real m = new Real(); RealRootInterval u = new RealRootInterval();)
    {
      m.setMid(getA());

      asign = func.evaluate(m, 1, prec, v).sign();

      m.setMid(getB());
      bsign = func.evaluate(m, 1, prec, v).sign();

      /* must have proper sign changes */
      if (asign == 0 || bsign == 0 || asign == bsign)
      {
        return RefinementResult.ImpreciseInput;
      }
      else
      {

        for (i = 0; i < iters; i++)
        {
          msign = func.calculatePartition(t, u, this, prec);

          /*
           * TODO: handle the case where the value at the midpoint is actually zero even
           * though it can't be distinguished via sign comparison zero, this should be
           * just checking isZero before returning NoConvergence
           */
          if (msign == 0)
          {
            return RefinementResult.NoConvergence;
          }

          if (msign == asign)
          {
            if (verbose)
            {
              out.println("swapping " + this + " with " + u);
            }
            swap(u);
          }
          else
          {
            if (verbose)
            {
              out.println("swapping " + this + " with " + t);
            }
            swap(t);
          }
        }
      }
    }

    return RefinementResult.Success;
  }

}
