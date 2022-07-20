package arb.functions;

import static arb.arb.*;
import static arb.utensils.Utils.println;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.concurrent.atomic.AtomicLong;

import arb.*;
import arb.exceptions.LackOfConvergenceException;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealPart;
import arb.utensils.Utils;

public interface RealToComplexFunction extends
                                       Function<Real, Complex>
{
  public class Complexification implements
                                ComplexFunction
  {
    public Complexification(RealToComplexFunction func)
    {
      this.func = func;
    }

    RealToComplexFunction func;

    @Override
    public Complex evaluate(Complex t, int order, int prec, Complex res)
    {
      assert t.getImag().isZero() : "the underlying function accepts real-valued variableExpressions only";
      return func.evaluate(t.getReal(), order, prec, res);
    }

  }

  public default Complexification complexify()
  {
    return new Complexification(this);
  }

  public default RealPart realPart()
  {
    return new RealPart(this);
  }

  public default RealToComplexFunction differential() throws NotDifferentiableException
  {
    return (z, order, prec, w) ->
    {
      order = Math.max(1, order);
      assert w.size() >= order;
      try ( Complex x = Complex.newVector(order + 1))
      {
        return w.set(RealToComplexFunction.this.evaluate(z, order + 1, prec, x).slice(1, order + 1));
      }
    };
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
      swapElements(depth, as, bs, vs, ms);
      Utils.heap_up(as, bs, vs, ms, depth);
    }
  }

  public default Complex integrate(Real a,
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

    try ( Complex s = new Complex(); Complex t = new Complex(); Real u = new Real(); Complex u2 = new Complex();
          Magnitude tmpm = new Magnitude(); Magnitude tmpn = new Magnitude(); Magnitude newTol = new Magnitude();)
    {
      int        depthLimit, evalLimit, degLimit;
      int        depth, maxDepth, top;
      long       leafIntervalCount;
      int        allocation;
      boolean    useHeap;
      boolean    glStatus, verbose, realError;
      AtomicLong evalCount;

      evalCount           = new AtomicLong();
      depthLimit          = options.getDepthLimit(prec);
      evalLimit           = options.getEvaluationLimit(prec);
      relAccuracyGoalBits = Math.max(relAccuracyGoalBits, 0);
      degLimit            = options.getDegreeLimit(relAccuracyGoalBits, prec);
      verbose             = options.verbose;
      useHeap             = options.useHeap;

//      if (useHeap)
//      {
//        throw new UnsupportedOperationException("TODO: needs to be debugged");
//      }
      allocation          = 4;
      // TODO: take as,bs,vs,ms and put them in their own (static) class
      try ( Real as = Real.newVector(2 * allocation); Real bs = Real.newVector(2 * allocation);
            Complex vs = Complex.newVector(2 * allocation); Magnitude ms = Magnitude.newVector(2 * allocation);)
      {

        /* Compute initial crude estimate for the whole interval. */
        as.set(a);
        bs.set(b);
        simpleQuadrature(as, bs, prec, vs, verbose);
        mag_hypot(ms, vs.getReal().getRad(), vs.getImag().getRad());

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
          if (evalCount.get() >= evalLimit - 1)
          {
            throw new LackOfConvergenceException("evaluating limit " + evalLimit + " exceeded ");
          }

          if (useHeap)
            top = 0;
          else
            top = depth - 1;

          /* We are done with this subinterval. */
          Magnitude topm = ms.get(top);
          if (topm.compareTo(newTol) < 0 || Utils.overlaps(u, as.get(top), bs.get(top), prec))
          {
            leafIntervalCount++;
            depth--;
            accumulateIntegrand(prec, s, depth, top, useHeap, as, bs, vs, ms);
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
                                                              evalCount,
                                                              u2);

            /* We are done with this subinterval. */
            if (glStatus)
            {
              leafIntervalCount++;
              depth--;

              accumulateGaussLegendreQuadrature(relAccuracyGoalBits,
                                                prec,
                                                s,
                                                u2,
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

          if (depth >= depthLimit - 1)
          {

            throw new LackOfConvergenceException("depth limit " + evalLimit + " exceeded ");
          }

          if (depth >= allocation - 1)
          {
            allocation *= 2;
            resizeRegisters(allocation, as, bs, vs, ms);
          }

          bisect(relAccuracyGoalBits, prec, tmpm, newTol, depth, top, evalCount, as, bs, vs, ms, topm, verbose);

          if (useHeap)
          {
            Utils.heap_up(as, bs, vs, ms, depth);
            Utils.heap_down(as, bs, vs, ms, depth + 1);
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

        acb_set(res, s);
      }
    }

    return res;
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
   * @param verbose
   * @return res
   */
  public default Complex simpleQuadrature(Real a, Real b, int prec, Complex res, boolean verbose)
  {
    try ( Magnitude magδ = new Magnitude(); Real midpoint = new Real(); Real δ = new Real();
          Real widePoint = new Real();)
    {
      /* δ = (b-a)/2 */
      b.sub(a, prec, δ).mul2e(-1, δ);

      /* mid = (a+b)/2 */
      a.add(b, prec, midpoint).mul2e(-1, midpoint);

      /* wide = mid +- [delta] */
      widePoint.set(midpoint);
      arb_get_mag(magδ, δ);
      widePoint.addUncertainty(magδ);

      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      evaluate(widePoint, 0, prec, res).mul(δ, prec, res).mul2e(-1, res);
      if (verbose)
      {
        widePoint.printPrecision = true;
        res.printPrecision       = true;
        println(format("f[%s]=%s\n", widePoint, res));
      }
      return res;
    }
  }

  public default void resizeRegisters(int allocation, Real as, Real bs, Complex vs, Magnitude ms)
  {
    int k;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (k = allocation; k < allocation; k++)
    {
      arb_init(as.get(k));
      arb_init(bs.get(k));
      acb_init(vs.get(k));
      mag_init(ms.get(k));
    }
  }

  public default void bisect(int relAccuracyGoalBits,
                             int prec,
                             Magnitude tmpm,
                             Magnitude newTol,
                             int depth,
                             int top,
                             AtomicLong evalCount,
                             Real as,
                             Real bs,
                             Complex vs,
                             Magnitude ms,
                             Magnitude topm,
                             boolean verbose)
  {
    /* Bisection. */
    /* Interval [depth] becomes [mid, b]. */
    bs.get(depth).set(bs.get(top));
    as.get(top).add(bs.get(top), prec, as.get(depth));
    arb_mul_2exp_si(as.get(depth), as.get(depth), -1);

    /* Interval [top] becomes [a, mid]. */
    bs.get(top).set(as.get(depth));

    /* Evaluate on [a, mid] */
    simpleQuadrature(as.get(top), bs.get(top), prec, vs.get(top), verbose);

    mag_hypot(topm, vs.get(top).getReal().getRad(), vs.get(top).getReal().getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, vs.get(top));
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    /* Evaluate on [mid, b] */
    simpleQuadrature(as.get(depth), bs.get(depth), prec, vs.get(depth), verbose);

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

  public default boolean performGaussLegendreIntegrationAutoDeg(Real a,
                                                                Real b,
                                                                Magnitude tol,
                                                                int degreeLimit,
                                                                boolean verbose,
                                                                int prec,
                                                                AtomicLong evalCount,
                                                                Complex res)
  {
    boolean converged = false;
    try ( Real mid = new Real(); Real delta = new Real(); Real wide = new Real(); Magnitude tmpm = new Magnitude();
          Complex s = new Complex(); Complex v = new Complex(); Magnitude M = new Magnitude();
          Magnitude X = new Magnitude(); Magnitude Y = new Magnitude(); Magnitude rho = new Magnitude();
          Magnitude err = new Magnitude(); Magnitude t = new Magnitude(); Magnitude bestRho = new Magnitude();)
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
      arb_mul_2exp_si(delta, delta, -1);

      /* mid = (a+b)/2 */
      a.add(b, prec, mid);
      arb_mul_2exp_si(mid, mid, -1);

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

        wide.zero();
        mag_set(wide.getRad(), Y);
        // mag_add_lower(wide.getRad(), wide.getRad(), rho);

        /* transform to [a,b] */
        wide.mul(delta, prec, wide);
        arb_add(wide, wide, mid, prec);

        evaluate(wide, 1, prec, v);
        if (verbose)
        {
          wide.printPrecision = true;
          v.printPrecision    = true;
          println(format("f[%s]=%s\n", wide, v));
        }
        evalCount.incrementAndGet();

        /* no chance */
        if (!v.isFinite())
          break;

        /* M = (b-a)/2 |f| */
        acb_get_mag(M, v);
        arb_get_mag(tmpm, delta);
        mag_mul(M, M, tmpm);

        /* Search for the smallest n that gives err < tol (if possible) */
        for (i = 0; i < ComplexFunction.glStepCount && ComplexFunction.glSteps[i] <= degreeLimit; i++)
        {
          n = ComplexFunction.glSteps[i];

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

          for (i = 0; i < ComplexFunction.glStepCount; i++)
            if (ComplexFunction.glSteps[i] == best_n)
              break;

          acb_zero(s);

          for (k = 0; k < best_n; k++)
          {
            acb_calc_gl_node(x, w, i, k, prec);
            arb_mul(wide, delta, x, prec);
            arb_add(wide, wide, mid, prec);
            if (verbose)
            {
              println(format("f[%s]=%s\n", wide, v));
            }
            evaluate(wide, 0, prec, v);
            acb_addmul_arb(s, v, w, prec);
          }

          evalCount.getAndAdd(best_n);

          acb_mul_arb(res, s, delta, prec);
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

  public default void swapElements(int depth, Real as, Real bs, Complex vs, Magnitude ms)
  {
    arb_swap(as, as.get(depth));
    arb_swap(bs, bs.get(depth));
    acb_swap(vs, vs.get(depth));
    mag_swap(ms, ms.get(depth));
  }

  public default void accumulateIntegrand(int prec,
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
      swapElements(depth, as, bs, vs, ms);
      Utils.heap_up(as, bs, vs, ms, depth);
    }
  }

}
