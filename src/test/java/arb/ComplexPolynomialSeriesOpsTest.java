package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Unit tests for the power-series operations
 * {@link ComplexPolynomial#expSeries(int, int, ComplexPolynomial)} and
 * {@link ComplexPolynomial#mulLow(ComplexPolynomial, int, int, ComplexPolynomial)}
 * (bindings of FLINT {@code acb_poly_exp_series} / {@code acb_poly_mullow}).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class ComplexPolynomialSeriesOpsTest extends
                                            TestCase
{
  static final int    bits = 128;
  static final double tol  = 1e-12;

  /** Build a polynomial with the given real coefficients (ascending). */
  private static ComplexPolynomial poly(double... reCoeffs)
  {
    ComplexPolynomial p = new ComplexPolynomial();
    try (Complex c = new Complex())
    {
      for (int i = 0; i < reCoeffs.length; i++)
      {
        c.set(reCoeffs[i], 0.0);
        p.set(i, c);
      }
    }
    return p;
  }

  /** exp(w) = Σ wᵏ/k! : coefficients 1, 1, 1/2, 1/6, 1/24, 1/120, 1/720. */
  public void testExpSeriesOfW()
  {
    try (ComplexPolynomial h = poly(0.0, 1.0); ComplexPolynomial e = new ComplexPolynomial())
    {
      h.expSeries(7, bits, e);
      double[] exp = { 1, 1, 0.5, 1.0 / 6, 1.0 / 24, 1.0 / 120, 1.0 / 720 };
      for (int i = 0; i < 7; i++)
      {
        assertEquals("Re exp(w)[" + i + "]", exp[i], e.get(i).re().doubleValue(), tol);
        assertEquals("Im exp(w)[" + i + "]", 0.0, e.get(i).im().doubleValue(), tol);
      }
    }
  }

  /** exp(ⅈw): coefficient k is ⅈᵏ/k! → 1, ⅈ, −1/2, −ⅈ/6, 1/24. */
  public void testExpSeriesComplexArgument()
  {
    try (ComplexPolynomial h = new ComplexPolynomial(); ComplexPolynomial e = new ComplexPolynomial(); Complex iC = new Complex())
    {
      iC.set(0.0, 1.0);
      h.set(1, iC); // h(w) = ⅈw
      h.expSeries(5, bits, e);
      assertEquals(1.0,       e.get(0).re().doubleValue(), tol); assertEquals(0.0,       e.get(0).im().doubleValue(), tol);
      assertEquals(0.0,       e.get(1).re().doubleValue(), tol); assertEquals(1.0,       e.get(1).im().doubleValue(), tol);
      assertEquals(-0.5,      e.get(2).re().doubleValue(), tol); assertEquals(0.0,       e.get(2).im().doubleValue(), tol);
      assertEquals(0.0,       e.get(3).re().doubleValue(), tol); assertEquals(-1.0 / 6,  e.get(3).im().doubleValue(), tol);
      assertEquals(1.0 / 24,  e.get(4).re().doubleValue(), tol); assertEquals(0.0,       e.get(4).im().doubleValue(), tol);
    }
  }

  /** exp of a nonzero constant: exp(c) at order 1 is the scalar exp(c). */
  public void testExpSeriesConstant()
  {
    try (ComplexPolynomial h = poly(2.0); ComplexPolynomial e = new ComplexPolynomial())
    {
      h.expSeries(1, bits, e);
      assertEquals(Math.exp(2.0), e.get(0).re().doubleValue(), 1e-12);
    }
  }

  /** (1+w)² = 1+2w+w² ; mullow truncates to the requested length. */
  public void testMulLowTruncates()
  {
    try (ComplexPolynomial a = poly(1.0, 1.0); ComplexPolynomial b = poly(1.0, 1.0);
         ComplexPolynomial m3 = new ComplexPolynomial(); ComplexPolynomial m2 = new ComplexPolynomial())
    {
      a.mulLow(b, 3, bits, m3);
      assertEquals(1.0, m3.get(0).re().doubleValue(), tol);
      assertEquals(2.0, m3.get(1).re().doubleValue(), tol);
      assertEquals(1.0, m3.get(2).re().doubleValue(), tol);

      a.mulLow(b, 2, bits, m2); // drop the w² term
      assertEquals(1.0, m2.get(0).re().doubleValue(), tol);
      assertEquals(2.0, m2.get(1).re().doubleValue(), tol);
      assertTrue("length-2 mullow must drop w²", m2.degree() < 2);
    }
  }

  /** (1+2w+3w²)(1+w) truncated to length 3 = 1 + 3w + 5w². */
  public void testMulLowGeneral()
  {
    try (ComplexPolynomial a = poly(1.0, 2.0, 3.0); ComplexPolynomial b = poly(1.0, 1.0);
         ComplexPolynomial m = new ComplexPolynomial())
    {
      a.mulLow(b, 3, bits, m);
      assertEquals(1.0, m.get(0).re().doubleValue(), tol);
      assertEquals(3.0, m.get(1).re().doubleValue(), tol);
      assertEquals(5.0, m.get(2).re().doubleValue(), tol);
    }
  }

  /** 1/(1+w) = 1 − w + w² − w³ + w⁴ (geometric series). */
  public void testInvSeries()
  {
    try (ComplexPolynomial p = poly(1.0, 1.0); ComplexPolynomial r = new ComplexPolynomial())
    {
      p.invSeries(5, bits, r);
      double[] exp = { 1, -1, 1, -1, 1 };
      for (int i = 0; i < 5; i++)
        assertEquals("1/(1+w)[" + i + "]", exp[i], r.get(i).re().doubleValue(), tol);
    }
  }

  /** 1/(2+w) = ½(1 − w/2 + w²/4 − …): coefficient k is (−1)ᵏ/2^{k+1}. */
  public void testInvSeriesScaled()
  {
    try (ComplexPolynomial p = poly(2.0, 1.0); ComplexPolynomial r = new ComplexPolynomial())
    {
      p.invSeries(4, bits, r);
      for (int k = 0; k < 4; k++)
        assertEquals("1/(2+w)[" + k + "]", (k % 2 == 0 ? 1 : -1) / Math.pow(2, k + 1),
                     r.get(k).re().doubleValue(), tol);
    }
  }

  /** Aliasing: result == this must still be correct (routed through a buffer). */
  public void testExpSeriesAliasing()
  {
    try (ComplexPolynomial h = poly(0.0, 1.0))
    {
      h.expSeries(4, bits, h);
      assertEquals(1.0,      h.get(0).re().doubleValue(), tol);
      assertEquals(1.0,      h.get(1).re().doubleValue(), tol);
      assertEquals(0.5,      h.get(2).re().doubleValue(), tol);
      assertEquals(1.0 / 6,  h.get(3).re().doubleValue(), tol);
    }
  }
}
