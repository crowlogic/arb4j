package arb.fuckedup;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Replicates {@code MuntzPadeApproximantPrecisionTest#testIncreasingPrecisionRebuildsCache}
 * using the decompiled arb.fuckedup classes directly, bypassing the expression compiler.
 *
 * Setup: Riccati ODE y' = 1 - y², y(0) = 0 → solution tanh(t).
 *   P = 1, Q = 0, R = -1, μ = 1.
 */
public class FuckedupPadeTest extends TestCase
{
  static final int M_ORDER = 5;

  /**
   * Build a constant ComplexPolynomial equal to the given integer value.
   */
  private static ComplexPolynomial constPoly(int bits, int value)
  {
    ComplexPolynomial p = new ComplexPolynomial();
    p.set(value);
    return p;
  }

  /**
   * Wire up the full Φ sequence for the tanh Riccati case and return it.
   * The caller owns all resources; close the returned Φ when done.
   */
  private static Φ buildPhi(int bits, Complex v, Real mu)
  {
    ComplexPolynomial p = constPoly(bits, 1);   // P = 1
    ComplexPolynomial q = constPoly(bits, 0);   // Q = 0
    ComplexPolynomial r = constPoly(bits, -1);  // R = -1

    Context ctx = new Context();

    // Build the Müntz coefficient sequence a(k)
    a aSeq = new a();
    aSeq.context = ctx;
    aSeq.p       = p;
    aSeq.q       = q;
    aSeq.r       = r;
    aSeq.μ       = mu;

    // m(k) = a(k+1)
    m mSeq = new m();
    mSeq.context = ctx;
    mSeq.a       = aSeq;
    mSeq.v       = v;
    mSeq.μ       = mu;

    // α, β recurrence coefficients (as polynomials in v)
    α alphaSeq = new α();
    alphaSeq.context = ctx;
    alphaSeq.p0 = p;
    alphaSeq.p1 = q;
    alphaSeq.v  = v;
    alphaSeq.μ  = mu;

    β betaSeq = new β();
    betaSeq.context = ctx;
    betaSeq.p0 = p;
    betaSeq.p1 = q;
    betaSeq.v  = v;
    betaSeq.μ  = mu;

    // σ functional sequence
    σ sigmaSeq = new σ();
    sigmaSeq.context = ctx;
    sigmaSeq.p0 = p;
    sigmaSeq.p1 = q;
    sigmaSeq.v  = v;
    sigmaSeq.μ  = mu;

    // h(j) = σ(j)(j)
    h hSeq = new h();
    hSeq.context = ctx;
    hSeq.σ  = sigmaSeq;
    hSeq.p0 = p;
    hSeq.p1 = q;
    hSeq.v  = v;
    hSeq.μ  = mu;

    // hv(n) = h(n)(v)
    hv hvSeq = new hv();
    hvSeq.context = ctx;
    hvSeq.h  = hSeq;
    hvSeq.p0 = p;
    hvSeq.p1 = q;
    hvSeq.v  = v;
    hvSeq.μ  = mu;

    // αv(n) = α(n)(v), βv(n) = β(n)(v)
    αv alphaVSeq = new αv();
    alphaVSeq.context = ctx;
    alphaVSeq.α  = alphaSeq;
    alphaVSeq.p0 = p;
    alphaVSeq.p1 = q;
    alphaVSeq.v  = v;
    alphaVSeq.μ  = mu;

    βv betaVSeq = new βv();
    betaVSeq.context = ctx;
    betaVSeq.β  = betaSeq;
    betaVSeq.p0 = p;
    betaVSeq.p1 = q;
    betaVSeq.v  = v;
    betaVSeq.μ  = mu;

    // Pn — orthogonal polynomial sequence
    Pn pnSeq = new Pn();
    pnSeq.context = ctx;
    pnSeq.hv  = hvSeq;
    pnSeq.αv  = alphaVSeq;
    pnSeq.βv  = betaVSeq;
    pnSeq.p0  = p;
    pnSeq.p1  = q;
    pnSeq.v   = v;
    pnSeq.μ   = mu;

    // Φnum and Φden
    Φnum phiNum = new Φnum();
    phiNum.context = ctx;
    phiNum.Pn = pnSeq;
    phiNum.p0 = p;
    phiNum.p1 = q;
    phiNum.v  = v;
    phiNum.μ  = mu;

    Φden phiDen = new Φden();
    phiDen.context = ctx;
    phiDen.p0 = p;
    phiDen.p1 = q;
    phiDen.v  = v;
    phiDen.μ  = mu;

    Φ phi = new Φ();
    phi.context = ctx;
    phi.Φnum    = phiNum;
    phi.Φden    = phiDen;
    phi.p0      = p;
    phi.p1      = q;
    phi.v       = v;
    phi.μ       = mu;

    return phi;
  }

  private static double errVsTanh(Complex approx, RealNullaryFunction tanhRef, int refBits)
  {
    try ( Real ref = new Real(); Real err = new Real())
    {
      tanhRef.evaluate(refBits, ref);
      approx.getReal().sub(ref, refBits, err);
      return Math.abs(err.doubleValue());
    }
  }

  /**
   * Increasing precision on the same approximant must rebuild the caches at the
   * higher precision (replicates testIncreasingPrecisionRebuildsCache).
   */
  public void testIncreasingPrecisionRebuildsCache()
  {
    int bits = 256;
    try ( Complex v  = new Complex();
          Real   mu  = new Real().set("1", bits);
          Integer M  = new Integer(M_ORDER))
    {
      Φ phi = buildPhi(bits, v, mu);

      try
      {
        ComplexFunction approx = phi.evaluate(M, 1, bits, null);

        Complex t = new Complex();
        Complex r = new Complex();

        // Low-precision first
        t.set("1", 32);
        approx.evaluate(t, 1, 32, r);
        assertTrue("32-bit eval is ~32-bit accurate",
                   errVsTanh(r, RealNullaryFunction.express("tanh(1)"), 300) < 1e-6);

        // Now high precision on same approximant
        t.set("1", 256);
        approx.evaluate(t, 1, 256, r);
        double err = errVsTanh(r, RealNullaryFunction.express("tanh(1)"), 300);
        assertTrue("256-bit eval must not be capped by 32-bit cache (err=" + err + ")", err < 1e-30);
      }
      finally
      {
        phi.close();
      }
    }
  }
}
