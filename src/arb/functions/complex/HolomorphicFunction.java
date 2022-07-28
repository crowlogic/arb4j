package arb.functions.complex;

import static arb.arb.*;
import static java.lang.Math.*;

import java.util.concurrent.atomic.*;

import arb.*;
import arb.exceptions.*;
import arb.functions.*;
import arb.functions.real.*;
import arb.utensils.*;

/**
 * A holomorphic function is a {@link Complex}-valued function of one or more
 * {@link Complex} variables that is complex differentiable in a neighbourhood
 * of each point in a domain in complex coordinate space C^n. The existence of a
 * complex derivative in a neighbourhood is a very strong condition: it implies
 * that a holomorphic function is infinitely differentiable and locally equal to
 * its own Taylor series (analytic). Holomorphic functions are the central
 * objects of study in complex analysis.<br>
 * <br>
 * 
 * Though the term analytic function is often used interchangeably with
 * "holomorphic function", the word "analytic" is defined in a broader sense to
 * denote any function (real, complex, or of more general type) that can be
 * written as a convergent power series in a neighbourhood of each point in its
 * domain. That all holomorphic functions are complex analytic functions, and
 * vice versa, is a major theorem in complex analysis.<br>
 * <br>
 * 
 * Holomorphic functions are also sometimes referred to as regular
 * functions.[2][3] A holomorphic function whose domain is the whole complex
 * plane is called an entire function. The phrase "holomorphic at a point z0"
 * means not just differentiable at z0, but differentiable everywhere within
 * some neighbourhood of z0 in the complex plane.<br>
 * <br>
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Holomorphic_function">Wikpedia</a>
 */
