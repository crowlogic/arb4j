package arb.functions;

import static arb.arblib.*;
import static arb.utensils.Utensils.println;
import static java.lang.String.format;

import java.util.concurrent.atomic.AtomicLong;

import arb.Complex;
import arb.Magnitude;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotDifferentiableException;
import arb.functions.real.RealFunction;
import arb.utensils.IntegrationTools;
import arb.utensils.Utensils;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealToComplexFunction extends
                                       Function<Real, Complex>
{
  public default RealFunction realPart()
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
        RealToComplexFunction.this.evaluate(z, order + 1, prec, x);
        return w.slice(0, order).set(x.slice(1, order + 1));
      }
    };
  }

  public default RealFunction imagPart()
  {
    return new ImaginaryPart(this);
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
  public default Complex calculateSimpleQuadrature(Real a, Real b, int prec, Complex res, boolean verbose)
  {
    try ( Magnitude magδ = new Magnitude(); Real midpoint = new Real(); Real δ = new Real();
          Real widePoint = new Real();)
    {
      /* δ = (b-a)/2 */
      b.get(0).sub(a.get(0), prec, δ).mul2e(-1);

      /* mid = (a+b)/2 */
      a.get(0).add(b.get(0), prec, midpoint).mul2e(-1, widePoint);

      /* wide = mid +- [delta] */
      arb_get_mag(magδ, δ);
      widePoint.addUncertainty(magδ);

      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      evaluate(widePoint, 0, prec, res).mul(δ, prec).mul2e(-1);
      if (verbose)
      {
        widePoint.printPrecision = true;
        res.printPrecision       = true;
        println(format("f[%s]=%s\n", widePoint, res.get(0)));
      }
      return res;
    }
  }

  public default void bisect(int relAccuracyGoalBits,
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
    b.get(depth).set(b.get(top));
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

    Magnitude vtopRealRad = vtop.getReal().getRad();
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

    mag_hypot(m.get(depth), vdepth.getReal().getRad(), vdepth.getImag().getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpm, v.get(depth));
    mag_mul_2exp_si(tmpm, tmpm, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpm);

    /* Make the interval with the larger error the priority. */
    if (topm.compareTo(m.get(depth)) < 0)
    {
      a.get(top).swap(a.get(depth));
      b.get(top).swap(b.get(depth));
      v.get(top).swap(v.get(depth));
      topm.swap(m.get(depth));
    }
  }

  public default boolean calculateGaussLegendreIntegral(Real a,
                                                        Real b,
                                                        Magnitude tol,
                                                        int degreeLimit,
                                                        boolean verbose,
                                                        int prec,
                                                        AtomicLong evalCount,
                                                        Complex value)
  {
    boolean converged = false;
    try ( Real y = new Real(); Real δ = new Real(); Real wide = new Real(); Magnitude τ = new Magnitude();
          Complex s = new Complex(); Complex v = new Complex(); Magnitude M = new Magnitude();
          Magnitude X = new Magnitude(); Magnitude Y = new Magnitude(); Magnitude ρ = new Magnitude();
          Magnitude err = new Magnitude(); Magnitude t = new Magnitude(); Magnitude bestρ = new Magnitude();)
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
          println(format("f[%s]=%s+i%s\n", wide.doubleValue(), v.getReal().doubleValue(), v.getImag().doubleValue()));
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
        for (i = 0; i < Utensils.glStepCount && IntegrationTools.glSteps[i] <= degreeLimit; i++)
        {
          n = IntegrationTools.glSteps[i];

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
        try ( Real x = new Real(); Real w = new Real();)
        {
          assert bestn != -1;

          for (i = 0; i < Utensils.glStepCount; i++)
            if (IntegrationTools.glSteps[i] == bestn)
              break;

          s.zero();

          for (k = 0; k < bestn; k++)
          {
            acb_calc_gl_node(x, w, i, k, prec);
            δ.mul(x, prec, wide).add(y, prec);

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
