package arblib;

import static arblib.arblib.*;

import java.util.concurrent.atomic.AtomicLong;

/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j
 * 
 * Arb4j is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License (LGPL) as published by the
 * Free Software Foundation; either version 2.1 of the License, or (at your
 * option) any later version. See <http://www.gnu.org/licenses/>.
 */
public interface ComplexFunction
{

  Complex evaluate(Complex z, int order, int prec, Complex w);

  public static final int glStepCount = 38;

  public static final int glSteps[]   =
  { 1, 2, 4, 6, 8, 12, 16, 22, 32, 46, 64, 90, 128, 182, 256, 362, 512, 724, 1024, 1448, 2048, 2896, 4096, 5792,
    8192, 11586, 16384, 23170, 32768, 46340, 65536, 92682, 131072, 185364, 262144, 370728, 524288, 741456 };

  public default void quadSimple(Complex res, Complex a, Complex b, int prec)
  {
    try ( Complex mid = new Complex(); Complex delta = new Complex(); Complex wide = new Complex();
          Magnitude tmpm = new Magnitude();)
    {
      /* delta = (b-a)/2 */
      acb_sub(delta, b, a, prec);
      acb_mul_2exp_si(delta, delta, -1);

      /* mid = (a+b)/2 */
      acb_add(mid, a, b, prec);
      acb_mul_2exp_si(mid, mid, -1);

      /* wide = mid +- [delta] */
      acb_set(wide, mid);
      arb_get_mag(tmpm, delta.getReal());
      arb_add_error_mag(wide.getReal(), tmpm);
      arb_get_mag(tmpm, delta.getReal());
      arb_add_error_mag(wide.getReal(), tmpm);

      /* Direct evaluation: integral = (b-a) * f([a,b]). */
      evaluate(wide, 0, prec, res);
      acb_mul(res, res, delta, prec);
      acb_mul_2exp_si(res, res, 1);
    }
  }

  public default boolean performGaussLegendreIntegrationWithAutomaticDegreeDetermination(Complex res,
                                                                                         AtomicLong evalCount,
                                                                                         Complex a,
                                                                                         Complex b,
                                                                                         Magnitude tol,
                                                                                         int deg_limit,
                                                                                         int verbose,
                                                                                         int prec)
  {
    Complex   mid       = null, delta = null, wide = null;
    Magnitude tmpm      = null;
    boolean   converged = false;
    Complex   s         = null, v = null;
    Magnitude M         = null, X = null, Y = null, rho = null, err = null, t = null, best_rho = null;
    int       k, Xexp;
    int       i, n, best_n;

    if (deg_limit <= 0)
    {
      acb_indeterminate(res);
      evalCount.set(0);
      return false;
    }

    acb_init(mid);
    acb_init(delta);
    acb_init(wide);
    mag_init(tmpm);

    /* delta = (b-a)/2 */
    acb_sub(delta, b, a, prec);
    acb_mul_2exp_si(delta, delta, -1);

    /* mid = (a+b)/2 */
    acb_add(mid, a, b, prec);
    acb_mul_2exp_si(mid, mid, -1);

    acb_init(s);
    acb_init(v);
    mag_init(M);
    mag_init(X);
    mag_init(Y);
    mag_init(rho);
    mag_init(t);
    mag_init(err);
    mag_init(best_rho);

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
      for (i = 0; i < glStepCount && glSteps[i] <= deg_limit; i++)
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
            mag_set(best_rho, rho);
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

    acb_clear(s);
    acb_clear(v);
    mag_clear(M);
    mag_clear(X);
    mag_clear(Y);
    mag_clear(rho);
    mag_clear(t);
    mag_clear(err);
    mag_clear(best_rho);

    acb_clear(mid);
    acb_clear(delta);
    acb_clear(wide);
    mag_clear(tmpm);

    return true;
  }

}