package arb.functions;

import static arb.arblib.acb_add_error_mag;
import static arb.arblib.acb_addmul_arb;
import static arb.arblib.acb_calc_gl_node;
import static arb.arblib.acb_get_mag;
import static arb.arblib.acb_get_mag_lower;
import static arb.arblib.acb_set;
import static arb.arblib.arb_add;
import static arb.arblib.arb_get_mag;
import static arb.arblib.arb_mul_2exp_si;
import static arb.arblib.mag_add_lower;
import static arb.arblib.mag_div;
import static arb.arblib.mag_hypot;
import static arb.arblib.mag_inf;
import static arb.arblib.mag_max;
import static arb.arblib.mag_mul;
import static arb.arblib.mag_mul_2exp_si;
import static arb.arblib.mag_mul_lower;
import static arb.arblib.mag_mul_ui_lower;
import static arb.arblib.mag_one;
import static arb.arblib.mag_pow_ui_lower;
import static arb.arblib.mag_set;
import static arb.arblib.mag_sqrt;
import static arb.arblib.mag_sqrt_lower;
import static arb.arblib.mag_sub;
import static arb.arblib.mag_sub_lower;
import static arb.utensils.Utensils.println;
import static java.lang.String.format;

import java.util.concurrent.atomic.AtomicLong;

