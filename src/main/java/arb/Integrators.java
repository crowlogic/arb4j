package arb;

import static arb.arblib.*;

import java.util.concurrent.atomic.AtomicLong;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;
import arb.utensils.IntegrationTools;
import arb.utensils.Utensils;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Integrators
{

  /**
   * Performs a bisection operation on a given interval of a holomorphic function,
   * refining the integration by dividing the interval into two subintervals and
   * evaluating the function on each subinterval using simple quadrature.
   * 
   * @param f                   The holomorphic function to be bisected.
   * @param relAccuracyGoalBits The desired relative accuracy in bits.
   * @param prec                The precision to be used in calculations.
   * @param tmpMag              Temporary magnitude used for calculations.
   * @param newTol              New tolerance magnitude updated during the
   *                            bisection.
   * @param depth               The current depth of bisection.
   * @param top                 The top element in the interval stack.
   * @param evalCount           An AtomicLong counter for function evaluations.
   * @param left                Complex array storing the left endpoints of
   *                            intervals.
   * @param right               Complex array storing the right endpoints of
   *                            intervals.
   * @param values              Complex array storing function values.
   * @param errors              Magnitude array storing error magnitudes.
   * @param topErrors           Magnitude array storing the top error magnitudes.
   */
  public static void bisect(ComplexFunction f,
                            int relAccuracyGoalBits,
                            int prec,
                            Magnitude tmpMag,
                            Magnitude newTol,
                            int depth,
                            int top,
                            AtomicLong evalCount,
                            Complex left,
                            Complex right,
                            Complex values,
                            Magnitude errors,
                            Magnitude topErrors)
  {

    right.get(depth).set(right.get(top)).set(left.get(top).add(right.get(top), prec, left.get(depth)).mul2e(-1));

    /* Evaluate on [a, mid] */
    Complex topVal = values.get(top);
    f.simpleQuadrature(left.get(top), right.get(top), prec, topVal);

    mag_hypot(topErrors, topVal.getReal().getRad(), topVal.getImag().getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpMag, topVal);
    mag_mul_2exp_si(tmpMag, tmpMag, -relAccuracyGoalBits);
    newTol.max(tmpMag);

    /* Evaluate on [mid, b] */
    Complex val = values.get(depth);
    f.simpleQuadrature(left.get(depth), right.get(depth), prec, val);

    Magnitude error = errors.get(depth);
    mag_hypot(error, val.getReal().getRad(), val.getImag().getRad());
    evalCount.incrementAndGet();
    /* Adjust absolute tolerance based on new information. */
    acb_get_mag_lower(tmpMag, val);
    mag_mul_2exp_si(tmpMag, tmpMag, -relAccuracyGoalBits);
    mag_max(newTol, newTol, tmpMag);

    /* Make the interval with the larger error the priority. */
    if (topErrors.compareTo(error) < 0)
    {
      left.swap(top, depth);
      right.swap(top, depth);
      topVal.swap(val);
      topErrors.swap(error);
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
      IntegrationTools.swapElements(as, bs, vs, ms, depth);
      IntegrationTools.heapUp(as, bs, vs, ms, depth);
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
      IntegrationTools.swapElements(as, bs, vs, ms, depth);
      IntegrationTools.heapUp(as, bs, vs, ms, depth);
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
      IntegrationTools.swapElements(as, bs, vs, ms, depth);
      IntegrationTools.heapUp(as, bs, vs, ms, depth);
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
      IntegrationTools.swapElements(as, bs, vs, ms, depth);
      IntegrationTools.heapUp(as, bs, vs, ms, depth);
    }
  }

  public static boolean evaluateGaussLegendreIntegral(ComplexFunction f,
                                                      Complex a,
                                                      Complex b,
                                                      Magnitude tol,
                                                      int degreeLimit,
                                                      int bits,
                                                      AtomicLong evalCount,
                                                      Complex res)
  {
    boolean converged = false;
    try ( Complex mid = new Complex(); Complex δ = new Complex(); Complex wide = new Complex();
          Magnitude m = new Magnitude(); Complex s = new Complex(); Complex v = new Complex();
          Magnitude M = new Magnitude(); Magnitude X = new Magnitude(); Magnitude Y = new Magnitude();
          Magnitude rho = new Magnitude(); Magnitude err = new Magnitude(); Magnitude t = new Magnitude();
          Magnitude bestRho = new Magnitude();)
    {
      int Xexp;
      int i, n, best_n;

      if (degreeLimit <= 0)
      {
        res.setIndeterminate();
        evalCount.set(0);
        return false;
      }

      /* delta = (b-a)/2 */
      b.sub(a, bits, δ).mul2e(-1);

      /* mid = (a+b)/2 */
      a.add(b, bits, mid).mul2e(-1);

      best_n = -1;
      evalCount.set(0);

      mag_inf(err);

      for (Xexp = 0; Xexp < bits /* && Xexp == 0 */; Xexp += Math.max(1, Xexp))
      {
        X.one();
        mag_mul_2exp_si(X, X, Xexp + 1);

        /* rho = X + √(X^2 - 1) (lower bound) */
        mag_mul_lower(rho, X, X);
        t.one();
        mag_sub_lower(rho, rho, t);
        mag_sqrt_lower(rho, rho);
        mag_add_lower(rho, rho, X);

        /* Y = √(X^2 - 1) (upper bound) */
        X.mul(X, Y).sub(t.one()).sqrt();

        wide.zero();
        wide.getReal().getRad().set(X);
        wide.getImag().getRad().set(Y);

        /* transform to [a,b] */
        Complex x = wide.mul(δ, bits).add(mid, bits);
        f.evaluate(x, 1, bits, v);
        evalCount.incrementAndGet();

        /* no dice */
        if (!v.isFinite())
          break;

        /* M = (b-a)/2 |f| */
        v.absUpperBound(M);
        δ.absUpperBound(m);

        M.mul(m);

        /* Search for the smallest n that gives err < tol (if possible) */
        for (i = 0; i < Utensils.glStepCount && IntegrationTools.glSteps[i] <= degreeLimit; i++)
        {
          n = IntegrationTools.glSteps[i];

          /* (64/15) M / ((ρ-1) ρ^(2n-1)) */
          mag_pow_ui_lower(t, rho, 2 * n - 1);
          m.one();
          mag_sub_lower(m, rho, m);
          mag_mul_lower(t, t, m);
          mag_mul_ui_lower(t, t, 15);
          M.div(t, t);
          mag_mul_2exp_si(t, t, 6);

          if (t.compareTo(tol) < 0)
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
      IntegrationTools.evaluateBestGaussLegendreQuadratureRule(f,
                                                               bits,
                                                               evalCount,
                                                               res,
                                                               converged,
                                                               mid,
                                                               δ,
                                                               wide,
                                                               s,
                                                               v,
                                                               err,
                                                               best_n);
    }
    return converged;
  }

}
