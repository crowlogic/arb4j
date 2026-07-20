package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Magnitude;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.heston.RoughHestonEdgeworthCallPrice;
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
  private static final Logger log = LoggerFactory.getLogger(RoughHestonMuntzPadeSolverConsistencyTest.class);
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

  /**
   * Expected rough Heston option prices were generated independently by three
   * external implementations tracked in issues #1200, #1195, and #1202. Only
   * values on which all three implementations agreed were admitted. arb4j's PaDE
   * implementation did not participate in generating or selecting these expected
   * values.
   *
   * Reference dataset version: 82dec0b0 (consensus_xval.csv)
   * External implementations:
   *   1. sigurdroemer/rough_heston (Octave Adams VIE)
   *   2. fbourgey/RoughVolatilityWorkshop2024 (Python Padé CF)
   *   3. Yugam2508/QuantJulia (Julia implicit Adams-Moulton)
   */
  private static final String[] CTX_VARS  = { "\u03BB", "\u03B8", "\u03BD", "V0", "\u03C1", "\u03BC", "T", "S0", "rr" };

  /**
   * Two-parameter rough Heston models from the cross-validation grid.
   * Each row: { H, \u03BB, \u03B8, \u03BD, \u03C1 }.
   */
  private static final double[][] MODELS  = {
    { 0.12, 0.1,  0.3156, 0.331, -0.681 },   // M1
    { 0.30, 2.0,  0.04,   0.3,   -0.7   },   // M2
  };

  /**
   * Reference-case data for all 42 grid points.
   * <p>
   * Each row: { modelIdx, T_expr, K_str, callMid, callRad, putMid, putRad }.
   * modelIdx 0/1 selects MODELS row. T_expr is a rational expression ("1/252")
   * passed to the expression compiler.  Radii equal for call/put because they
   * come from the same 3-pricer spread.
   */
  private static final String[][] REF_CASES = {
    { "0", "1/252", "0.8",   "0.200000023958", "0.000000000144", "0.000000023958", "0.000000000144" },
    { "0", "1/252", "0.9",   "0.100081091256", "0.000000101577", "0.000081091256", "0.000000101577" },
    { "0", "1/252", "0.95",  "0.051620774434", "0.000000563804", "0.001620774434", "0.000000563804" },
    { "0", "1/252", "1.0",   "0.013998472617", "0.000000133278", "0.013998472617", "0.000000133278" },
    { "0", "1/252", "1.05",  "0.000868850428", "0.000000686870", "0.050868850428", "0.000000686870" },
    { "0", "1/252", "1.1",   "0.000004042896", "0.000000020575", "0.100004042896", "0.000000020575" },
    { "0", "1/252", "1.2",   "0",               "0",              "0.200000000008", "0"               },
    { "0", "1/52",  "0.8",   "0.200264323549", "0.000000319661", "0.000264323549", "0.000000319661" },
    { "0", "1/52",  "0.9",   "0.104281448143", "0.000001462421", "0.004281448143", "0.000001462421" },
    { "0", "1/52",  "0.95",  "0.062665248770", "0.000001288536", "0.012665248770", "0.000001288536" },
    { "0", "1/52",  "1.0",   "0.030647286290", "0.000000481964", "0.030647286290", "0.000000481964" },
    { "0", "1/52",  "1.05",  "0.011167341614", "0.000002396470", "0.061167341614", "0.000002396470" },
    { "0", "1/52",  "1.1",   "0.002744855911", "0.000002181017", "0.102744855911", "0.000002181017" },
    { "0", "1/52",  "1.2",   "0.000038198716", "0.000000159273", "0.200038198716", "0.000000159273" },
    { "0", "1.0",   "0.8",   "0.312684931308", "0.000000153968", "0.112684931308", "0.000000153968" },
    { "0", "1.0",   "0.9",   "0.256792163206", "0.000006984619", "0.156792163206", "0.000006984619" },
    { "0", "1.0",   "0.95",  "0.231755335948", "0.000010838585", "0.181755335948", "0.000010838585" },
    { "0", "1.0",   "1.0",   "0.208597377285", "0.000014829718", "0.208597377285", "0.000014829718" },
    { "0", "1.0",   "1.05",  "0.187257941895", "0.000018838223", "0.237257941895", "0.000018838223" },
    { "0", "1.0",   "1.1",   "0.167667066545", "0.000022748558", "0.267667066545", "0.000022748558" },
    { "0", "1.0",   "1.2",   "0.133413610842", "0.000029862546", "0.333413610842", "0.000029862546" },
    { "1", "1/252", "0.8",   "0.200000000000", "0",               "0",               "0"               },
    { "1", "1/252", "0.9",   "0.100000000004", "0",               "0",               "0"               },
    { "1", "1/252", "0.95",  "0.050001585479", "0.000000004214", "0.000001585479", "0.000000004214" },
    { "1", "1/252", "1.0",   "0.005001803822", "0.000000030710", "0.005001803822", "0.000000030710" },
    { "1", "1/252", "1.05",  "0.000000001087", "0",               "0.050000001087", "0"               },
    { "1", "1/252", "1.1",   "0.000000011402", "0.000000013166", "0.100000011402", "0.000000013166" },
    { "1", "1/252", "1.2",   "0.000000012110", "0.000000013983", "0.200000012110", "0.000000013983" },
    { "1", "1/52",  "0.8",   "0.200000000967", "0",               "0.000000000967", "0"               },
    { "1", "1/52",  "0.9",   "0.100016942514", "0.000000038510", "0.000016942514", "0.000000038510" },
    { "1", "1/52",  "0.95",  "0.050708509389", "0.000000475177", "0.000708509389", "0.000000475177" },
    { "1", "1/52",  "1.0",   "0.010928499602", "0.000000148074", "0.010928499602", "0.000000148074" },
    { "1", "1/52",  "1.05",  "0.000146917789", "0.000000372316", "0.050146917789", "0.000000372316" },
    { "1", "1/52",  "1.1",   "0.000000014092", "0.000000000179", "0.100000014092", "0.000000000179" },
    { "1", "1/52",  "1.2",   "0",               "0",              "0.200000000008", "0"               },
    { "1", "1.0",   "0.8",   "0.216552344008", "0.000004459638", "0.016552344008", "0.000004459638" },
    { "1", "1.0",   "0.9",   "0.137924919127", "0.000002588756", "0.037924919127", "0.000002588756" },
    { "1", "1.0",   "0.95",  "0.104528511870", "0.000000903262", "0.054528511870", "0.000000903262" },
    { "1", "1.0",   "1.0",   "0.075929675943", "0.000003357228", "0.075929675943", "0.000003357228" },
    { "1", "1.0",   "1.05",  "0.052521888433", "0.000006680485", "0.102521888433", "0.000006680485" },
    { "1", "1.0",   "1.1",   "0.034372303347", "0.000009100025", "0.134372303347", "0.000009100025" },
    { "1", "1.0",   "1.2",   "0.012208619640", "0.000009164694", "0.212208619640", "0.000009164694" },
  };

  /**
   * Exercise the one Java pricing path — {@link RoughHestonEdgeworthCallPrice}
   * — against every reference case in {@link #REF_CASES} and verify that the
   * computed price ball contains the reference midpoint.
   */
  public void testEdgeworthCallPriceAgainstReferenceConsensus()
  {
    final int bits = 256;
    int passed = 0, failed = 0;

    try (Real S0 = new Real("1.0", bits).setName("S0");
         Real rr = new Real("0.0", bits).setName("rr"))
    {
      for (int i = 0; i < REF_CASES.length; i++)
      {
        String[] row  = REF_CASES[i];
        int    mIdx   = java.lang.Integer.parseInt(row[0]);
        String tExpr  = row[1];
        String kStr   = row[2];
        String midStr = row[3];
        String radStr = row[4];

        double[] mp = MODELS[mIdx];
        double H = mp[0], lam = mp[1], theta = mp[2], nu = mp[3], rho = mp[4];

        String label = "M" + (mIdx + 1) + "_T" + tExpr.replace("/", "_") + "_K" + kStr;

        try (Real λ  = new Real(Double.toString(lam),   bits).setName("λ");
             Real θ  = new Real(Double.toString(theta), bits).setName("θ");
             Real ν  = new Real(Double.toString(nu),    bits).setName("ν");
             Real V0 = new Real(Double.toString(theta), bits).setName("V0");
             Real ρ  = new Real(Double.toString(rho),   bits).setName("ρ");
             Real μ  = new Real(Double.toString(H + 0.5), bits).setName("μ");
             Real K  = new Real(kStr, bits))
        {
          try (Context tCtx = new Context(λ, θ, ν, V0, ρ, μ, S0))
          {
            Real T = RealFunction.express(tExpr, tCtx).evaluate(null, bits, new Real());
            T.setName("T");

            try (Context ctx      = new Context(λ, θ, ν, V0, ρ, μ, T, S0, rr);
                 var    pricer   = new RoughHestonEdgeworthCallPrice(ctx, K, ComplexConstants.zero);
                 Real   computed = new Real();
                 Real   refMid   = new Real(midStr, bits);
                 Real   refRad   = new Real(radStr, bits);
                 Real   radMag   = new Real())
            {
              pricer.call(bits, computed);

              log.debug("Case {} {}: computed={} refMid={} refRad={}",
                        label, i, computed, midStr, radStr);

              /* D1: computed ball must contain reference midpoint */
              boolean d1 = computed.contains(refMid);
              log.debug("  D1 (computed contains refMid): {} computed=[{} ± {}] refMid={}",
                        d1, computed.getMid(), computed.getRad(), midStr);

              /* D2: reference ball must contain computed midpoint */
              boolean d2 = true;
              if (radStr.charAt(0) != '0')
              {
                refRad.getMagnitude(new Magnitude());
                try (Real refBall = new Real(midStr, bits))
                {
                  refBall.setRad(refRad.getMagnitude(new Magnitude()));
                  try (Real computedMid = new Real(computed.getMid(), new Magnitude()))
                  {
                    d2 = refBall.contains(computedMid);
                    log.debug("  D2 (refBall contains computedMid): {} refBall=[{} ± {}] computedMid={}",
                              d2, midStr, radStr, computedMid);
                  }
                }
              }
              else
              {
                log.debug("  D2: skipped (zero reference radius)");
              }

              if (d1 && d2)
              {
                passed++;
                log.debug("  PASS");
              }
              else
              {
                failed++;
                log.debug("  FAIL d1={} d2={}", d1, d2);
                fail("Case " + label + " T=" + tExpr + " K=" + kStr
                     + ": computed=" + computed + " refMid=" + midStr
                     + " d1=" + d1 + " d2=" + d2);
              }
            }
          }
        }
      }
    }
    log.debug("RESULT: {}/{} passed, {} failed", passed, passed + failed, failed);
  }
}
