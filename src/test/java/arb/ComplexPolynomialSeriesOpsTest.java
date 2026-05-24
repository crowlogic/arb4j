package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Unit tests for the power-series operations
 * {@link ComplexPolynomial#expSeries(int, int, ComplexPolynomial)},
 * {@link ComplexPolynomial#mulLow(ComplexPolynomial, int, int, ComplexPolynomial)},
 * and {@link ComplexPolynomial#invSeries(int, int, ComplexPolynomial)} (bindings
 * of FLINT {@code acb_poly_exp_series} / {@code acb_poly_mullow} /
 * {@code acb_poly_inv_series}).
 *
 * <p>
 * All comparisons are performed entirely in arbitrary precision — no
 * {@code doubleValue()} anywhere — by differencing against an arb-built expected
 * value and comparing the magnitude to a {@code Real} threshold.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class ComplexPolynomialSeriesOpsTest extends
                                            TestCase
{
  static final int bits = 256;

  // ── arb expected-value builders (no doubleValue) ──
  private static Real rInt(int n)       { Real r = new Real(); r.set(n); return r; }
  private static Real rZero()           { return new Real(); }
  private static Real rPow2(int e)      { Real r = new Real(); r.one().mul2e(e); return r; }
  private static Real rFactInv(int k)   { Real f = new Real(); f.one(); for (int i = 2; i <= k; i++) f.mul(i, bits, f);
                                          Real r = new Real(); r.one().div(f, bits, r); return r; }
  private static Real rNeg(Real x)      { Real r = new Real(); x.neg(r); return r; }

  private static Real tol()             { Real t = new Real(); t.one().mul2e(-100); return t; }

  /** Assert z == (reExp, imExp) to within 2^-100, in arb. */
  private static void assertCoeff(String msg, Complex z, Real reExp, Real imExp)
  {
    try (Real d = new Real(); Real t = tol())
    {
      z.re().sub(reExp, bits, d); d.abs();
      assertTrue(msg + " re |Δ|=" + d, d.compareTo(t) < 0);
      z.im().sub(imExp, bits, d); d.abs();
      assertTrue(msg + " im |Δ|=" + d, d.compareTo(t) < 0);
    }
  }

  private static ComplexPolynomial polyInt(int... reCoeffs)
  {
    ComplexPolynomial p = new ComplexPolynomial();
    try (Complex c = new Complex())
    {
      for (int i = 0; i < reCoeffs.length; i++) { c.set(rInt(reCoeffs[i]), rZero()); p.set(i, c); }
    }
    return p;
  }

  /** exp(w) = Σ wᵏ/k! : coefficient k is 1/k!. */
  public void testExpSeriesOfW()
  {
    try (ComplexPolynomial h = polyInt(0, 1); ComplexPolynomial e = new ComplexPolynomial())
    {
      h.expSeries(7, bits, e);
      for (int k = 0; k < 7; k++)
        assertCoeff("exp(w)[" + k + "]", e.get(k), rFactInv(k), rZero());
    }
  }

  /** exp(ⅈw): coefficient k is ⅈᵏ/k! — magnitude 1/k!, rotated by k mod 4. */
  public void testExpSeriesComplexArgument()
  {
    try (ComplexPolynomial h = new ComplexPolynomial(); ComplexPolynomial e = new ComplexPolynomial(); Complex iC = new Complex())
    {
      iC.set(rZero(), rInt(1));
      h.set(1, iC); // h(w) = ⅈw
      h.expSeries(5, bits, e);
      assertCoeff("exp(ⅈw)[0]", e.get(0), rInt(1),            rZero());
      assertCoeff("exp(ⅈw)[1]", e.get(1), rZero(),            rInt(1));
      assertCoeff("exp(ⅈw)[2]", e.get(2), rNeg(rFactInv(2)),  rZero());
      assertCoeff("exp(ⅈw)[3]", e.get(3), rZero(),            rNeg(rFactInv(3)));
      assertCoeff("exp(ⅈw)[4]", e.get(4), rFactInv(4),        rZero());
    }
  }

  /** exp of a nonzero constant: the order-1 series of exp(2) is the scalar e². */
  public void testExpSeriesConstant()
  {
    try (ComplexPolynomial h = polyInt(2); ComplexPolynomial e = new ComplexPolynomial();
         Real e2 = new Real(); Real two = rInt(2))
    {
      two.exp(bits, e2);
      h.expSeries(1, bits, e);
      assertCoeff("exp(2)", e.get(0), e2, rZero());
    }
  }

  /** (1+w)² = 1+2w+w² ; mullow truncates to the requested length. */
  public void testMulLowTruncates()
  {
    try (ComplexPolynomial a = polyInt(1, 1); ComplexPolynomial b = polyInt(1, 1);
         ComplexPolynomial m3 = new ComplexPolynomial(); ComplexPolynomial m2 = new ComplexPolynomial())
    {
      a.mulLow(b, 3, bits, m3);
      assertCoeff("(1+w)²[0]", m3.get(0), rInt(1), rZero());
      assertCoeff("(1+w)²[1]", m3.get(1), rInt(2), rZero());
      assertCoeff("(1+w)²[2]", m3.get(2), rInt(1), rZero());
      a.mulLow(b, 2, bits, m2); // drop the w² term
      assertCoeff("trunc[0]", m2.get(0), rInt(1), rZero());
      assertCoeff("trunc[1]", m2.get(1), rInt(2), rZero());
      assertTrue("length-2 mullow must drop w²", m2.degree() < 2);
    }
  }

  /** (1+2w+3w²)(1+w) truncated to length 3 = 1 + 3w + 5w². */
  public void testMulLowGeneral()
  {
    try (ComplexPolynomial a = polyInt(1, 2, 3); ComplexPolynomial b = polyInt(1, 1);
         ComplexPolynomial m = new ComplexPolynomial())
    {
      a.mulLow(b, 3, bits, m);
      assertCoeff("[0]", m.get(0), rInt(1), rZero());
      assertCoeff("[1]", m.get(1), rInt(3), rZero());
      assertCoeff("[2]", m.get(2), rInt(5), rZero());
    }
  }

  /** 1/(1+w) = 1 − w + w² − w³ + w⁴. */
  public void testInvSeries()
  {
    try (ComplexPolynomial p = polyInt(1, 1); ComplexPolynomial r = new ComplexPolynomial())
    {
      p.invSeries(5, bits, r);
      for (int k = 0; k < 5; k++)
        assertCoeff("1/(1+w)[" + k + "]", r.get(k), rInt(k % 2 == 0 ? 1 : -1), rZero());
    }
  }

  /** 1/(2+w): coefficient k is (−1)ᵏ/2^{k+1}. */
  public void testInvSeriesScaled()
  {
    try (ComplexPolynomial p = polyInt(2, 1); ComplexPolynomial r = new ComplexPolynomial())
    {
      p.invSeries(4, bits, r);
      for (int k = 0; k < 4; k++)
      {
        Real e = rPow2(-(k + 1));
        assertCoeff("1/(2+w)[" + k + "]", r.get(k), k % 2 == 0 ? e : rNeg(e), rZero());
      }
    }
  }

  /** Aliasing: result == this must still be correct. */
  public void testExpSeriesAliasing()
  {
    try (ComplexPolynomial h = polyInt(0, 1))
    {
      h.expSeries(4, bits, h);
      for (int k = 0; k < 4; k++)
        assertCoeff("aliased exp(w)[" + k + "]", h.get(k), rFactInv(k), rZero());
    }
  }
}
