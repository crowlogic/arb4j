package arb.applications.options;

import java.util.ArrayList;
import java.util.List;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.applications.options.RoughHestonCharacteristicFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * No-arbitrage and self-consistency tests for the exact European call price
 * (issue #87). The exact price is the partial-fraction/residue construction of
 * §8–§13; its no-arbitrage guarantees (§14) reduce <em>exactly</em> to two
 * identities of the characteristic function. Because the Riccati source
 * {@code p(u)=½(−u²−ⅈu)} vanishes at {@code u=0} and {@code u=−ⅈ}
 * ({@code p(−ⅈ)=½(1−1)=0}), every {@code aₖ(0)=aₖ(−ⅈ)=0}, so {@code Φ=0} and
 * {@code φ=1} — exactly, for any truncation N and any working precision. These
 * are therefore structural-exact assertions, not regime-dependent ones, and do
 * not depend on any pricing approximation (in particular not on the asymptotic
 * Edgeworth pricer, which is not the exact solution).
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonExactCallNoArbitrageTest extends
                                                TestCase
{
  static final int bits = 256;

  /** 2^-100 threshold for the structural-exact identities. */
  private static Real twoPow(int e)
  {
    Real t = new Real();
    t.one().mul2e(e);
    return t;
  }

  /**
   * Martingale / no-arbitrage drift condition: φ(−ⅈ) = E[e^{X_T}] = 1. This is
   * the §11 residue at v=−ⅈ that supplies the +S leg of the intrinsic and makes
   * put–call parity C−P=S−K hold identically (§14). Exact to working precision
   * because aₖ(−ⅈ)=0 identically.
   */
  public void testMartingaleConditionPhiAtMinusIIsOne()
  {
    try (var φ = new RoughHestonCharacteristicFunction();
         Complex u = new Complex(); Complex res = new Complex(); Complex one = new Complex();
         Complex diff = new Complex(); Real mag = new Real(); Real thr = twoPow(-100))
    {
      u.set(0.0, -1.0); // u = −ⅈ
      φ.evaluate(u, 1, bits, res);
      one.set(1.0, 0.0);
      res.sub(one, bits, diff);
      diff.abs(bits, mag);
      assertTrue("φ(−ⅈ) must equal 1 (martingale condition); |φ(−ⅈ)−1| = " + mag, mag.compareTo(thr) < 0);
    }
  }

  /**
   * φ(0) = 1, the §11 residue at v=0 supplying the −K leg of the intrinsic.
   * Strengthens RoughHestonCharacteristicFunctionTest.testAtZeroArgumentEqualsOne
   * (1e-10) to structural exactness (&lt; 2^-100).
   */
  public void testIntrinsicZeroArgumentResidue()
  {
    try (var φ = new RoughHestonCharacteristicFunction();
         Complex u = new Complex(); Complex res = new Complex(); Complex one = new Complex();
         Complex diff = new Complex(); Real mag = new Real(); Real thr = twoPow(-100))
    {
      u.set(0.0, 0.0);
      φ.evaluate(u, 1, bits, res);
      one.set(1.0, 0.0);
      res.sub(one, bits, diff);
      diff.abs(bits, mag);
      assertTrue("φ(0) must equal 1; |φ(0)−1| = " + mag, mag.compareTo(thr) < 0);
    }
  }

  /**
   * Hermitian symmetry φ(−u) = conj(φ(u)) for real u: the log-price density is
   * real-valued. Exact for any N because p(−v)=conj(p(v)), q(−v)=conj(q(v)),
   * r∈ℝ propagate aₖ(−v)=conj(aₖ(v)) through the recurrence.
   */
  public void testHermitianSymmetry()
  {
    try (var φ = new RoughHestonCharacteristicFunction();
         Complex uPos = new Complex(); Complex uNeg = new Complex();
         Complex fPos = new Complex(); Complex fPosConj = new Complex(); Complex fNeg = new Complex();
         Complex diff = new Complex(); Real mag = new Real(); Real thr = twoPow(-90))
    {
      for (double x : new double[] { 0.7, 1.3, 2.5 })
      {
        uPos.set(x, 0.0);
        uNeg.set(-x, 0.0);
        φ.evaluate(uPos, 1, bits, fPos);
        φ.evaluate(uNeg, 1, bits, fNeg);
        fPos.conj(fPosConj);
        fNeg.sub(fPosConj, bits, diff);
        diff.abs(bits, mag);
        assertTrue("φ(−u) must equal conj(φ(u)) at u=" + x + "; |Δ| = " + mag, mag.compareTo(thr) < 0);
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
   * "Exact to whatever bits" for the assembled φ. With model parameters at
   * 600-bit precision and a fixed truncation N, φ(0.7) is evaluated at working
   * precisions {64,128,256} and against a 512-bit reference; the error must be
   * strictly decreasing and the 256-bit error below 2^-100 (~30 digits). The
   * bits→error slope is not 1:1 — the cumulant recurrence loses ~half the
   * working precision to the cancellation documented in issue #86, so the
   * 256-bit error is ~2^-131 — but more bits monotonically buy more accuracy.
   */
  public void testCharacteristicFunctionBitsConvergence()
  {
    final int[] levels    = { 64, 128, 256 };
    final int   refBits   = 512;
    final int   paramBits = 600;

    List<Real>  owned = new ArrayList<>();
    List<RoughHestonCharacteristicFunction> cfs = new ArrayList<>();
    try (Complex u = new Complex(); Complex ref = new Complex(); Complex diff = new Complex();
         Real errPrev = new Real(); Real errCur = new Real(); Real thr200 = twoPow(-100))
    {
      u.set(0.7, 0.0);

      RoughHestonCharacteristicFunction refCf = highPrecisionCF(paramBits, owned);
      cfs.add(refCf);
      refCf.evaluate(u, 1, refBits, ref);

      errPrev.posInf();
      for (int i = 0; i < levels.length; i++)
      {
        RoughHestonCharacteristicFunction cf = highPrecisionCF(paramBits, owned);
        cfs.add(cf);
        try (Complex val = new Complex())
        {
          cf.evaluate(u, 1, levels[i], val);
          val.sub(ref, refBits, diff);
          diff.abs(refBits, errCur);
        }
        assertTrue("φ(0.7) error at " + levels[i] + " bits (" + errCur + ") must be < the coarser level (" + errPrev + ")",
                   errCur.compareTo(errPrev) < 0);
        if (levels[i] == 256)
          assertTrue("φ(0.7) error at 256 bits (" + errCur + ") must be < 2^-100", errCur.compareTo(thr200) < 0);
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
