package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealMatrix;
import junit.framework.TestCase;

public class JacobiFractionalDerivativeOperationalMatrixBuilderTest extends
                                                                    TestCase
{
  @Override
  protected void tearDown()
  {
    System.gc();
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
      try ( Real order = new Real(128).set(0.3))
      {
        builder.setFractionalOrder(order);
        assertEquals("fractionalOrder should be set", 0, builder.getFractionalOrder().compareTo(order));
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
      try ( Real a = new Real(128).set(0.4); Real b = new Real(128).set(0.6))
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
      try ( Real order = new Real(256).set(0.5))
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
      try ( Real gamma = new Real(128).set(0.5))
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
      try ( Real gamma = new Real(128).set(0.5))
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
      try ( Real g1 = new Real(128).set(0.25); Real g2 = new Real(128).set(0.5);
            Real g3 = new Real(128).set(0.75))
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
      try ( Real gamma = new Real(128).set(0.5))
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
      try ( Real gamma = new Real(128).set(0.5))
      {
        RealMatrix M = builder.setFractionalOrder(gamma).build(5);
        assertEquals("should build successfully in try-with-resources", 6, M.getNumRows());
      }
    }
  }
}
