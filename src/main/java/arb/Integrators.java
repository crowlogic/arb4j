package arb;

import static arb.arblib.*;

import java.util.concurrent.atomic.AtomicLong;

import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.ComplexMagnitude;
import arb.functions.real.RealFunction;
import arb.utensils.Utensils;

public class Integrators
{

  /**
   * <p>
   * Computes a rigorous enclosure of the integral ∫f(t=a..b) following a straight
   * line-segment between the complex numbers a and b. <br>
   * For finite results, a & b must be finite and f must be bounded on the
   * integration path. <br>
   * To compute improper integrals, the path of integration should be manually
   * truncated or a regularizing change of variables made if possible. <br>
   * <br>
   * 
   * By default, this function will be evaluated as the integrand and
   * this{@link #evaluate(Complex, int, int, Complex)} will only be called with
   * order = 0 or order = 1; that is, derivatives are not required. <br>
   * <br>
   * 
   * this{@link #evaluate(Complex, int, int, Complex)} will be called with order =
   * 0 to evaluate this function normally on the integration path (either at a
   * single point or on a subinterval). <br>
   * In this case, this function is treated as a pointwise defined function and
   * can have arbitrary discontinuities. <br>
   * <br>
   * 
   * this{@link #evaluate(Complex, int, int, Complex)} will be called with order =
   * 1 to evaluate this function on a domain surrounding a segment of the
   * integration path for the purpose of bounding the error of a quadrature
   * formula. <br>
   * In this case, this{@link #evaluate(Complex, int, int, Complex)} must verify
   * that this function is holomorphic on the line between a and b (and output a
   * non-finite value if it is not). <br>
   * <br>
   * 
   * The integration algorithm combines direct interval enclosures, Gauss-Legendre
   * quadrature where this function is holomorphic, and adaptive subdivision. <br>
   * This strategy supports integrands with discontinuities while providing
   * exponential convergence for typical piecewise holomorphic integrands.
   * </p>
   * 
   * <b> For typical usage, set rel_goal = prec and abs_tol = 2^(-prec). It
   * usually only makes sense to have rel_goal between 0 and prec. </b><br>
   * <br>
   * 
   * The algorithm attempts to achieve an error of max(ε[abs],M*ε[rel]) on each
   * subinterval, where M is the magnitude of the integral. <br>
   * These parameters are only guidelines; the cumulative error may be larger than
   * both the prescribed absolute and relative error goals, depending on the
   * number of subdivisions, cancellation between segments of the integral, and
   * numerical errors in the evaluation of the integrand. <br>
   * <br>
   * 
   * <p>
   * To compute tiny integrals with high relative accuracy, one should set
   * ε[abs]~=M*ε[rel] where M is a known estimate of the magnitude. Setting ε[abs]
   * to 0 is also allowed, forcing use of a relative instead of an absolute
   * tolerance goal. This can be handy for exponentially small or large functions
   * of unknown magnitude. <b>It is recommended to avoid setting ε[abs] very small
   * if possible since the algorithm might need many extra subdivisions to
   * estimate M automatically<b>; if the approximate magnitude can be estimated by
   * some external means (for example if a midpoint-width or endpoint-width
   * estimate is known to be accurate), providing an appropriate ε[abs]~=M*ε[rel]
   * will be more efficient. <br>
   * <br>
   * 
   * If the integral has very large magnitude, setting the absolute tolerance to a
   * corresponding large value is recommended for best performance, but it is not
   * necessary for convergence since the absolute tolerance is increased
   * automatically during the execution of the algorithm if the partial integrals
   * are found to have larger error. <br>
   * <br>
   * 
   * Additional options for the integration can be provided via the options
   * parameter (documented below). To use all defaults, NULL can be passed for
   * options.
   * </p>
   * 
   * @param a                     from
   * 
   * @param b                     to
   * 
   * @param relAccuracyBitsGoal   relative accuracy goal as a nonnegative number
   *                              of bits, i.e. target a relative error less than
   *                              ε[rel=]2^(-relAccuracyGoalBits)
   * 
   * @param absErrorToleranceGoal absolute accuracy goal as a
   *                              {@link ComplexMagnitude} describing the error
   *                              tolerance, i.e. target an absolute error less
   *                              than ε[abs]=absErrorToleranceGoal
   * @param options
   * @param prec
   * @param res
   * @return true if the integral converged to the target accuracy on all
   *         subintervals otherwise returns false
   */
  public static Complex integrate(HolomorphicFunction f,
                                  Complex a,
                                  Complex b,
                                  int relAccuracyBitsGoal,
                                  Magnitude absErrorToleranceGoal,
                                  IntegrationOptions options,
                                  int prec,
                                  Complex res)
  {
    assert relAccuracyBitsGoal > 0;
    assert absErrorToleranceGoal != null;
    assert res != null;
    relAccuracyBitsGoal = Math.max(relAccuracyBitsGoal, 0);

    if (options == null)
    {
      options = new IntegrationOptions();
    }

    try ( Complex s = new Complex();
          Complex t = new Complex();
          Complex u = new Complex();
          Magnitude tmpm = new Magnitude();
          Magnitude tmpn = new Magnitude();
          Magnitude newTol = new Magnitude();)
    {
      int        depthLimit = options.getDepthLimit(prec);
      int        evalLimit  = options.getEvaluationLimit(prec) * 10;
      int        degLimit   = options.getDegreeLimit(relAccuracyBitsGoal, prec);
      int        depth, maxDepth, top;
      long       leafIntervalCount;
      int        allocation;
      boolean    useHeap    = options.useHeap;
      boolean    debug      = options.verbose;
      AtomicLong evalCount  = new AtomicLong();

      if (useHeap)
      {
        throw new UnsupportedOperationException("TODO: needs to be debugged");
      }
      allocation = 4;
      // TODO: take as,bs,vs,ms and put them in their own (static) class
      try ( Complex as = Complex.newVector(2 * allocation);
            Complex bs = Complex.newVector(2 * allocation);
            Complex vs = Complex.newVector(2 * allocation);
            Magnitude ms = Magnitude.newVector(2 * allocation);)
      {
        as.set(a);
        bs.set(b);
        integrate(f,
                  relAccuracyBitsGoal,
                  absErrorToleranceGoal,
                  prec,
                  res,
                  s,
                  u,
                  tmpm,
                  newTol,
                  depthLimit,
                  evalLimit,
                  degLimit,
                  allocation,
                  useHeap,
                  evalCount,
                  as,
                  bs,
                  vs,
                  ms,
                  debug);
      }
    }

    return res;
  }

