package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Self-consistency tests for the Müntz–Padé fractional-Riccati solver
 * (issue #86). An <em>exact-to-arbitrary-bits</em> solver is validated not by
 * matching a finite-precision external reference, but by (a) satisfying its own
 * defining equation and (b) being precision-stable. Both are checked here
 * against the Müntz coefficient sequence {@code a} exposed by
 * {@link RoughHestonCharacteristicFunction}.
 *
 * <p>
 * The solver's compiled recurrence (1-indexed) is
 *
 * <pre>
 *   a(1)(v) = p(v)/Γ(μ+1)
 *   a(k)(v) = Γ((k−1)μ+1)/Γ(kμ+1) · ( q(v)·a(k−1)(v)
 *                                     + r(v)·Σ_{j=1..k−2} a(j)(v)·a(k−1−j)(v) )
 * </pre>
 *
 * with the rough-Heston coefficients {@code p(v)=½(−v²−ⅈv)},
 * {@code q(v)=λ(ⅈvρν−1)}, {@code r=½(λν)²}.
 *
 * <p>
 * Absolute values of a₁,a₂,a₃ are pinned to scipy-verified references in
 * {@link RoughHestonOrthogonalPolynomialSequenceTest} (m(k)=a(k+1)); the
 * recurrence-residual test below propagates that guarantee to higher order.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonMuntzPadeSolverConsistencyTest extends
                                                      TestCase
{
  /** Evaluate the Müntz coefficient a_k(v) at a real point v. */
  private static Complex evalA(RoughHestonCharacteristicFunction cf, int k, double v, int bits, Complex out)
  {
    try (Integer kk = new Integer(); Complex z = new Complex())
    {
      kk.set(k);
      ComplexPolynomial poly = cf.a.evaluate(kk, 1, bits, null);
      z.set(v, 0.0);
      return poly.evaluate(z, 1, bits, out);
    }
  }

  /**
   * The fractional-Riccati residual at the coefficient level. For k=2…7 at
   * v∈{0.5,1.0} the right-hand side of the recurrence is recomputed
   * independently (Γ-ratios via {@link Real#gamma(int)}, the convolution and
   * q/r terms via {@link Complex} arithmetic, parameters taken by identity from
   * the live CF) and {@code |a(k) − RHS|} is asserted below 2^-90. The k=1
   * anchor a(1)=p(v)/Γ(μ+1) is checked separately. No external reference.
   */
  public void testMuntzRiccatiRecurrenceResidual()
  {
    final int    bits = 256;
    final int    K    = 7;

    try (RoughHestonCharacteristicFunction cf = new RoughHestonCharacteristicFunction();
         Real     thr  = new Real();
         Real     vR   = new Real();
         Real     qRe  = new Real();
         Real     qIm  = new Real();
         Real     ln   = new Real();
         Real     r    = new Real();
         Real     gMu1 = new Real();
         Real     num  = new Real();
         Real     den  = new Real();
         Real     gam  = new Real();
         Real     mag  = new Real();
         Complex  p    = new Complex();
         Complex  q    = new Complex();
         Complex  a1ex = new Complex();
         Complex  conv = new Complex();
         Complex  prod = new Complex();
         Complex  qa   = new Complex();
         Complex  rconv= new Complex();
         Complex  inner= new Complex();
         Complex  rhs  = new Complex();
         Complex  resid= new Complex())
    {
      thr.one().mul2e(-90);

      Real λ = cf.λ, ν = cf.ν, ρ = cf.ρ, μ = cf.μ; // identity references

      // r = ½(λν)²  (real, v-independent)
      λ.mul(ν, bits, ln);
      ln.mul(ln, bits, r);
      r.mul2e(-1);

      // Γ(μ+1)
      μ.add(1, bits, gMu1);
      gMu1.gamma(bits);

      for (double v : new double[] { 0.5, 1.0 })
      {
        vR.set(Double.toString(v), bits);

        // p(v) = (−v²/2, −v/2)  (exact for real v)
        p.set(-v * v / 2.0, -v / 2.0);

        // q(v) = (−λ, λ·ρ·ν·v)
        λ.neg(qRe);
        λ.mul(ρ, bits, qIm);
        qIm.mul(ν, bits, qIm);
        qIm.mul(vR, bits, qIm);
        q.set(qRe, qIm);

        // collect a(1..K)
        Complex[] a = new Complex[K + 1];
        for (int k = 1; k <= K; k++)
        {
          a[k] = new Complex();
          evalA(cf, k, v, bits, a[k]);
        }

        // k=1 anchor: a(1) == p / Γ(μ+1)
        p.div(gMu1, bits, a1ex);
        a[1].sub(a1ex, bits, resid);
        resid.abs(bits, mag);
        assertTrue("a(1) anchor residual at v=" + v + " is " + mag + " (≥ 2^-90)",
                   mag.compareTo(thr) < 0);

        // k=2..K: full recurrence residual
        for (int k = 2; k <= K; k++)
        {
          μ.mul(k - 1, bits, num);
          num.add(1, bits, num);
          num.gamma(bits);
          μ.mul(k, bits, den);
          den.add(1, bits, den);
          den.gamma(bits);
          num.div(den, bits, gam);

          conv.zero();
          for (int j = 1; j <= k - 2; j++)
          {
            a[j].mul(a[k - 1 - j], bits, prod);
            conv.add(prod, bits, conv);
          }

          q.mul(a[k - 1], bits, qa);
          conv.mul(r, bits, rconv);
          qa.add(rconv, bits, inner);
          inner.mul(gam, bits, rhs);

          a[k].sub(rhs, bits, resid);
          resid.abs(bits, mag);
          assertTrue("Riccati recurrence residual at k=" + k + ", v=" + v + " is " + mag + " (≥ 2^-90)",
                     mag.compareTo(thr) < 0);
        }

        for (int k = 1; k <= K; k++)
          a[k].close();
      }
    }
  }

  /** Build a CF whose model parameters are stored at {@code paramBits}. */
  private static RoughHestonCharacteristicFunction highPrecisionCF(int paramBits, List<Real> owned)
  {
    Real λ  = new Real("0.3",  paramBits).setName("λ");
    Real θ  = new Real("0.02", paramBits).setName("θ");
    Real ν  = new Real("0.3",  paramBits).setName("ν");
    Real V0 = new Real("0.02", paramBits).setName("V0");
    Real ρ  = new Real("-0.7", paramBits).setName("ρ");
    Real μ  = new Real("0.6",  paramBits).setName("μ");
    Real T  = new Real("1.0",  paramBits).setName("T");
    owned.add(λ); owned.add(θ); owned.add(ν); owned.add(V0); owned.add(ρ); owned.add(μ); owned.add(T);
    Context ctx = new Context(λ, θ, ν, V0, ρ, μ, T);
    RoughHestonCharacteristicFunction cf = new RoughHestonCharacteristicFunction(ctx, ComplexConstants.zero);
    return cf;
  }

  /**
   * "Exact to whatever bits" for the Müntz coefficients. With model parameters
   * carried at 600-bit precision, a(5)(0.5) is evaluated at working precisions
   * {64,128,256} and against a 512-bit reference; the error must be strictly
   * decreasing and the 256-bit error below 2^-100 (~30 digits). The bits→error
   * slope is not 1:1 — the rough-Heston cumulant recurrence loses ~half the
   * working precision to the catastrophic cancellation documented in issue #86
   * — so the 256-bit error is ~2^-131, not 2^-256; what matters is that more
   * bits monotonically buy more accuracy with no fixed floor. Cannot be done
   * against any finite-precision external benchmark — it is the distinguishing
   * property of the method.
   */
  public void testMuntzCoefficientBitsConvergence()
  {
    final int[] levels = { 64, 128, 256 };
    final int   refBits = 512;
    final int   paramBits = 600;

    List<Real>  owned   = new ArrayList<>();
    List<RoughHestonCharacteristicFunction> cfs = new ArrayList<>();
    try (Complex ref = new Complex(); Real errPrev = new Real(); Real errCur = new Real();
         Real thr200 = new Real(); Complex diff = new Complex())
    {
      RoughHestonCharacteristicFunction refCf = highPrecisionCF(paramBits, owned);
      cfs.add(refCf);
      evalA(refCf, 5, 0.5, refBits, ref);

      thr200.one().mul2e(-100);
      errPrev.posInf();

      for (int i = 0; i < levels.length; i++)
      {
        RoughHestonCharacteristicFunction cf = highPrecisionCF(paramBits, owned);
        cfs.add(cf);
        try (Complex val = new Complex())
        {
          evalA(cf, 5, 0.5, levels[i], val);
          val.sub(ref, refBits, diff);
          diff.abs(refBits, errCur);
        }
        assertTrue("a(5) error at " + levels[i] + " bits (" + errCur + ") must be < error at the coarser level (" + errPrev + ")",
                   errCur.compareTo(errPrev) < 0);
        if (levels[i] == 256)
          assertTrue("a(5) error at 256 bits (" + errCur + ") must be < 2^-100", errCur.compareTo(thr200) < 0);
        errPrev.set(errCur);
      }
    }
    finally
    {
      for (RoughHestonCharacteristicFunction cf : cfs)
        cf.close();
      for (Real p : owned)
        p.close();
    }
  }
}
