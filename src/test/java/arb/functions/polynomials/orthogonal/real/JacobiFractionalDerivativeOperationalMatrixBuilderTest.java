package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealMatrix;
import junit.framework.TestCase;

public class JacobiFractionalDerivativeOperationalMatrixBuilderTest extends
                                                                    TestCase
{

  /** Tolerance for numerical spot checks (128-bit quadrature) */
  private static final double TOL = 1e-8;

  private RealMatrix buildDefaultMatrix(int maxDegree)
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder();
          Real gamma = Real.valueOf(0.5))
    {
      return builder.setFractionalOrder(gamma).build(maxDegree);
    }
  }

  private void assertEntry(double expected, RealMatrix M, int i, int j)
  {
    double actual = M.get(i, j).doubleValue();
    assertEquals("M[" + i + "][" + j + "]", expected, actual, TOL);
  }

  public void testDefaultConstructor()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      assertNotNull("fractionalOrder should not be null", builder.getFractionalOrder());
      assertEquals("default bits should be 128", 128, builder.getBits());
    }
  }

  public void testSetFractionalOrder()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
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
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      builder.setBits(256);
      assertEquals("bits should be 256", 256, builder.getBits());
    }
  }

  public void testSetBasis()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
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
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
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
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        RealMatrix M = builder.setFractionalOrder(gamma).build(5);
        assertNotNull("matrix should not be null", M);
        assertEquals("matrix should be square", M.getNumRows(), M.getNumCols());
        assertEquals("matrix size should be 6x6", 6, M.getNumRows());
      }
    }
  }

  public void testBuildWithDifferentDegrees()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        builder.setFractionalOrder(gamma);
        RealMatrix M3  = builder.build(3);
        RealMatrix M5  = builder.build(5);
        RealMatrix M10 = builder.build(10);

        assertEquals("3x3 matrix size", 4, M3.getNumRows());
        assertEquals("5x5 matrix size", 6, M5.getNumRows());
        assertEquals("10x10 matrix size", 11, M10.getNumRows());
      }
    }
  }

  public void testBuildWithDifferentGammas()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real g1 = Real.valueOf(0.25); Real g2 = Real.valueOf(0.5); Real g3 = Real.valueOf(0.75))
      {
        RealMatrix M1 = builder.setFractionalOrder(g1).build(5);
        RealMatrix M2 = builder.setFractionalOrder(g2).build(5);
        RealMatrix M3 = builder.setFractionalOrder(g3).build(5);

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
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
    {
      try ( Real gamma = Real.valueOf(0.5))
      {
        RealMatrix M = builder.setFractionalOrder(gamma).build(3);

        for (int i = 0; i < M.getNumRows(); i++)
        {
          for (int j = 0; j < M.getNumCols(); j++)
          {
            Real elem = M.get(i, j);
            assertNotNull("matrix element [" + i + "][" + j + "] should exist", elem);
          }
        }
      }
    }
  }

  // --- Column 0 should be zero: D^γ of a constant is zero for γ > 0 ---

  public void testM00_isZero()
  {
    assertEntry(0.0, buildDefaultMatrix(5), 0, 0);
  }

  public void testM20_isZero()
  {
    assertEntry(0.0, buildDefaultMatrix(5), 2, 0);
  }

  public void testM40_isZero()
  {
    assertEntry(0.0, buildDefaultMatrix(5), 4, 0);
  }

  // --- Non-trivial entries (40-digit mpmath reference, γ=0.5, α=β=-0.5) ---

  public void testM01()
  {
    assertEntry(0.8605409203945412, buildDefaultMatrix(5), 0, 1);
  }

  public void testM02()
  {
    assertEntry(-0.07022198786407036, buildDefaultMatrix(5), 0, 2);
  }

  public void testM03()
  {
    assertEntry(0.5460881949143573, buildDefaultMatrix(5), 0, 3);
  }

  public void testM21()
  {
    assertEntry(0.3445555052841249, buildDefaultMatrix(5), 2, 1);
  }

  public void testM22()
  {
    assertEntry(1.1189646266469969, buildDefaultMatrix(5), 2, 2);
  }

  public void testM23()
  {
    assertEntry(0.3555794049460223, buildDefaultMatrix(5), 2, 3);
  }

  public void testM42()
  {
    assertEntry(0.1494257992131755, buildDefaultMatrix(5), 4, 2);
  }

  public void testM43()
  {
    assertEntry(1.0375741784497773, buildDefaultMatrix(5), 4, 3);
  }

  public void testM44()
  {
    assertEntry(0.5152068150226581, buildDefaultMatrix(5), 4, 4);
  }

  public void testToString()
  {
    try ( JacobiFractionalDerivativeOperationalMatrixBuilder builder =
                                                                     new JacobiFractionalDerivativeOperationalMatrixBuilder())
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
        RealMatrix M = builder.setFractionalOrder(gamma).build(5);
        assertEquals("should build successfully in try-with-resources", 6, M.getNumRows());
      }
    }
  }
}