  public static Complex integrate(HolomorphicFunction f,
                                  Real a,
                                  Real b,
                                  int relAccuracyBitsGoal,
                                  Magnitude absErrorToleranceGoal,
                                  IntegrationOptions options,
                                  int prec,
                                  Complex res)
  {
    assert relAccuracyBitsGoal > 0;
    assert absErrorToleranceGoal != null;
    assert res != null;

    if (options == null)
    {
      options = new IntegrationOptions();
    }

    try ( Complex s = new Complex();
          Complex t = new Complex();
          Complex u = new Complex();
          Magnitude tmpm = new Magnitude();
          Magnitude tmpn = new Magnitude();
          Magnitude newTol = new Magnitude();)
    {
      int        depthLimit, evalLimit, degLimit;
      int        depth, maxDepth, top;
      long       leafIntervalCount;
      int        allocation;
      boolean    useHeap;
      boolean    realError;
      AtomicLong evalCount;

      evalCount           = new AtomicLong();
      depthLimit          = options.getDepthLimit(prec);
      evalLimit           = options.getEvaluationLimit(prec) * 10;
      relAccuracyBitsGoal = Math.max(relAccuracyBitsGoal, 0);
      degLimit            = options.getDegreeLimit(relAccuracyBitsGoal, prec);
      useHeap             = options.useHeap;

      if (useHeap)
      {
        throw new UnsupportedOperationException("TODO: needs to be debugged");
      }
      allocation = 4;
      // TODO: take as,bs,vs,ms and put them in their own (static) class
      try ( Complex as = Complex.newVector(2 * allocation);
            Complex bs = Complex.newVector(2 * allocation);
            Complex vs = Complex.newVector(2 * allocation);
            Magnitude ms = Magnitude.newVector(2 * allocation);)
      {

        /* Compute initial crude estimate for the whole interval. */
        as.re().set(a);
        bs.re().set(b);
        integrate(f,
                  relAccuracyBitsGoal,
                  absErrorToleranceGoal,
                  prec,
                  res,
                  s,
                  u,
                  tmpm,
                  newTol,
                  depthLimit,
                  evalLimit,
                  degLimit,
                  allocation,
                  useHeap,
                  evalCount,
                  as,
                  bs,
                  vs,
                  ms,
                  options.verbose);
      }
    }

    return res;
  }

