package arb.utensils;

import static arb.IntegerConstants.FLINT_BITS;
import static arb.arblib.*;

import java.util.concurrent.atomic.AtomicLong;

import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;

import arb.*;
import arb.Float;
import arb.RealRootInterval.RefinementResult;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

public class Utensils
{

  public static Real
         add(java.util.function.IntFunction<Real> func, int startInclusive, int stopExclusive, int bits, Real value)
  {
    value.zero();
    for (int i = startInclusive; i < stopExclusive; i++)
    {
      Real y = func.apply(i);
      value.add(y, bits, value);
    }
    return value;

  }

  /**
   * 
   * @param input a string
   * @return a string with the trailing zeros trimmed
   */

  public static String removeTrailingZeros(String input)
  {
    if (input == null || input.length() == 0)
    {
      return input;
    }

    int decimalIndex = input.indexOf('.');
    if (decimalIndex == -1)
    {
      return input;
    }

    int lastIndex = input.length() - 1;
    while (lastIndex > decimalIndex && input.charAt(lastIndex) == '0')
    {
      lastIndex--;
    }

    if (input.charAt(lastIndex) == '.')
    {
      lastIndex--;
    }

    return input.substring(0, lastIndex + 1);
  }

  public static RefinementResult refineRootViaNewtonsMethod(RealFunction f,
                                                            Real root,
                                                            Real convergenceRegion,
                                                            Float convergenceFactor,
                                                            int extraPrec,
                                                            int prec,
                                                            boolean verbose)
  {
    int precs[] = new int[FLINT_BITS];
    int iters, startPrec = root.relAccuracyBits();

    if (verbose)
    {
      System.out.format("The initial accuracy for the root of %s at %s is %d.\n", f, root, startPrec);
    }

    if ((iters = determineNewtonStepScalingPrecisions(convergenceFactor, prec, precs, startPrec)) == -1)
    {
      return RefinementResult.ImpreciseInput;
    }

    if (verbose)
    {
      System.out.format("The root of %s at %s in the convergence region %s where the convegence factor C is %s is about to be refined with %d iterations of the Newton step starting with %d bits of precision and adding %d extra bits of precision at each step  by scaling the goal precision of %d bits accordingly\n",
                        f,
                        root,
                        convergenceRegion.get(0),
                        convergenceFactor,
                        iters,
                        startPrec,
                        extraPrec,
                        prec);
    }

    return calculateNewtonSteps(f, root, convergenceRegion, convergenceFactor, extraPrec, verbose, precs, iters);
  }

  public static RefinementResult calculateNewtonSteps(RealFunction f,
                                                      Real root,
                                                      Real convergenceRegion,
                                                      Float convergenceFactor,
                                                      int extraPrec,
                                                      boolean verbose,
                                                      int[] precs,
                                                      int iters)
  {
    int i;
    int workingPrecision;
    for (i = iters - 1; i >= 0; i--)
    {
      workingPrecision = precs[i] + extraPrec;

      if (verbose)
      {
        System.out.printf("Newton step: workingPrecision = %03d + %03d = %03d      r=%s digits=%s\n",
                          precs[i],
                          extraPrec,
                          workingPrecision,
                          root.toString(root.digits()),
                          root.digits());
      }

      if (!f.calculateNewtonStep(root, convergenceRegion, convergenceFactor, workingPrecision, root))
      {
        return RefinementResult.NoConvergence;
      }
    }

    return RefinementResult.Success;

  }

  public static int
         determineNewtonStepScalingPrecisions(Float convergenceFactor, int prec, int[] precs, int startPrec)
  {
    int iters;
    int padding = Math.max(0, Math.min(arblib.arf_abs_bound_lt_2exp_si(convergenceFactor), prec) + 5);
    precs[0] = prec + padding;
    iters    = 1;
    while ((iters < FLINT_BITS) && (precs[iters - 1] + padding > 2 * startPrec))
    {
      precs[iters] = (precs[iters - 1] / 2) + padding;
      iters++;

      if (iters == FLINT_BITS)
      {
        return -1;
      }
    }
    return iters;
  }

  public static boolean computeNewtonStep(RealFunction f,
                                          Real point,
                                          Real convergenceRegion,
                                          Float convergenceFactor,
                                          int prec,
                                          Real nextPoint)
  {
    try ( Magnitude err = new Magnitude(); Magnitude v = new Magnitude(); Real t = new Real();
          Real u = Real.newVector(2))
    {
      Magnitude xRadius = point.getRad();
      xRadius.pow(2, err);
      convergenceFactor.getMagnitude(v).mul(err, err);

      t.setMid(point.getMid());
      t.getRad().zero();

      f.evaluate(t, 2, prec, u).div(u.get(1), prec, u);

      t.sub(u, prec, u);
      Magnitude uRadius = u.getRad();
      uRadius.add(err, uRadius);

      if (convergenceRegion.contains(u) && uRadius.compareTo(xRadius) < 0)
      {
        nextPoint.get(0).swap(u);
        return true;
      }
      else
      {
        nextPoint.get(0).set(point);
        return false;
      }
    }
  }

