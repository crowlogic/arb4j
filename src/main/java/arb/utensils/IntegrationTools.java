package arb.utensils;

import static arb.arblib.acb_add_error_mag;
import static arb.arblib.acb_calc_gl_node;
import static arb.arblib.acb_init;
import static arb.arblib.arb_init;
import static arb.arblib.mag_init;

import java.util.concurrent.atomic.AtomicLong;

import arb.Complex;
import arb.Magnitude;
import arb.Real;
import arb.functions.complex.ComplexFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegrationTools
{

  public static Complex calculateSimpleQuadrature(ComplexFunction f, Complex a, Complex b, int prec, Complex res)
  {
    try ( Complex midpoint = new Complex(); Complex δ = new Complex(); Complex widePoint = new Complex();)
    {
      /* δ = (b-a)/2 */
      b.sub(a, prec, δ).mul2e(-1);
  
      /* mid = (a+b)/2 */
      a.add(b, prec, midpoint).mul2e(-1);
  
      /* wide = mid +- [δ] */
      widePoint.set(midpoint).addUncertainty(δ);
  
      /* Direct evaluation: integral = f([a,b]) * (b-a) */
      Complex result = f.evaluate(widePoint, 0, prec, res).mul(δ, prec, res).mul2e(-1);
      assert result.isFinite() : String.format("f(%s)=%s\n", widePoint, result);
      return result;
    }
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

  public static void evaluateBestGaussLegendreQuadratureRule(ComplexFunction f,
                                                             int bits,
                                                             AtomicLong evalCount,
                                                             Complex res,
                                                             boolean converged,
                                                             Complex mid,
                                                             Complex δ,
                                                             Complex widePoint,
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
  
        for (i = 0; i < Utensils.glStepCount; i++)
          if (Utensils.glSteps[i] == best_n)
            break;
  
        s.zero();
  
        for (k = 0; k < best_n; k++)
        {
          acb_calc_gl_node(x, w, i, k, bits);
          δ.mul(x, bits, widePoint).add(mid, bits);
          f.evaluate(widePoint, 0, bits, v);
          v.addmul(x.get(1), bits, s);
        }
  
        evalCount.getAndAdd(best_n);
  
        acb_add_error_mag(s.mul(δ, bits, res), err);
  
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
   * 
   * @param as
   * @param bs
   * @param vs
   * @param ms
   * @param n
   */
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

}