  static void integrate(HolomorphicFunction f,
                        int relAccuracyBitsGoal,
                        Magnitude absErrorToleranceGoal,
                        int prec,
                        Complex res,
                        Complex s,
                        Complex u,
                        Magnitude tmpm,
                        Magnitude newTol,
                        int depthLimit,
                        int evalLimit,
                        int degLimit,
                        int allocation,
                        boolean useHeap,
                        AtomicLong evalCount,
                        Complex as,
                        Complex bs,
                        Complex vs,
                        Magnitude ms,
                        boolean debug)
  {
    if (debug)
    {
      System.out.format("integrate(f=%s,relAccuracyBitsGoal=%s,absErrTolGoal=%s, prec=%s, res=%s, s=%s, u=%s)\n",
                        f.getClass().getSimpleName(),
                        relAccuracyBitsGoal,
                        absErrorToleranceGoal,
                        prec,
                        res,
                        s,
                        u);
    }

    int  depth;
    int  maxDepth;
    int  top;
    long leafIntervalCount;

    f.simpleQuadrature(as, bs, prec, vs);
    mag_hypot(ms, vs.getReal().getRad(), vs.getImag().getRad());

    depth = maxDepth = 1;
    evalCount.set(1);
    leafIntervalCount = 0;

    acb_get_mag_lower(tmpm, vs);
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyBitsGoal);
    mag_max(newTol, absErrorToleranceGoal, tmpm);

    s.zero();

    while (depth >= 1)
    {
      if (debug)
      {
        System.out.println("Depth: " + depth);
      }

      top = useHeap ? 0 : depth - 1;

      Magnitude topm = ms.get(top);
      if (topm.compareTo(newTol) < 0 || Utensils.overlaps(u, as.get(top), bs.get(top), prec))
      {
        if (debug)
        {
          System.out.println("Finished evaluating subinterval, preparing to accumulate.");
        }

        leafIntervalCount++;
        depth--;
        Integrators.accumulateIntegrand(prec, s, depth, top, useHeap, as, bs, vs, ms);

        if (debug)
        {
          System.out.println("Accumulated: " + s);
        }
        continue;
      }

      if (vs.get(top).isFinite())
      {
        if (Utensils.evaluateGaussLegendreIntegral(f,
                                                   as.get(top),
                                                   bs.get(top),
                                                   newTol,
                                                   degLimit,
                                                   prec,
                                                   evalCount,
                                                   u))
        {
          if (debug)
          {
            System.out.println("Gauss-Legendre integral used.");
          }

          leafIntervalCount++;
          depth--;

          if (debug)
          {
            System.out.println("Accumulating Gauss-Legendre: " + s);
          }

          Integrators.accumulateGaussLegendreQuadrature(relAccuracyBitsGoal,
                                                        prec,
                                                        s,
                                                        u,
                                                        tmpm,
                                                        newTol,
                                                        depth,
                                                        top,
                                                        useHeap,
                                                        as,
                                                        bs,
                                                        vs,
                                                        ms);
          continue;
        }
      }

      assert depth < depthLimit - 1 : "depth limit " + evalLimit + " exceeded ";

      if (depth >= allocation - 1)
      {
        allocation *= 2;

        if (debug)
        {
          System.out.println("Resizing vectors. New allocation size: " + allocation);
        }

        Utensils.resizeVectors(allocation, as, bs, vs, ms);
      }

      Utensils.bisect(f,
                      relAccuracyBitsGoal,
                      prec,
                      tmpm,
                      newTol,
                      depth,
                      top,
                      evalCount,
                      as,
                      bs,
                      vs,
                      ms,
                      topm,
                      debug);

      if (debug)
      {
        System.out.println("Bisect operation performed.");
      }

      if (useHeap)
      {
        Utensils.heapUp(as, bs, vs, ms, depth);
        Utensils.heapDown(as, bs, vs, ms, depth + 1);

        if (debug)
        {
          System.out.println("Heap adjusted.");
        }
      }

      depth++;
      maxDepth = Math.max(depth, maxDepth);
    }

    res.set(s);