  public static Complex calculateSimpleQuadrature(ComplexFunction f, Complex a, Complex b, int prec, Complex res)
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
      Complex result = f.evaluate(widePoint, 0, prec, res).mul(δ, prec, res).mul2e(-1, res);
      assert result.isFinite() : String.format("f(%s)=%s\n", widePoint, result);
      return result;
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
          Magnitude tmpm = new Magnitude(); Complex s = new Complex(); Complex v = new Complex();
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
        Complex x = wide.mul(δ, bits).add(mid, bits);
        f.evaluate(x, 1, bits, v);
        evalCount.incrementAndGet();

        /* no dice */
        if (!v.isFinite())
          break;

        /* M = (b-a)/2 |f| */
        acb_get_mag(M, v);
        acb_get_mag(tmpm, δ);
        mag_mul(M, M, tmpm);

        /* Search for the smallest n that gives err < tol (if possible) */
        for (i = 0; i < Utensils.glStepCount && Utensils.glSteps[i] <= degreeLimit; i++)
        {
          n = glSteps[i];

          /* (64/15) M / ((ρ-1) ρ^(2n-1)) */
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
      evaluateBestGaussLegendreQuadratureRule(f, bits, evalCount, res, converged, mid, δ, wide, s, v, err, best_n);
    }
    return converged;
  }

  public static void resizeVectors(int allocation, Complex as, Complex bs, Complex vs, Magnitude ms)
  {
    int k;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (k = allocation; k < allocation; k++)
    {
      as.get(k).init();
      bs.get(k).init();
      vs.get(k).init();
      ms.get(k).init();
    }
  }

  public static final int glSteps[]   =
  { 1, 2, 4, 6, 8, 12, 16, 22, 32, 46, 64, 90, 128, 182, 256, 362, 512, 724, 1024, 1448, 2048, 2896, 4096, 5792,
    8192, 11586, 16384, 23170, 32768, 46340, 65536, 92682, 131072, 185364, 262144, 370728, 524288, 741456 };

  public static final int glStepCount = glSteps.length;

  public static void evaluateBestGaussLegendreQuadratureRule(ComplexFunction f,
                                                             int prec,
                                                             AtomicLong evalCount,
                                                             Complex res,
                                                             boolean converged,
                                                             Complex mid,
                                                             Complex δ,
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
      try ( Real x = Real.newVector(2))
      {
        Real w = x.get(1);
        assert best_n != -1;

        for (i = 0; i < glStepCount; i++)
          if (glSteps[i] == best_n)
            break;

        s.zero();

        for (k = 0; k < best_n; k++)
        {
          acb_calc_gl_node(x, w, i, k, prec);
          f.evaluate(δ.mul(x, prec, wide).add(mid, prec, wide), 0, prec, v);
          acb_addmul_arb(s, v, x.get(1), prec);
        }

        evalCount.getAndAdd(best_n);

        acb_add_error_mag(s.mul(δ, prec, res), err);

      }
    }
    else
    {
      res.setIndeterminate();
    }
  }

  public static void swapElements(Complex as, Complex bs, Complex vs, Magnitude ms, int depth)
  {
    as.swap(as.get(depth));
    bs.swap(bs.get(depth));
    vs.swap(vs.get(depth));
    ms.swap(ms.get(depth));
  }

  public static void swapElements(Real as, Real bs, Complex vs, Magnitude ms, int depth)
  {
    as.swap(as.get(depth));
    bs.swap(bs.get(depth));
    vs.swap(vs.get(depth));
    ms.swap(ms.get(depth));
  }

  public static void resizeRegisters(int allocation, Real as, Real bs, Complex vs, Magnitude ms)
  {
    int k = allocation;
    allocation *= 2;
    as.resize(allocation);
    bs.resize(allocation);
    vs.resize(allocation);
    ms.resize(allocation);
    for (; k < allocation; k++)
    {
      arb_init(as.get(k));
      arb_init(bs.get(k));
      acb_init(vs.get(k));
      mag_init(ms.get(k));
    }
  }

  public static TeXIcon renderFormula(String latex)
  {
    return renderFormula(latex, 16);
  }

  public static TeXIcon renderFormula(String latex, int size)
  {
    TeXFormula formula       = new TeXFormula(latex);
    TeXIcon    spreadFormula = formula.new TeXIconBuilder().setStyle(TeXConstants.STYLE_DISPLAY)
                                                           .setSize(size)
                                                           .setWidth(TeXConstants.UNIT_PIXEL,
                                                                     350f,
                                                                     TeXConstants.ALIGN_RIGHT)
                                                           .setIsMaxWidth(true)
                                                           .setInterLineSpacing(TeXConstants.UNIT_PIXEL, 20f)
                                                           .build();

    return spreadFormula;
  }

  /**
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
  public static void heapUp(Real as, Real bs, Complex vs, Magnitude ms, int n)
  {
    int i, max, l, r;
    i = 0;
    for (;;)
    {
      max = i;
      l   = 2 * i + 1;
      r   = 2 * i + 2;
      if (l < n && ms.get(l).compareTo(ms.get(max)) > 0)
        max = l;
      if (r < n && ms.get(r).compareTo(ms.get(max)) > 0)
        max = r;
      if (max != i)
      {
        as.swap(i, max);
        bs.swap(i, max);
        vs.swap(i, max);
        ms.swap(i, max);

        i = max;
      }
      else
      {
        break;
      }
    }
  }

  /**
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
  public static void heapUp(Complex as, Complex bs, Complex vs, Magnitude ms, int n)
  {
    int i, max, l, r;
    i = 0;
    for (;;)
    {
      max = i;
      l   = 2 * i + 1;
      r   = 2 * i + 2;
      if (l < n && ms.get(l).compareTo(ms.get(max)) > 0)
        max = l;
      if (r < n && ms.get(r).compareTo(ms.get(max)) > 0)
        max = r;
      if (max != i)
      {
        as.swap(i, max);
        bs.swap(i, max);
        vs.swap(i, max);
        ms.swap(i, max);
        i = max;
      }
      else
      {
        break;
      }
    }
  }

  /**
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
  public static void heapDown(Complex as, Complex bs, Complex vs, Magnitude ms, int n)
  {
    int k = n - 1;
    int j = (k - 1) / 2;

    while (k > 0 && ms.get(j).compareTo(ms.get(k)) < 0)
    {
      as.swap(j, k);
      bs.swap(j, k);
      vs.swap(j, k);
      ms.swap(j, k);
      k = j;
      j = (j - 1) / 2;
    }
  }

  /**
   * A version of {@link Real#overlaps(Real)} used by the integration code which
   * is less accurate by design
   * 
   * @param tmp
   * @param a
   * @param b
   * @param prec
   * @return
   */
  public static boolean overlaps(Real tmp, Real a, Real b, int prec)
  {
    arb_sub(tmp, a, b, prec);
    return arb_contains_zero(tmp) != 0;
  }

  /**
   * A version of {@link Complex#overlaps(Complex)} used by the integration code
   * which is less accurate by design
   * 
   * @param tmp
   * @param a
   * @param b
   * @param prec
   * @return
   */
  public static boolean overlaps(Complex tmp, Complex a, Complex b, int prec)
  {
    acb_sub(tmp, a, b, prec);
    return acb_contains_zero(tmp) != 0;
  }

  /**
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
  @Deprecated(forRemoval = true)
  public static void heapDown(Real as, Real bs, Complex vs, Magnitude ms, int n)
  {
    int k = n - 1;
    int j = (k - 1) / 2;

    while (k > 0 && ms.get(j).compareTo(ms.get(k)) < 0)
    {
      as.swap(j, k);
      bs.swap(j, k);
      vs.swap(j, k);
      ms.swap(j, k);
      k = j;
      j = (j - 1) / 2;
    }
  }

  public static void println(Object s)
  {
    System.out.println(s);
  }

  public static int calculatePartition(RealFunction realFunction,
                                       FloatInterval left,
                                       FloatInterval right,
                                       FloatInterval block,
                                       int prec,
                                       boolean verbose)
  {
    try ( Real t = new Real(); Real m = new Real(); Float u = new Float();)
    {

      /* Compute the midpoint */
      arblib.arf_add(u, block.getA(), block.getB(), java.lang.Integer.MAX_VALUE, IntegerConstants.ARF_RND_DOWN);
      u.half(u);

      /* Evaluate the function at the midpoint so the sign can be returned */
      int sign = realFunction.evaluate(m.set(u), 1, prec, t).sign();

      /* split the interval at the midpoint */
      left.setA(block.getA());
      left.setB(u);
      right.setA(u);
      right.setB(block.getB());

      if (verbose)
      {
        println(String.format("calculatePartition: u=%s sign=%s\n left=%s\n right=%s\n", u, sign, left, right));
      }

      return sign;
    }
  }

  public static RealMatrix newBivariateCorrelationMatrix(Real ρ)
  {
    var correlation = RealMatrix.newMatrix(2, 2);
    correlation.get(0, 0).set(correlation.get(1, 1).one());
    correlation.get(1, 0).set(correlation.get(0, 1).set(ρ));
    return correlation;
  }

}
