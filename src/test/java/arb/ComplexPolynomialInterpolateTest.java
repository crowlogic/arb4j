package arb;

import junit.framework.TestCase;

/**
 * Tests for {@link ComplexPolynomial#interpolate(Complex, Complex, int)} —
 * the barycentric Lagrange interpolation primitive used by bonanzai's
 * Schwinger pricer to reconstruct the Padé denominator polynomial
 * {@code \widetilde Q_M(T, v)} from values of κ_M(T, v) at chosen nodes.
 */
public class ComplexPolynomialInterpolateTest extends
                                              TestCase
{

  /**
   * z² + 1 from three real nodes {-1, 0, 1}. Coefficients: c0=1, c1=0, c2=1.
   */
  public void testQuadraticFromThreeNodes()
  {
    try ( Complex xs = Complex.newVector(3); Complex ys = Complex.newVector(3) )
    {
      xs.get(0).set(-1);
      xs.get(1).set(0);
      xs.get(2).set(1);
      ys.get(0).set(2);   // (-1)^2 + 1
      ys.get(1).set(1);   //   0^2 + 1
      ys.get(2).set(2);   //   1^2 + 1
      ComplexPolynomial p = ComplexPolynomial.interpolate(xs, ys, 128);
      assertEquals(3, p.getLength());
      assertCoefficientNear(p, 0, 1.0, 0.0, "c0");
      assertCoefficientNear(p, 1, 0.0, 0.0, "c1");
      assertCoefficientNear(p, 2, 1.0, 0.0, "c2");
    }
  }

  /**
   * z³ − z from four nodes {-2, -1, 1, 2}. Coefficients: c0=0, c1=-1, c2=0, c3=1.
   */
  public void testCubicFromFourNodes()
  {
    try ( Complex xs = Complex.newVector(4); Complex ys = Complex.newVector(4) )
    {
      xs.get(0).set(-2); ys.get(0).set(-6);   // -8 - (-2)
      xs.get(1).set(-1); ys.get(1).set(0);    // -1 - (-1)
      xs.get(2).set(1);  ys.get(2).set(0);    //  1 - 1
      xs.get(3).set(2);  ys.get(3).set(6);    //  8 - 2
      ComplexPolynomial p = ComplexPolynomial.interpolate(xs, ys, 128);
      assertEquals(4, p.getLength());
      assertCoefficientNear(p, 0, 0.0,  0.0, "c0");
      assertCoefficientNear(p, 1, -1.0, 0.0, "c1");
      assertCoefficientNear(p, 2, 0.0,  0.0, "c2");
      assertCoefficientNear(p, 3, 1.0,  0.0, "c3");
    }
  }

  /**
   * Complex nodes: interpolate z² from three nodes {1, i, -1}.
   * Values: 1²=1, i²=-1, (-1)²=1. Coefficients: c0=0, c1=0, c2=1.
   */
  public void testQuadraticFromComplexNodes()
  {
    try ( Complex xs = Complex.newVector(3); Complex ys = Complex.newVector(3) )
    {
      xs.get(0).set(1);
      xs.get(1).getReal().zero(); xs.get(1).getImag().set(1);   // i
      xs.get(2).set(-1);
      ys.get(0).set(1);
      ys.get(1).set(-1);
      ys.get(2).set(1);
      ComplexPolynomial p = ComplexPolynomial.interpolate(xs, ys, 128);
      assertEquals(3, p.getLength());
      assertCoefficientNear(p, 0, 0.0, 0.0, "c0");
      assertCoefficientNear(p, 1, 0.0, 0.0, "c1");
      assertCoefficientNear(p, 2, 1.0, 0.0, "c2");
    }
  }

  private static void assertCoefficientNear(ComplexPolynomial p,
                                             int i,
                                             double expectedRe,
                                             double expectedIm,
                                             String tag)
  {
    Complex c = p.get(i);
    double  re = c.getReal().doubleValue();
    double  im = c.getImag().doubleValue();
    assertEquals(tag + ".re", expectedRe, re, 1e-25);
    assertEquals(tag + ".im", expectedIm, im, 1e-25);
  }
}
