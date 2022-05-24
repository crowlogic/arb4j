package arb;

import static arb.arblib.*;
import static arb.functions.Functions.overlaps;
import static java.lang.Math.max;

import java.util.concurrent.atomic.AtomicLong;

import arb.exceptions.NotDifferentiableException;
import arb.exceptions.NotIntegrableException;

/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
public interface ComplexFunction
{

  Complex evaluate(Complex z, int order, int prec, Complex w);

  /**
   * 
   * @return a function which, when differentiated, produces this function as a
   *         differential. It should satisfy
   *         this{@link #integral()}{@link #differential()} == this ==
   *         this{@link #differential()}{@link #integral()}
   */
  public default ComplexFunction integral() throws NotIntegrableException
  {
    throw new UnsupportedOperationException(getClass() + " needs to implement this method");
  }

  /**
   * 
   * @return a ComplexFunction which is the derivative of this one obtained by
   *         calling evaluate with an order of one plus that requested via
   *         this{@link #evaluate(Complex, int, int, Complex)} then returning a
   *         slice of the result.
   */
  public default ComplexFunction differential() throws NotDifferentiableException
  {
    return (z, order, prec, w) ->
    {
      assert order > 0;
      assert w.size() >= order;
      try ( Complex x = Complex.newVector(order + 1))
      {
        ComplexFunction.this.evaluate(z, order + 1, prec, x);
        Complex xslice = x.slice(1, order + 1);
        return w.set(xslice);
      }
    };
  }

  /**
   * 
   * @return 1 if this function is invertible with a unique inverse
   */
  public default int getInverseBranchCount()
  {
    return 1;
  }

  /**
   * get an inverse branch. TODO: how to specify the domain of the n-th branch?
   * 
   * @param branch starting at 0 which is the principal and only branch for
   *               properly invertible functions
   * 
   * @return the n-th branch of the inverse function f^-1(x)={y:f(y)=x}
   */
  public default ComplexFunction inverse(int branch)
  {
    throw new UnsupportedOperationException(getClass() + " needs to implement this method");
  }

  public static final int glSteps[]   =
  { 1, 2, 4, 6, 8, 12, 16, 22, 32, 46, 64, 90, 128, 182, 256, 362, 512, 724, 1024, 1448, 2048, 2896, 4096, 5792,
    8192, 11586, 16384, 23170, 32768, 46340, 65536, 92682, 131072, 185364, 262144, 370728, 524288, 741456 };

  public static final int glStepCount = glSteps.length;

  /**
   * Calculate the simple quadrature f([a,b])*(b-a) where
   * f=this{@link #evaluate(Complex, int, int, Complex)} with 1 function
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
    try ( Complex mid = new Complex(); Complex δ = new Complex(); Complex wide = new Complex();)
    {
      /* δ = (b-a)/2 */
      b.sub(a, prec, δ).mul2e(-1, δ);

      /* mid = (a+b)/2 */
      a.add(b, prec, mid).mul2e(-1, mid);

