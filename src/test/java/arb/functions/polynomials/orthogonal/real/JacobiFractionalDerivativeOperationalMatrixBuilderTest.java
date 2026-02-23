package arb.functions.polynomials.orthogonal.real;

import arb.*;
import junit.framework.TestCase;

public class JacobiFractionalDerivativeOperationalMatrixBuilderTest extends
                                                                    TestCase
{

  /** Tolerance for numerical spot checks (128-bit quadrature) */
  private static final double TOL = 1e-8;

  public void testDefaultConstructor()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      assertNotNull("fractionalOrder should not be null", builder.getFractionalOrder());
      assertEquals("default bits should be 128", 128, builder.getBits());
    }
  }

  public void testSetFractionalOrder()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real order = Real.valueOf(0.3))
      {
        builder.setFractionalOrder(order);
        assertEquals("fractionalOrder should be set",
                     0,
                     builder.getFractionalOrder().compareTo(order));
      }
    }
  }

  public void testSetBits()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      builder.setBits(256);
      assertEquals("bits should be 256", 256, builder.getBits());
    }
  }

  public void testSetBasis()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real a = Real.valueOf(0.4); Real b = Real.valueOf(0.6))
      {
        JacobiPolynomialSequence customBasis = new JacobiPolynomialSequence(a,
                                                                            b);
        builder.setBasis(customBasis);
        assertSame("basis should be set", customBasis, builder.getBasis());
      }
    }
  }

  public void testChaining()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real order = Real.valueOf(0.5))
      {
        JacobiFractionalDerivativeOperationalMatrixBuilder result =
                                                                  builder.setFractionalOrder(order)
                                                                         .setBits(256);
        assertSame("chaining should return same builder", builder, result);
      }
    }
  }

  public void testBuildMatrix()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        ComplexMatrix M = builder.setFractionalOrder(gamma).build(5);
        assertNotNull("matrix should not be null", M);
        assertEquals("matrix should be square", M.getNumRows(), M.getNumCols());
        assertEquals("matrix size should be 6x6", 6, M.getNumRows());
      }
    }
  }

  public void testBuildWithDifferentDegrees()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        builder.setFractionalOrder(gamma);
        ComplexMatrix M3  = builder.build(3);
        ComplexMatrix M5  = builder.build(5);
        ComplexMatrix M10 = builder.build(10);

        assertEquals("3x3 matrix size", 4, M3.getNumRows());
        assertEquals("5x5 matrix size", 6, M5.getNumRows());
        assertEquals("10x10 matrix size", 11, M10.getNumRows());

      }
    }
  }

  public void testBuildWithDifferentGammas()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real g1 = Real.valueOf(0.25); Real g2 = Real.valueOf(0.5); Real g3 = Real.valueOf(0.75))
      {
        ComplexMatrix M1 = builder.setFractionalOrder(g1).build(5);
        ComplexMatrix M2 = builder.setFractionalOrder(g2).build(5);
        ComplexMatrix M3 = builder.setFractionalOrder(g3).build(5);

        assertNotNull("all matrices should be created", M1);
        assertNotNull("all matrices should be created", M2);
        assertNotNull("all matrices should be created", M3);

        assertEquals("all same size", M1.getNumRows(), M2.getNumRows());
        assertEquals("all same size", M2.getNumRows(), M3.getNumRows());
      }
    }
  }

  public void testMatrixElementsExist()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        ComplexMatrix M = builder.setFractionalOrder(gamma).build(3);

        for (int i = 0; i < M.getNumRows(); i++)
        {
          for (int j = 0; j < M.getNumCols(); j++)
          {
            Complex elem = M.get(i, j);
            assertNotNull("matrix element [" + i + "][" + j + "] should exist", elem);
          }
        }
      }
    }
  }

  /**
   * Spot-check specific matrix entries of D^(1/2) for Chebyshev (α=β=-1/2)
   * against 40-digit mpmath reference values.
   *
   * Reference values computed via: ω(j,k) =
   * (-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*(j-k)!*k!) χ(i,p) =
   * ∫₀^π |cosθ|^p cos(iθ) dθ / normSq(i) μ(i,j) = Σ_{k=⌈γ⌉}^{j}
   * ω(j,k)*Γ(k+1)/Γ(k+1-γ)*χ(i,k-γ)
   */
  public void testMatrixValuesSpotCheck()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      {
        builder.setFractionalOrder(RealConstants.half);
        ComplexMatrix M = builder.build(5);

        // Column 0 is zero: D^γ of a constant is zero for γ > 0
        assertSpotValue("M[0][0]", 0.0, M, 0, 0);
        assertSpotValue("M[2][0]", 0.0, M, 2, 0);
        assertSpotValue("M[4][0]", 0.0, M, 4, 0);

        // Odd rows are zero by parity: T_n for odd n is odd, |cosθ|^p is even
        assertSpotValue("M[1][1]", 0.0, M, 1, 1);
        assertSpotValue("M[3][3]", 0.0, M, 3, 3);
        assertSpotValue("M[5][5]", 0.0, M, 5, 5);

        // Non-trivial entries (40-digit mpmath reference)
        assertSpotValue("M[0][1]", 0.8605409203945412, M, 0, 1);
        assertSpotValue("M[0][2]", -0.07022198786407036, M, 0, 2);
        assertSpotValue("M[0][3]", 0.5460881949143573, M, 0, 3);
        assertSpotValue("M[2][1]", 0.3445555052841249, M, 2, 1);
        assertSpotValue("M[2][2]", 1.1189646266469969, M, 2, 2);
        assertSpotValue("M[2][3]", 0.3555794049460223, M, 2, 3);
        assertSpotValue("M[4][2]", 0.1494257992131755, M, 4, 2);
        assertSpotValue("M[4][3]", 1.0375741784497773, M, 4, 3);
        assertSpotValue("M[4][4]", 0.5152068150226581, M, 4, 4);
      }
    }
  }

  /**
   * <p>
   * Yes, that's correct. ω(4,3) = -70 exactly.
   * 
   * The arithmetic:
   * 
   * ω(4,3) = ((-1)¹ · Γ(⁹⁄₂) · Γ(7)) / (Γ(⁷⁄₂) · Γ(4) · 1! · 3!) = (-1 · ⁷⁄₂ ·
   * 720) / (6 · 1 · 6) = -2520/36 = -70
   * 
   * (using Γ(9/2)/Γ(7/2) = 7/2, so the ratio collapses cleanly).
   * 
   * The test is structurally sound — j=4 > k=3 so (j-k)! = 1! = 1 is
   * well-defined, and comparing against the real part with im().isZero() is the
   * right check since all Gamma arguments are real here.
   * </p>
   * 
   */
  public static void testOmega()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      Complex ωval = builder.ω.apply(4).apply(3);
      assertEquals(-70.0, ωval.re().doubleValue());
      assertTrue(ωval.im().isZero());
    }
  }

  private void assertSpotValue(String label, double expected, ComplexMatrix M, int i, int j)
  {
    double actual = M.get(i, j).re().doubleValue();
    assertEquals(label + " expected=" + expected + " actual=" + actual, expected, actual, TOL);
    assertTrue("imag part is nonzero " + M.get(i, j).im(), M.get(i, j).im().doubleValue() == 0);

  }

  public void testToString()
  {
    try ( var builder = new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      String str = builder.toString();
      assertNotNull("toString should not be null", str);
      assertTrue("should contain gamma", str.contains("γ"));
      assertTrue("should contain bits", str.contains("bits"));
    }
  }

  public void testAutoCloseable()
  {
    JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                               new JacobiFractionalDerivativeOperationalMatrixBuilder();
    assertNotNull("fractionalOrder should exist before close", builder.getFractionalOrder());

    builder.close();
  }

  public void testTryWithResources()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        ComplexMatrix M = builder.setFractionalOrder(gamma).build(5);
        assertEquals("should build successfully in try-with-resources", 6, M.getNumRows());
      }
    }
  }
}