public interface HolomorphicFunction extends
                                     Function<Complex, Complex>
{

  public static final int glSteps[]   =
  { 1, 2, 4, 6, 8, 12, 16, 22, 32, 46, 64, 90, 128, 182, 256, 362, 512, 724, 1024, 1448, 2048, 2896, 4096, 5792,
    8192, 11586, 16384, 23170, 32768, 46340, 65536, 92682, 131072, 185364, 262144, 370728, 524288, 741456 };

  public static final int glStepCount = glSteps.length;

  /**
   * @return function which returns the absolute value of this function
   */
  public default Function<Complex, Real> abs()
  {
    Function<Complex, Real> function = (z, order, prec, w) ->
    {
      order = max(1, order);
      assert order < 2 : "TODO: implement derivative which returns NaN at 0 and -1 when negative and +1 when positive";
      try ( Complex x = new Complex())
      {
        HolomorphicFunction.this.evaluate(z, order, prec, x);
        if (w.isFinite())
        {
          x.abs(prec, w);
        }
      }
      return w;
    };
    return function;
  }

  public default void accumulateGaussLegendreQuadrature(int relAccuracyGoalBits,
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
      swapElements(depth, as, bs, vs, ms);
      Utilities.heapUp(as, bs, vs, ms, depth);
    }
  }

  public default void accumulateIntegrand(int prec,
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
      swapElements(depth, as, bs, vs, ms);
      Utilities.heapUp(as, bs, vs, ms, depth);
    }
  }

  /**
   * Each linear operator A on a Euclidean vector space defines a (Hermitian)
   * adjoint operator A^* on that space according to the rule <br>
   * <code> 
   *  ⟨ A x , y ⟩ = ⟨ x , A^∗ y ⟩ , 
   * </code> <br>
   * The adjoint may also be called the Hermitian conjugate or simply the
   * Hermitian[1] after Charles Hermite. It is often denoted by A† in fields like
   * physics, especially when used in conjunction with bra–ket notation in quantum
   * mechanics. In finite dimensions (like here where the case of the complex
   * numbers being a pair of real numbers) where operators are represented by
   * matrices, the Hermitian adjoint is given by the <b>conjugate transpose</b>
   * (also known as the Hermitian transpose).
   * 
   * The above definition of an adjoint operator extends verbatim to bounded
   * linear operators on Hilbert spaces H. The definition has been further
   * extended to include unbounded densely defined operators whose domain is
   * topologically dense in—but not necessarily equal to— to whole space H.
   * 
   * @return this(t*) where t*=conj(t) is the complex conjugate transpose
   */
  public default HolomorphicFunction adjoint()
  {
    HolomorphicFunction bump = (z, order, prec, w) ->
    {
      try ( Complex a = z.conj(new Complex());)
      {
        return HolomorphicFunction.this.evaluate(a, order, prec, w);
      }
    };
    return bump;
  }

  public default void bisect(int relAccuracyGoalBits,
                             int prec,
                             Magnitude tmpm,
                             Magnitude newTol,
                             int depth,
                             int top,
                             AtomicLong evalCount,
                             Complex as,
                             Complex bs,
                             Complex vs,
                             Magnitude ms,
                             Magnitude topm)
  {
    /* Bisection. */
    /* Interval [depth] becomes [mid, b]. */
    bs.get(depth).set(bs.get(top));
    as.get(top).add(bs.get(top), prec, as.get(depth));
    acb_mul_2exp_si(as.get(depth), as.get(depth), -1);

    /* Interval [top] becomes [a, mid]. */
    bs.get(top).set(as.get(depth));

    /* Evaluate on [a, mid] */
    simpleQuadrature(as.get(top), bs.get(top), prec, vs.get(top));

    mag_hypot(topm, vs.get(top).getReal().getRad(), vs.get(top).getReal().getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, vs.get(top));
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    /* Evaluate on [mid, b] */
    simpleQuadrature(as.get(depth), bs.get(depth), prec, vs.get(depth));

    mag_hypot(ms.get(depth), vs.get(depth).getReal().getRad(), vs.get(depth).getImag().getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, vs.get(depth));
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    /* Make the interval with the larger error the priority. */
    if (topm.compareTo(ms.get(depth)) < 0)
    {
      as.get(top).swap(as.get(depth));
      bs.get(top).swap(bs.get(depth));
      vs.get(top).swap(vs.get(depth));
      topm.swap(ms.get(depth));
    }
  }

  public default HolomorphicFunction differential() throws NotDifferentiableException
  {
    return new TaylorShift(this);
  }

  /**
   * 
   * @return 1 if this function is invertible with a unique inverse
   */
  public default int getInverseBranchCount()
  {
    return 1;
  }

  public default ImaginaryPart imaginaryPart()
  {
    return new ImaginaryPart(this);
  }

  /**
   * An <b>antiderivative<b>, <b>inverse derivative</b>, <b>primitive
   * function</b>, <b>primitive integral</b> or <b>indefinite integral</b> of a
   * function f is a differentiable function F whose derivative is equal to the
   * original function f. This can be stated symbolically as F' = f.
   * 
   * @return ∫this which should satisfy
   *         this{@link #integral()}{@link #differential()} == this ==
   *         this{@link #differential()}{@link #integral()}
   */
  public default HolomorphicFunction integral() throws NotIntegrableException
  {
    throw new UnsupportedOperationException(getClass() + " needs to implement this method");
  }

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
  public default Complex integrate(Complex a,
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

    if (options == null)
    {
      options = new IntegrationOptions();
    }

    try ( Complex s = new Complex(); Complex t = new Complex(); Complex u = new Complex();
          Magnitude tmpm = new Magnitude(); Magnitude tmpn = new Magnitude(); Magnitude newTol = new Magnitude();)
    {
      int        depthLimit, evalLimit, degLimit;
      int        depth, maxDepth, top;
      long       leafIntervalCount;
      int        allocation;
      boolean    useHeap;
      boolean    gaussLegendreIntegralConverged, verbose, realError;
      AtomicLong evalCount;

      evalCount           = new AtomicLong();
      depthLimit          = options.getDepthLimit(prec);
      evalLimit           = options.getEvaluationLimit(prec);
      relAccuracyBitsGoal = Math.max(relAccuracyBitsGoal, 0);
      degLimit            = options.getDegreeLimit(relAccuracyBitsGoal, prec);
      verbose             = options.verbose;
      useHeap             = options.useHeap;

      if (useHeap)
      {
        throw new UnsupportedOperationException("TODO: needs to be debugged");
      }
      allocation = 4;
      // TODO: take as,bs,vs,ms and put them in their own (static) class
      try ( Complex as = Complex.newVector(2 * allocation); Complex bs = Complex.newVector(2 * allocation);
            Complex vs = Complex.newVector(2 * allocation); Magnitude ms = Magnitude.newVector(2 * allocation);)
      {

        /* Compute initial crude estimate for the whole interval. */
        simpleQuadrature(as.set(a), bs.set(b), prec, vs);
        mag_hypot(ms, vs.getReal().getRad(), vs.getImag().getRad());

        depth = maxDepth = 1;
        evalCount.set(1);
        leafIntervalCount = 0;

        /* Adjust absolute tolerance based on new information. */
        acb_get_mag_lower(tmpm, vs);
        mag_mul_2exp_si(tmpm, tmpm, -relAccuracyBitsGoal);
        mag_max(newTol, absErrorToleranceGoal, tmpm);

        s.zero();

        while (depth >= 1)
        {
          assert evalCount.get() < evalLimit - 1 : "evaluation limit " + evalLimit + " exceeded ";

          if (useHeap)
            top = 0;
          else
            top = depth - 1;

          /* We are done with this subinterval. */
          Magnitude topm = ms.get(top);
          if (topm.compareTo(newTol) < 0 || Utilities.overlaps(u, as.get(top), bs.get(top), prec))
          {
            leafIntervalCount++;
            depth--;
            accumulateIntegrand(prec, s, depth, top, useHeap, as, bs, vs, ms);
            continue;
          }

          /* Attempt using Gauss-Legendre rule. */
          if (vs.get(top).isFinite())
          {
            gaussLegendreIntegralConverged = evaluateGaussLegendreIntegral(as.get(top),
                                                                           bs.get(top),
                                                                           newTol,
                                                                           degLimit,
                                                                           verbose,
                                                                           prec,
                                                                           evalCount,
                                                                           u);

            /* completed subinterval */
            if (gaussLegendreIntegralConverged)
            {
              leafIntervalCount++;
              depth--;

              accumulateGaussLegendreQuadrature(relAccuracyBitsGoal,
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
            resizeVectors(allocation, as, bs, vs, ms);
          }

          bisect(relAccuracyBitsGoal, prec, tmpm, newTol, depth, top, evalCount, as, bs, vs, ms, topm);

          if (useHeap)
          {
            Utilities.heapUp(as, bs, vs, ms, depth);
            Utilities.heapDown(as, bs, vs, ms, depth + 1);
          }

          depth++;
          maxDepth = Math.max(depth, maxDepth);
        }

        if (verbose)
        {
          System.out.format("depth %d/%d, eval %d/%d, %d leaf intervals\n",
                            maxDepth,
                            depthLimit,
                            evalCount.get(),
                            evalLimit,
                            leafIntervalCount);
        }

        res.set(s);
      }
    }

    return res;
  }

  /**
   * get an inverse branch. TODO: how to specify the domain of the n-th branch?
   * 
   * @param branch starting at 0 which is the principal and only branch for
   *               properly invertible functions
   * 
   * @return the n-th branch of the inverse function f^-1(x)={y:f(y)=x}
   */
  public default HolomorphicFunction inverse(int branch)
  {
    throw new UnsupportedOperationException(getClass() + " needs to implement this method");
  }

  /**
   * 
   * @param z
   * @return the multiplicity of the root at the point z, or 0 if there is no root
   *         there
   */
  public default int multiplicityOfRoot(Complex z)
  {
    return 1;
    // throw new UnsupportedOperationException(getClass() + "TODO: return the
    // multiplicity of the root at the point " + z + " here, or throw an exception
    // or something if there isn't a root at the requested point within whatever
    // uncertainty radius is there");
  }

  /**
   * Perform a step of Gauss-Legendre quadrature with automatic degree
   * determination
   * 
   * @param a
   * @param b
   * @param tol
   * @param degreeLimit
   * @param verbose
   * @param prec
   * @param evalCount
   * @param res
   * 
   * @return true of the integral converged, false or a thrown assertion error if
   *         not
   */
  public default boolean evaluateGaussLegendreIntegral(Complex a,
                                                       Complex b,
                                                       Magnitude tol,
                                                       int degreeLimit,
                                                       boolean verbose,
                                                       int prec,
                                                       AtomicLong evalCount,
                                                       Complex res)
  {
    boolean converged = false;
    try ( Complex mid = new Complex(); Complex delta = new Complex(); Complex wide = new Complex();
          Magnitude tmpm = new Magnitude(); Complex s = new Complex(); Complex v = new Complex();
          Magnitude M = new Magnitude(); Magnitude X = new Magnitude(); Magnitude Y = new Magnitude();
          Magnitude rho = new Magnitude(); Magnitude err = new Magnitude(); Magnitude t = new Magnitude();
          Magnitude bestRho = new Magnitude();)
    {
      int k, Xexp;
      int i, n, best_n;

      if (degreeLimit <= 0)
      {
        res.setIndeterminate();
        evalCount.set(0);
        return false;
      }

      /* delta = (b-a)/2 */
      b.sub(a, prec, delta);
      acb_mul_2exp_si(delta, delta, -1);

      /* mid = (a+b)/2 */
      a.add(b, prec, mid);
      acb_mul_2exp_si(mid, mid, -1);

      best_n = -1;
      evalCount.set(0);

      mag_inf(err);

      for (Xexp = 0; Xexp < prec /* && Xexp == 0 */; Xexp += Math.max(1, Xexp))
      {
        mag_one(X);
        mag_mul_2exp_si(X, X, Xexp + 1);

        /* rho = X + √(X^2 - 1) (lower bound) */
        mag_mul_lower(rho, X, X);
        mag_one(t);
        mag_sub_lower(rho, rho, t);
        mag_sqrt_lower(rho, rho);
        mag_add_lower(rho, rho, X);

        /* Y = √(X^2 - 1) (upper bound) */
        mag_mul(Y, X, X);
        mag_one(t);
        mag_sub(Y, Y, t);
        mag_sqrt(Y, Y);

        wide.zero();
        mag_set(wide.getReal().getRad(), X);
        mag_set(wide.getImag().getRad(), Y);

        /* transform to [a,b] */
        wide.mul(delta, prec, wide);
        acb_add(wide, wide, mid, prec);

        evaluate(wide, 1, prec, v);
        evalCount.incrementAndGet();

        /* no dice */
        if (!v.isFinite())
          break;

        /* M = (b-a)/2 |f| */
        acb_get_mag(M, v);
        acb_get_mag(tmpm, delta);
        mag_mul(M, M, tmpm);

        /* Search for the smallest n that gives err < tol (if possible) */
        for (i = 0; i < glStepCount && glSteps[i] <= degreeLimit; i++)
        {
          n = glSteps[i];

          /* (64/15) M / ((rho-1) rho^(2n-1)) */
          mag_pow_ui_lower(t, rho, 2 * n - 1);
          mag_one(tmpm);
          mag_sub_lower(tmpm, rho, tmpm);
          mag_mul_lower(t, t, tmpm);
          mag_mul_ui_lower(t, t, 15);
          mag_div(t, M, t);
          mag_mul_2exp_si(t, t, 6);

          if (mag_cmp(t, tol) < 0)
          {
            converged = true;
            /* The best so far. */
            if (best_n == -1 || n < best_n)
            {
              mag_set(err, t);
              mag_set(bestRho, rho);
              best_n = n;
            }

            /* Best possible n. */
            if (n == 1)
              break;
          }
        }
      }

      /* Evaluate best found Gauss-Legendre quadrature rule. */
      evaluateBestGaussLegendreQuadratureRule(prec, evalCount, res, converged, mid, delta, wide, s, v, err, best_n);
    }

    return converged;
  }

  public default void evaluateBestGaussLegendreQuadratureRule(int prec,
                                                              AtomicLong evalCount,
                                                              Complex res,
                                                              boolean converged,
                                                              Complex mid,
                                                              Complex delta,
                                                              Complex wide,
                                                              Complex s,
                                                              Complex v,
                                                              Magnitude err,
                                                              int best_n)
  {
    int k;
    int i;
    if (converged)
    {
      try ( Real x = new Real(); Real w = new Real();)
      {
        assert best_n != -1;

        for (i = 0; i < glStepCount; i++)
          if (glSteps[i] == best_n)
            break;

        acb_zero(s);

        for (k = 0; k < best_n; k++)
        {
          acb_calc_gl_node(x, w, i, k, prec);
          acb_mul_arb(wide, delta, x, prec);
          acb_add(wide, wide, mid, prec);
          evaluate(wide, 0, prec, v);
          acb_addmul_arb(s, v, w, prec);
        }

        evalCount.getAndAdd(best_n);

        acb_mul(res, s, delta, prec);
        acb_add_error_mag(res, err);

      }
    }
    else
    {
      acb_indeterminate(res);
    }
  }

  public default RealPart realPart()
  {
    return new RealPart(this);
  }

  public default void resizeVectors(int allocation, Complex as, Complex bs, Complex vs, Magnitude ms)
  {
    int k;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (k = allocation; k < allocation; k++)
    {
      acb_init(as.get(k));
      acb_init(bs.get(k));
      acb_init(vs.get(k));
      mag_init(ms.get(k));
    }
  }

  /**
   * Calculate the simple quadrature f([a,b])*(b-a) where
   * f=this{@link #evaluate(Complex, int, int, Complex)} with a single function
   * evaluation
   * 
   * @param a
   * @param b
   * @param prec
   * @param res
   * @return res
   */
  public default Complex simpleQuadrature(Complex a, Complex b, int prec, Complex res)
  {
    try ( Magnitude magδ = new Magnitude(); Complex midpoint = new Complex(); Complex δ = new Complex();
          Complex widePoint = new Complex();)
    {
      /* δ = (b-a)/2 */
      b.sub(a, prec, δ).mul2e(-1, δ);

      /* mid = (a+b)/2 */
      a.add(b, prec, midpoint).mul2e(-1, midpoint);

      /* wide = mid +- [delta] */
      widePoint.set(midpoint);
      arb_get_mag(magδ, δ.getReal());
      widePoint.getReal().addUncertainty(magδ);
      arb_get_mag(magδ, δ.getImag());
      widePoint.getImag().addUncertainty(magδ);

      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      return evaluate(widePoint, 0, prec, res).mul(δ, prec, res).mul2e(-1, res);
    }
  }

  public default void swapElements(int depth, Complex as, Complex bs, Complex vs, Magnitude ms)
  {
    acb_swap(as, as.get(depth));
    acb_swap(bs, bs.get(depth));
    acb_swap(vs, vs.get(depth));
    mag_swap(ms, ms.get(depth));
  }

}