      /* wide = mid +- [delta] */
      wide.set(mid);
      arb_add_error_mag(wide.getReal(), δ.getReal().getRad());
      arb_add_error_mag(wide.getImag(), δ.getImag().getRad());

      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      return evaluate(wide, 0, prec, res).mul(δ, prec, res).mul2e(-1, res);
    }
  }

  public static enum ConvergenceStatus
  {
   Converged,
   Diverged
  };

  /**
   * Computes a rigorous enclosure of the integral int(f(t),t=a..b) following a
   * line-segment between the complex numbers a and b. For finite results, a & b
   * must be finite and f must be bounded on the integration path. To compute
   * improper integrals, the path of integration should be manually truncated or a
   * regularizing change of variables made if possible.
   * 
   * By default, this function will be evaluated as the integrand and
   * this{@link #evaluate(Complex, int, int, Complex)} will only be called with
   * order = 0 or order = 1; that is, derivatives are not required.
   * 
   * this{@link #evaluate(Complex, int, int, Complex)} will be called with order =
   * 0 to evaluate this function normally on the integration path (either at a
   * single point or on a subinterval). In this case, this function is treated as
   * a pointwise defined function and can have arbitrary discontinuities.
   * 
   * this{@link #evaluate(Complex, int, int, Complex)} will be called with order =
   * 1 to evaluate this function on a domain surrounding a segment of the
   * integration path for the purpose of bounding the error of a quadrature
   * formula. In this case, this{@link #evaluate(Complex, int, int, Complex)} must
   * verify that this function is holomorphic on the line between a and b (and
   * output a non-finite value if it is not).
   * 
   * The integration algorithm combines direct interval enclosures, Gauss-Legendre
   * quadrature where this function is holomorphic, and adaptive subdivision. This
   * strategy supports integrands with discontinuities while providing exponential
   * convergence for typical piecewise holomorphic integrands.
   * 
   * <b> For typical usage, set rel_goal = prec and abs_tol = 2^(-prec). It
   * usually only makes sense to have rel_goal between 0 and prec. </b>
   * 
   * The algorithm attempts to achieve an error of max(ε[abs],M*ε[rel]) on each
   * subinterval, where M is the magnitude of the integral. These parameters are
   * only guidelines; the cumulative error may be larger than both the prescribed
   * absolute and relative error goals, depending on the number of subdivisions,
   * cancellation between segments of the integral, and numerical errors in the
   * evaluation of the integrand.
   * 
   * To compute tiny integrals with high relative accuracy, one should set
   * ε[abs]~=M*ε[rel] where M is a known estimate of the magnitude. Setting ε[abs]
   * to 0 is also allowed, forcing use of a relative instead of an absolute
   * tolerance goal. This can be handy for exponentially small or large functions
   * of unknown magnitude. <b>It is recommended to avoid setting ε[abs] very small
   * if possible since the algorithm might need many extra subdivisions to
   * estimate M automatically<b>; if the approximate magnitude can be estimated by
   * some external means (for example if a midpoint-width or endpoint-width
   * estimate is known to be accurate), providing an appropriate ε[abs]~=M*ε[rel]
   * will be more efficient.
   * 
   * If the integral has very large magnitude, setting the absolute tolerance to a
   * corresponding large value is recommended for best performance, but it is not
   * necessary for convergence since the absolute tolerance is increased
   * automatically during the execution of the algorithm if the partial integrals
   * are found to have larger error.
   * 
   * Additional options for the integration can be provided via the options
   * parameter (documented below). To use all defaults, NULL can be passed for
   * options.
   * 
   * @param a
   * 
   * @param b
   * 
   * @param relAccuracyGoalBits   relative accuracy goal as a nonnegative number
   *                              of bits, i.e. target a relative error less than
   *                              ε[rel=]2^(-relAccuracyGoalBits)
   * 
   * @param absErrorToleranceGoal absolute accuracy goal as a {@link Magnitude}
   *                              describing the error tolerance, i.e. target an
   *                              absolute error less than
   *                              ε[abs]=absErrorToleranceGoal
   * @param options
   * @param prec
   * @param res
   * @return true if the integration converged to the target accuracy on all
   *         subintervals otherwise returns false
   */
  public default ConvergenceStatus integrate(Complex a,
                                             Complex b,
                                             int relAccuracyGoalBits,
                                             Magnitude absErrorToleranceGoal,
                                             IntegrationOptions options,
                                             int prec,
                                             Complex res)
  {
    ConvergenceStatus status;

    if (options == null)
    {
      options = new IntegrationOptions();
    }

    try ( Complex s = new Complex(); Complex t = new Complex(); Complex u = new Complex();
          Magnitude tmpm = new Magnitude(); Magnitude tmpn = new Magnitude(); Magnitude newTol = new Magnitude();)
    {
      int        depthLimit, evalLimit, degLimit;
      AtomicLong eval = new AtomicLong();
      int        depth, maxDepth, top;
      long       leafIntervalCount;
      int        alloc;
      boolean    useHeap, stopping;

      boolean    glStatus, verbose, realError;

      status     = ConvergenceStatus.Converged;

      depthLimit = options.depthLimit;
      if (depthLimit <= 0)
        depthLimit = 2 * prec;
      depthLimit = Math.max(depthLimit, 1);

      evalLimit  = options.evalLimit;
      if (evalLimit <= 0)
        evalLimit = 1000 * prec + prec * prec;
      evalLimit           = Math.max(evalLimit, 1);

      relAccuracyGoalBits = Math.max(relAccuracyGoalBits, 0);
      degLimit            = options.degLimit;
      if (degLimit <= 0)
        degLimit = (int) (0.5 * Math.min(relAccuracyGoalBits, prec) + 60);

      verbose = options.verbose;
      useHeap = options.useHeap;

      alloc   = 4;
      try ( Complex as = Complex.newVector(alloc); Complex bs = Complex.newVector(alloc);
            Complex vs = Complex.newVector(alloc); Magnitude ms = Magnitude.newVector(alloc);)
      {

        /* Compute initial crude estimate for the whole interval. */
        acb_set(as, a);
        acb_set(bs, b);
        simpleQuadrature(as, bs, prec, vs);
        mag_hypot(ms, vs.getReal().getRad(), vs.getImag().getRad());

        depth = maxDepth = 1;
        eval.set(1);
        stopping          = false;
        leafIntervalCount = 0;

        /* Adjust absolute tolerance based on new information. */
        acb_get_mag_lower(tmpm, vs);
        mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
        mag_max(newTol, absErrorToleranceGoal, tmpm);

        acb_zero(s);

        while (depth >= 1)
        {
          if (!stopping && eval.get() >= evalLimit - 1)
          {
            if (verbose)
              System.out.printf("stopping at eval_limit %wd\n", evalLimit);
            status   = ConvergenceStatus.Diverged;
            stopping = true;
            continue;
          }

          if (useHeap)
            top = 0;
          else
            top = depth - 1;

          /* We are done with this subinterval. */
          Magnitude topm = ms.get(top);
          if (topm.compareTo(newTol) < 0 || overlaps(u, as.get(top), bs.get(top), prec) || stopping)
          {
            s.add(vs.get(top), prec, s);
            leafIntervalCount++;

            depth--;
            if (useHeap && depth > 0)
            {
              acb_swap(as, as.get(depth));
              acb_swap(bs, bs.get(depth));
              acb_swap(vs, vs.get(depth));
              mag_swap(ms, ms.get(depth));
              heap_up(as, bs, vs, ms, depth);
            }
            continue;
          }

          /* Attempt using Gauss-Legendre rule. */
          if (vs.get(top).isFinite())
          {
            glStatus = performGaussLegendreIntegrationAutoDeg(as.get(top),
                                                              bs.get(top),
                                                              newTol,
                                                              degLimit,
                                                              verbose,
                                                              prec,
                                                              eval,
                                                              u);

            /* We are done with this subinterval. */
            if (glStatus)
            {
              /* We know that the result is real. */
              realError = vs.get(top).isFinite() && vs.get(top).isReal();

              if (realError)
              {
                arb_zero(u.getImag());
              }

              s.add(u, prec, s);
              leafIntervalCount++;

              /* Adjust absolute tolerance based on new information. */
              acb_get_mag_lower(tmpm, u);
              mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
              mag_max(newTol, newTol, tmpm);

              depth--;
              if (useHeap && depth > 0)
              {
                acb_swap(as, as.get(depth));
                acb_swap(bs, bs.get(depth));
                acb_swap(vs, vs.get(depth));
                mag_swap(ms, ms.get(depth));
                heap_up(as, bs, vs, ms, depth);
              }
              continue;
            }
          }

          if (depth >= depthLimit - 1)
          {
            if (verbose)
            {
              System.out.format("stopping at depth_limit %wd\n", depthLimit);
            }
            status   = ConvergenceStatus.Diverged;
            stopping = true;
            continue;
          }

          if (depth >= alloc - 1)
          {
            int k;
            as.resize(alloc);
            bs.resize(alloc);
            vs.resize(alloc);
            ms.resize(alloc);
            for (k = alloc; k < 2 * alloc; k++)
            {
              acb_init(as.get(k));
              acb_init(bs.get(k));
              acb_init(vs.get(k));
              mag_init(ms.get(k));
            }
            alloc *= 2;
          }

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
          eval.incrementAndGet();
          /* Adjust absolute tolerance based on new information. */
          acb_get_mag_lower(tmpm, vs.get(top));
          mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
          mag_max(newTol, newTol, tmpm);

          /* Evaluate on [mid, b] */
          simpleQuadrature(as.get(depth), bs.get(depth), prec, vs.get(depth));
          mag_hypot(ms.get(depth), vs.get(depth).getReal().getRad(), vs.get(depth).getImag().getRad());
          eval.incrementAndGet();
          /* Adjust absolute tolerance based on new information. */
          acb_get_mag_lower(tmpm, vs.get(depth));
          mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
          mag_max(newTol, newTol, tmpm);

          /* Make the interval with the larger error the priority. */
          if (mag_cmp(topm, ms.get(depth)) < 0)
          {
            acb_swap(as.get(top), as.get(depth));
            acb_swap(bs.get(top), bs.get(depth));
            acb_swap(vs.get(top), vs.get(depth));
            mag_swap(topm, ms.get(depth));
          }

          if (useHeap)
          {
            heap_up(as, bs, vs, ms, depth);
            heap_down(as, bs, vs, ms, depth + 1);
          }

          depth++;
          maxDepth = Math.max(depth, maxDepth);
        }

        if (verbose)
        {
          System.out.format("depth %d/%d, eval %d/%d, %d leaf intervals\n",
                            maxDepth,
                            depthLimit,
                            eval.get(),
                            evalLimit,
                            leafIntervalCount);
        }

        acb_set(res, s);
      }
    }

    return status;
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
   * @return
   */
  public default boolean performGaussLegendreIntegrationAutoDeg(Complex a,
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

        /* rho = X + sqrt(X^2 - 1) (lower bound) */
        mag_mul_lower(rho, X, X);
        mag_one(t);
        mag_sub_lower(rho, rho, t);
        mag_sqrt_lower(rho, rho);
        mag_add_lower(rho, rho, X);

        /* Y = sqrt(X^2 - 1) (upper bound) */
        mag_mul(Y, X, X);
        mag_one(t);
        mag_sub(Y, Y, t);
        mag_sqrt(Y, Y);

        acb_zero(wide);
        mag_set(wide.getReal().getRad(), X);
        mag_set(wide.getImag().getRad(), Y);

        /* transform to [a,b] */
        acb_mul(wide, wide, delta, prec);
        acb_add(wide, wide, mid, prec);

        evaluate(wide, 1, prec, v);
        evalCount.incrementAndGet();

        /* no chance */
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

    return converged;
  }

  /**
   * @return function which returns the absolute value of this function
   */
  public default ComplexFunction abs()
  {
    return (z, order, prec, w) ->
    {
      order = max(1, order);
      assert order < 2 : "TODO: implement derivative which returns NaN at 0 and -1 when negative and +1 when positive";
      try ( Complex y = new Complex())
      {
        ComplexFunction.this.evaluate(y, order, prec, w).abs(prec, w.getReal());
        w.getImag().zero();
        return w;
      }
    };
  }

}