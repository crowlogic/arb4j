package arb;

import junit.framework.TestCase;

/**
 * Tests for {@link ComplexPolynomial#rootsAtBits(int)} — the convergence-bounded
 * certified root isolation used as the kernel of partial-fraction expansion
 * in callers such as bonanzai's RoughHestonSchwingerPricer.
 *
 * <p>The contract: the returned vector has {@code degree()} entries, each is
 * a {@link Complex} ball, and each ball has
 * {@code relAccuracyBits() >= bits}. The working precision is lifted
 * internally until both conditions hold.
 */
public class ComplexPolynomialRootsTest extends
                                        TestCase
{

  private static ComplexPolynomial poly(int[] realCoeffs)
  {
    ComplexPolynomial p = new ComplexPolynomial();
    try ( Complex c = new Complex() )
    {
      for (int i = 0; i < realCoeffs.length; i++)
      {
        c.set(realCoeffs[i]);
        p.set(i, c);
      }
    }
    return p;
  }

  /**
   * z² + 1 = 0 → {i, −i}. Trivial case verifying the basic isolation
   * contract at 128 relative bits.
   */
  public void testQuadraticZsquaredPlusOne()
  {
    try ( ComplexPolynomial p = poly(new int[]{ 1, 0, 1 }) )
    {
      Complex roots = p.rootsAtBits(128);
      assertEquals(2, roots.dim);
      for (int i = 0; i < 2; i++)
      {
        Complex r = roots.get(i);
        assertTrue("root " + i + " ball: " + r + " relAcc=" + r.relAccuracyBits() + " isExact=" + r.isExact(),
                   r.isExact() || r.relAccuracyBits() >= 128);
        try ( Real absImag = new Real(); Real one = Real.valueOf("1.0", 128); Real diff = new Real() )
        {
          r.getImag().abs(128, absImag);
          absImag.sub(one, 128, diff).abs();
          assertTrue("|Im(r) − 1| should be tiny, got " + diff,
                     diff.compareTo(Real.valueOf("1e-30", 128)) < 0);
        }
      }
    }
  }

  /**
   * z⁴ − 1 = 0 → {1, −1, i, −i}. Four well-separated roots on the unit circle.
   */
  public void testQuarticZ4Minus1()
  {
    try ( ComplexPolynomial p = poly(new int[]{ -1, 0, 0, 0, 1 }) )
    {
      Complex roots = p.rootsAtBits(128);
      assertEquals(4, roots.dim);
      for (int i = 0; i < 4; i++)
      {
        Complex r = roots.get(i);
        assertTrue("root " + i + " relAcc=" + r.relAccuracyBits() + " isExact=" + r.isExact(),
                   r.isExact() || r.relAccuracyBits() >= 128);
        try ( Real absR = new Real(); Real one = Real.valueOf("1.0", 128); Real diff = new Real() )
        {
          r.abs(128, absR);
          absR.sub(one, 128, diff).abs();
          assertTrue("|r| should be 1, got " + absR,
                     diff.compareTo(Real.valueOf("1e-30", 128)) < 0);
        }
      }
    }
  }

  /**
   * Higher-precision target: same z² + 1 polynomial but requesting 512 bits.
   * Verifies the precision-lifting loop produces balls at the requested target.
   */
  public void testHighPrecisionTarget()
  {
    try ( ComplexPolynomial p = poly(new int[]{ 1, 0, 1 }) )
    {
      Complex roots = p.rootsAtBits(512);
      assertEquals(2, roots.dim);
      for (int i = 0; i < 2; i++)
      {
        Complex r = roots.get(i);
        assertTrue("root " + i + " relAcc=" + r.relAccuracyBits() + " isExact=" + r.isExact() + " < 512",
                   r.isExact() || r.relAccuracyBits() >= 512);
      }
    }
  }
}