    if (debug)
    {
      System.out.println("Final result: " + res);
    }
  }

  public static void accumulateIntegrand(int prec,
                                         Complex s,
                                         int depth,
                                         int top,
                                         boolean useHeap,
                                         Complex as,
                                         Complex bs,
                                         Complex vs,
                                         Magnitude ms)
  {
    s.add(vs.get(top), prec, s);
    if (useHeap && depth > 0)
    {
      Utensils.swapElements(as, bs, vs, ms, depth);
      Utensils.heapUp(as, bs, vs, ms, depth);
    }
  }

  public static void accumulateIntegrand(int prec,
                                         Complex s,
                                         int depth,
                                         int top,
                                         boolean useHeap,
                                         Real as,
                                         Real bs,
                                         Complex vs,
                                         Magnitude ms)
  {
    s.add(vs.get(top), prec, s);
    if (useHeap && depth > 0)
    {
      Utensils.swapElements(as, bs, vs, ms, depth);
      Utensils.heapUp(as, bs, vs, ms, depth);
    }
  }

  public static void accumulateGaussLegendreQuadrature(int relAccuracyGoalBits,
                                                       int prec,
                                                       Complex s,
                                                       Complex u,
                                                       Magnitude tmpm,
                                                       Magnitude newTol,
                                                       int depth,
                                                       int top,
                                                       boolean useHeap,
                                                       Complex as,
                                                       Complex bs,
                                                       Complex vs,
                                                       Magnitude ms)
  {
    if (vs.get(top).isFinite() && vs.get(top).isReal())
    {
      /* It is known that the result is real. */
      u.getImag().zero();
    }

    s.add(u, prec, s);

    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, u);
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    if (useHeap && depth > 0)
    {
      Utensils.swapElements(as, bs, vs, ms, depth);
      Utensils.heapUp(as, bs, vs, ms, depth);
    }
  }

  public static void accumulateGaussLegendreQuadrature(int relAccuracyGoalBits,
                                                       int prec,
                                                       Complex s,
                                                       Complex u,
                                                       Magnitude tmpm,
                                                       Magnitude newTol,
                                                       int depth,
                                                       int top,
                                                       boolean useHeap,
                                                       Real as,
                                                       Real bs,
                                                       Complex vs,
                                                       Magnitude ms)
  {
    if (vs.get(top).isFinite() && vs.get(top).isReal())
    {
      /* It is known that the result is real. */
      u.getImag().zero();
    }

    s.add(u, prec, s);

    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, u);
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    if (useHeap && depth > 0)
    {
      Utensils.swapElements(as, bs, vs, ms, depth);
      Utensils.heapUp(as, bs, vs, ms, depth);
    }
  }

  public static Real integrate(RealFunction f,
                               Real left,
                               Real right,
                               int relAccuracyBitsGoal,
                               Magnitude absErrorToleranceGoal,
                               IntegrationOptions options,
                               int prec,
                               Real res)
  {
    assert relAccuracyBitsGoal > 0;
    assert absErrorToleranceGoal != null;
    assert res != null;

    if (options == null)
    {
      options = new IntegrationOptions();
    }

    try ( Complex s = new Complex();
          Complex t = new Complex();
          Complex u = new Complex();
          Magnitude tmpm = new Magnitude();
          Magnitude tmpn = new Magnitude();
          Magnitude newTol = new Magnitude();)
    {
      int        depthLimit, evalLimit, degLimit;
      int        depth, maxDepth, top;
      long       leafIntervalCount;
      int        allocation;
      boolean    useHeap;
      boolean    realError;
      AtomicLong evalCount;

      evalCount           = new AtomicLong();
      depthLimit          = options.getDepthLimit(prec);
      evalLimit           = options.getEvaluationLimit(prec) * 10;
      relAccuracyBitsGoal = Math.max(relAccuracyBitsGoal, 0);
      degLimit            = options.getDegreeLimit(relAccuracyBitsGoal, prec);
      useHeap             = options.useHeap;
      boolean debug = options.verbose;

      if (useHeap)
      {
        throw new UnsupportedOperationException("TODO: needs to be debugged");
      }
      allocation = 4;
      // TODO: take as,bs,vs,ms and put them in their own (static) class
      try ( Complex as = Complex.newVector(2 * allocation);
            Complex bs = Complex.newVector(2 * allocation);
            Complex vs = Complex.newVector(2 * allocation);
            Magnitude ms = Magnitude.newVector(2 * allocation);
            Complex value = new Complex();)
      {
        as.re().set(left);
        bs.re().set(right);
        integrate(f.asHolomorphicFunction(),
                  relAccuracyBitsGoal,
                  absErrorToleranceGoal,
                  prec,
                  value,
                  s,
                  u,
                  tmpm,
                  newTol,
                  depthLimit,
                  evalLimit,
                  degLimit,
                  allocation,
                  useHeap,
                  evalCount,
                  as,
                  bs,
                  vs,
                  ms,
                  debug);
        assert value.im().isZero();
        res.set(value.re());
      }
    }

    return res;
  }

}
