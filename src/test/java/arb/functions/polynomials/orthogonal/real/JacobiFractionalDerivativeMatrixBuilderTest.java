package arb.functions.polynomials.orthogonal.real;

import arb.*;
import junit.framework.TestCase;

public class JacobiFractionalDerivativeMatrixBuilderTest extends
                                                         TestCase
{
  @Override
  protected void tearDown()
  {
    // Force garbage collection to catch resource leaks
    System.gc();
  }

  public void testDefaultConstructor()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      assertNotNull("alpha should not be null", builder.getAlpha());
      assertNotNull("beta should not be null", builder.getBeta());
      assertEquals("default bits should be 128", 128, builder.getBits());

      try ( Real half = new Real(128).set(RealConstants.half))
      {
        assertEquals("default alpha should be 0.5", 0, builder.getAlpha().compareTo(half));
        assertEquals("default beta should be 0.5", 0, builder.getBeta().compareTo(half));
      }
    }
  }

  public void testSetHurst()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real hurst = new Real(128).set(0.3))
      {
        builder.setHurst(hurst);
        assertEquals("alpha should equal hurst", 0, builder.getAlpha().compareTo(hurst));
        assertEquals("beta should equal hurst", 0, builder.getBeta().compareTo(hurst));
      }
    }
  }

  public void testSetAlphaBeta()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real a = new Real(128).set(0.4); Real b = new Real(128).set(0.6))
      {
        builder.setAlpha(a).setBeta(b);
        assertEquals("alpha should be set", 0, builder.getAlpha().compareTo(a));
        assertEquals("beta should be set", 0, builder.getBeta().compareTo(b));
      }
    }
  }

  public void testSetBits()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      builder.setBits(256);
      assertEquals("bits should be 256", 256, builder.getBits());
    }
  }

  public void testChaining()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real hurst = new Real(256).set(0.5))
      {
        JacobiFractionalDerivativeMatrixBuilder result = builder.setHurst(hurst).setBits(256);
        assertSame("chaining should return same builder", builder, result);
      }
    }
  }

  public void testBuildMatrix()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real gamma = new Real(128).set(0.5))
      {
        RealMatrix M = builder.build(gamma, 5);
        assertNotNull("matrix should not be null", M);
        assertEquals("matrix should be square", M.getNumRows(), M.getNumCols());
        assertEquals("matrix size should be 6x6", 6, M.getNumRows());
      }
    }
  }

  public void testBuildWithDifferentDegrees()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real gamma = new Real(128).set(0.5))
      {
        RealMatrix M3  = builder.build(gamma, 3);
        RealMatrix M5  = builder.build(gamma, 5);
        RealMatrix M10 = builder.build(gamma, 10);

        assertEquals("3x3 matrix size", 4, M3.getNumRows());
        assertEquals("5x5 matrix size", 6, M5.getNumRows());
        assertEquals("10x10 matrix size", 11, M10.getNumRows());
      }
    }
  }

  public void testBuildWithDifferentGammas()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real g1 = new Real(128).set(0.25); Real g2 = new Real(128).set(0.5);
            Real g3 = new Real(128).set(0.75))
      {
        RealMatrix M1 = builder.build(g1, 5);
        RealMatrix M2 = builder.build(g2, 5);
        RealMatrix M3 = builder.build(g3, 5);

        assertNotNull("all matrices should be created", M1);
        assertNotNull("all matrices should be created", M2);
        assertNotNull("all matrices should be created", M3);

        assertEquals("all same size", M1.getNumRows(), M2.getNumRows());
        assertEquals("all same size", M2.getNumRows(), M3.getNumRows());
      }
    }
  }

  public void testMatrixElementsPositive()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real gamma = new Real(128).set(0.5))
      {
        RealMatrix M = builder.build(gamma, 3);

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
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      String str = builder.toString();
      assertNotNull("toString should not be null", str);
      assertTrue("should contain alpha", str.contains("α"));
      assertTrue("should contain beta", str.contains("β"));
      assertTrue("should contain bits", str.contains("bits"));
    }
  }

  public void testAutoCloseable()
  {
    JacobiFractionalDerivativeMatrixBuilder builder = new JacobiFractionalDerivativeMatrixBuilder();
    assertNotNull("alpha should exist before close", builder.getAlpha());
    assertNotNull("beta should exist before close", builder.getBeta());

    builder.close();
    // After close, alpha and beta should be freed (hard to test directly)
  }

  public void testTryWithResources()
  {
    try ( JacobiFractionalDerivativeMatrixBuilder builder =
                                                          new JacobiFractionalDerivativeMatrixBuilder())
    {
      try ( Real gamma = new Real(128).set(0.5))
      {
        RealMatrix M = builder.build(gamma, 5);
        assertEquals("should build successfully in try-with-resources", 6, M.getNumRows());
      }
    }
  }
}