import arb.Complex;
import arb.IntegrationOptions;
import arb.Integrators;
import arb.Magnitude;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotDifferentiableException;
import arb.functions.real.RealFunction;
import arb.utensils.Utensils;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealToComplexFunction extends
                                       Function<Real, Complex>
{
  public default RealFunction
         realPart()
  {
    return new RealPart(this);
  }

  public default RealToComplexFunction
         differential() throws NotDifferentiableException
  {
    return (z,
            order,
            prec,
            w) ->
    {
      order = Math.max(1, order);
      assert w.size() >= order;
      try ( Complex x = Complex.newVector(order + 1))
      {
        RealToComplexFunction.this.evaluate(z, order + 1, prec, x);
        return w.slice(0, order)
                .set(x.slice(1, order + 1));
      }
    };
  }

  public default RealFunction
         imagPart()
  {
    return new ImaginaryPart(this);
  }

  /**
   * Computes the definite integral of a function over a given interval using
   * adaptive Gauss-Kronrod quadrature. The method adapts the step size and order
   * of the quadrature rule to obtain an estimate of the integral that satisfies
   * the user-specified relative accuracy goal or absolute error tolerance goal.
   * If the goal is not achieved, the interval is bisected and the method recurses
   * on the subintervals. The recursion continues until the desired accuracy goal
   * is met, the maximum recursion depth is reached, or the evaluation limit is
   * exceeded.
   * 
   * @param a                     the lower limit of integration
   * @param b                     the upper limit of integration
   * @param relAccuracyGoalBits   the relative accuracy goal in bits
   * @param absErrorToleranceGoal the absolute error tolerance goal
   * @param options               the options controlling the behavior of the
   *                              quadrature rule
   * @param prec                  the working precision in bits
   * @param res                   the object in which to store the result
   * @return the integral of the function over the interval
   * @throws IllegalArgumentException         if relAccuracyGoalBits is not
   *                                          positive, absErrorToleranceGoal is
   *                                          null, or res is null
   * @throws EvaluationLimitExceededException if the maximum number of evaluations
   *                                          is exceeded
   */
  public default Complex
         integrate(Real a,
                   Real b,
                   int relAccuracyGoalBits,
                   Magnitude absErrorToleranceGoal,
                   IntegrationOptions options,
                   int prec,
                   Complex res)
  {
    assert relAccuracyGoalBits > 0;
    assert absErrorToleranceGoal != null;
    assert res != null;

    if (options == null)
    {
      options = new IntegrationOptions();
    }

    try ( Complex s = new Complex();
          Complex t = new Complex();
          Real u = new Real();
          Complex u2 = new Complex();
          Magnitude tmpm = new Magnitude();
          Magnitude tmpn = new Magnitude();
          Magnitude newTol = new Magnitude();)
    {
      int        depthLimit, evalLimit, degLimit, depth, maxDepth, top, allocation;
      long       leafIntervalCount;
      boolean    useHeap, glStatus, verbose;
      AtomicLong evalCount;

      evalCount           = new AtomicLong();
      depthLimit          = options.getDepthLimit(prec);
      evalLimit           = options.getEvaluationLimit(prec);
      relAccuracyGoalBits = Math.max(relAccuracyGoalBits, 0);
      degLimit            = options.getDegreeLimit(relAccuracyGoalBits, prec);
      verbose             = options.verbose;
      useHeap             = options.useHeap;

      allocation          = 4;
      // TODO: take as,bs,vs,ms and put them in their own (static) class
      try ( Real as = Real.newVector(2 * allocation, "as");
            Real bs = Real.newVector(2 * allocation, "bs");
            Complex vs = Complex.newVector(2 * allocation, "vs");
            Magnitude ms = Magnitude.newVector(2 * allocation, "ms");)
      {

        /* Compute initial crude estimate for the whole interval. */
        as.get(0)
          .set(a);
        bs.get(0)
          .set(b);
        calculateSimpleQuadrature(as, bs, prec, vs, verbose);
        mag_hypot(ms, vs.getReal()
                        .getRad(), vs.getImag()
                                     .getRad());

        depth = maxDepth = 1;
        evalCount.set(1);
        leafIntervalCount = 0;

        /* Adjust absolute tolerance based on new information. */
        acb_get_mag_lower(tmpm, vs);
        mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
        mag_max(newTol, absErrorToleranceGoal, tmpm);

        s.zero();

        while (depth >= 1)
        {
          assert evalCount.get() < evalLimit - 1 : "evaluating limit " + evalLimit + " exceeded ";

          if (useHeap)
            top = 0;
          else
            top = depth - 1;

          /* We are done with this subinterval. */
          Magnitude topm = ms.get(top);
          if (topm.compareTo(newTol) < 0 || Utensils.overlaps(u, as.get(top), bs.get(top), prec))
          {
            leafIntervalCount++;
            depth--;
            Integrators.accumulateIntegrand(prec, s, depth, top, useHeap, as, bs, vs, ms);
            continue;
          }

          /* Attempt using Gauss-Legendre rule. */
          if (vs.get(top)
                .isFinite())
          {
            glStatus = calculateGaussLegendreIntegral(as.get(top), bs.get(top), newTol, degLimit, verbose, prec, evalCount, u2);

            /* We are done with this subinterval. */
            if (glStatus)
            {
              leafIntervalCount++;
              depth--;

              Integrators.accumulateGaussLegendreQuadrature(relAccuracyGoalBits, prec, s, u2, tmpm, newTol, depth, top, useHeap, as, bs, vs, ms);
              continue;
            }
          }

          assert depth < depthLimit - 1 : "depth limit " + evalLimit + " exceeded ";

          if (depth >= allocation - 1)
          {
            allocation *= 2;
            Utensils.resizeRegisters(allocation, as, bs, vs, ms);
          }

          bisect(relAccuracyGoalBits, prec, tmpm, newTol, depth, top, evalCount, as, bs, vs, ms, topm, verbose);

          if (useHeap)
          {
            Utensils.heapUp(as, bs, vs, ms, depth);
            Utensils.heapDown(as, bs, vs, ms, depth + 1);
          }

          depth++;
          maxDepth = Math.max(depth, maxDepth);
        }

        if (verbose)
        {
          System.out.format("depth %d/%d, eval %d/%d, %d leaf intervals\n", maxDepth, depthLimit, evalCount.get(), evalLimit, leafIntervalCount);
        }

        acb_set(res, s);
      }
    }

    return res;
  }

  /**
   * Calculate the simple quadrature f([a,b])*(b-a) where with a single function
   * evaluation
   * 
   * @param a
   * @param b
   * @param prec
   * @param res
   * @param verbose
   * @return res
   */
  public default Complex
         calculateSimpleQuadrature(Real a,
                                   Real b,
                                   int prec,
                                   Complex res,
                                   boolean verbose)
  {
    try ( Magnitude magδ = new Magnitude();
          Real midpoint = new Real();
          Real δ = new Real();
          Real widePoint = new Real();)
    {
      /* δ = (b-a)/2 */
      b.get(0)
       .sub(a.get(0), prec, δ)
       .mul2e(-1);

      /* mid = (a+b)/2 */
      a.get(0)
       .add(b.get(0), prec, midpoint)
       .mul2e(-1, widePoint);

      /* wide = mid +- [delta] */
      arb_get_mag(magδ, δ);
      widePoint.addUncertainty(magδ);

      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      evaluate(widePoint, 0, prec, res).mul(δ, prec)
                                       .mul2e(-1);
      if (verbose)
      {
        widePoint.printPrecision = true;
        res.printPrecision       = true;
        println(format("f[%s]=%s\n", widePoint, res.get(0)));
      }
      return res;
    }
  }

  public default void
         bisect(int relAccuracyGoalBits,
                int prec,
                Magnitude tmpm,
                Magnitude newTol,
                int depth,
                int top,
                AtomicLong evalCount,
                Real a,
                Real b,
                Complex v,
                Magnitude m,
                Magnitude topm,
                boolean verbose)
  {
    /* Bisection. */
    /* Interval [depth] becomes [mid, b]. */
    b.get(depth)
     .set(b.get(top));
    Real atop   = a.get(top);
    Real btop   = b.get(top);
    Real adepth = a.get(depth);
    atop.add(btop, prec, adepth);
    arb_mul_2exp_si(a.get(depth), a.get(depth), -1);

    /* Interval [top] becomes [a, mid]. */
    btop.set(adepth);

    /* Evaluate on [a, mid] */
    Complex vtop = v.get(top);
    calculateSimpleQuadrature(atop, btop, prec, vtop, verbose);

    Magnitude vtopRealRad = vtop.getReal()
                                .getRad();
    mag_hypot(topm, vtopRealRad, vtopRealRad);
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, vtop);
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    /* Evaluate on [mid, b] */
    Real    bdepth = b.get(depth);
    Complex vdepth = v.get(depth);
    calculateSimpleQuadrature(adepth, bdepth, prec, vdepth, verbose);

    mag_hypot(m.get(depth), vdepth.getReal()
                                  .getRad(), vdepth.getImag()
                                                   .getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, v.get(depth));
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    /* Make the interval with the larger error the priority. */
    if (topm.compareTo(m.get(depth)) < 0)
    {
      a.get(top)
       .swap(a.get(depth));
      b.get(top)
       .swap(b.get(depth));
      v.get(top)
       .swap(v.get(depth));
      topm.swap(m.get(depth));
    }
  }

  public default boolean
         calculateGaussLegendreIntegral(Real a,
                                        Real b,
                                        Magnitude tol,
                                        int degreeLimit,
                                        boolean verbose,
                                        int prec,
                                        AtomicLong evalCount,
                                        Complex value)
  {
    boolean converged = false;
    try ( Real y = new Real();
          Real δ = new Real();
          Real wide = new Real();
          Magnitude τ = new Magnitude();
          Complex s = new Complex();
          Complex v = new Complex();
          Magnitude M = new Magnitude();
          Magnitude X = new Magnitude();
          Magnitude Y = new Magnitude();
          Magnitude ρ = new Magnitude();
          Magnitude err = new Magnitude();
          Magnitude t = new Magnitude();
          Magnitude bestρ = new Magnitude();)
    {
      int k, Xexp;
      int i, n;

      if (degreeLimit <= 0)
      {
        value.setIndeterminate();
        evalCount.set(0);
        return false;
      }

      /* delta = (b-a)/2 */
      b.sub(a, prec, δ);
      arb_mul_2exp_si(δ, δ, -1);

      /* mid = (a+b)/2 */
      a.add(b, prec, y);
      arb_mul_2exp_si(y, y, -1);

      evalCount.set(0);

      mag_inf(err);

      int bestn = -1;

      for (Xexp = 0; Xexp < prec /* && Xexp == 0 */; Xexp += Math.max(1, Xexp))
      {
        mag_one(X);
        mag_mul_2exp_si(X, X, Xexp + 1);

        /* rho = X + sqrt(X^2 - 1) (lower bound) */
        mag_mul_lower(ρ, X, X);
        mag_one(t);
        mag_sub_lower(ρ, ρ, t);
        mag_sqrt_lower(ρ, ρ);
        mag_add_lower(ρ, ρ, X);

        /* Y = sqrt(X^2 - 1) (upper bound) */
        mag_mul(Y, X, X);
        mag_one(t);
        mag_sub(Y, Y, t);
        mag_sqrt(Y, Y);

        wide.zero();
        mag_set(wide.getRad(), Y);
        // mag_add_lower(wide.getRad(), wide.getRad(), rho);

        /* transform to [a,b] */
        wide.mul(δ, prec, wide);
        arb_add(wide, wide, y, prec);

        evaluate(wide, 1, prec, v);
        if (verbose)
        {
          wide.printPrecision = true;
          v.printPrecision    = true;
          println(format("f[%s]=%s+i%s\n", wide.doubleValue(), v.getReal()
                                                                .doubleValue(), v.getImag()
                                                                                 .doubleValue()));
        }
        evalCount.incrementAndGet();

        /* no chance */
        if (!v.isFinite())
          break;

        /* M = (b-a)/2 |f| */
        acb_get_mag(M, v);
        arb_get_mag(τ, δ);
        mag_mul(M, M, τ);

        /* Search for the smallest n that gives err < tol (if possible) */
        for (i = 0; i < Utensils.glStepCount && Utensils.glSteps[i] <= degreeLimit; i++)
        {
          n = Utensils.glSteps[i];

          /* (64/15) M / ((ρ-1) ρ^(2n-1)) */
          mag_pow_ui_lower(t, ρ, 2 * n - 1);
          mag_one(τ);
          mag_sub_lower(τ, ρ, τ);
          mag_mul_lower(t, t, τ);
          mag_mul_ui_lower(t, t, 15);
          mag_div(t, M, t);
          mag_mul_2exp_si(t, t, 6);

          if (t.compareTo(tol) < 0)
          {
            converged = true;
            if (bestn == -1 || n < bestn)
            {
              err.set(t);
              bestρ.set(ρ);
              bestn = n;
            }

            if (n == 1)
              break;
          }
        }
      }

      /* Evaluate best found Gauss-Legendre quadrature rule. */
      if (converged)
      {
        try ( Real x = new Real();
              Real w = new Real();)
        {
          assert bestn != -1;

          for (i = 0; i < Utensils.glStepCount; i++)
            if (Utensils.glSteps[i] == bestn)
              break;

          s.zero();

          for (k = 0; k < bestn; k++)
          {
            acb_calc_gl_node(x, w, i, k, prec);
            δ.mul(x, prec, wide)
             .add(y, prec);

            acb_addmul_arb(s, evaluate(wide, 0, prec, v), w, prec);

            if (verbose)
            {
              println(format("f[%s]=%s\n", wide, v));
            }
          }

          evalCount.getAndAdd(bestn);

          acb_add_error_mag(s.mul(δ, prec, value), err);

        }
      }
      else
      {
        value.setIndeterminate();
      }
    }

    return converged;
  }

}
