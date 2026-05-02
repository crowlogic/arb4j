package arb;

import io.fair_acc.dataset.DataSetError.ErrorType;
import junit.framework.TestCase;

public class RealDataSetTest extends
                             TestCase
{
  private RealDataSet         dataSet;
  private FloatInterval       domain;
  private static final int    TEST_LENGTH = 100;
  private static final double EPSILON     = 1e-10;

  @Override
  protected void setUp() throws Exception
  {
    super.setUp();
    domain  = new FloatInterval(-1.0,
                                1.0);
    dataSet = new RealDataSet("testDataSet",
                              TEST_LENGTH,
                              domain);
  }

  @Override
  protected void tearDown() throws Exception
  {
    if (dataSet != null)
    {
      dataSet.close();
    }
    if (domain != null)
    {
      domain.close();
    }
    super.tearDown();
  }

  public void testConstructor()
  {
    assertEquals("testDataSet", dataSet.getName());
    assertEquals(2, dataSet.getDimension());
    assertEquals(TEST_LENGTH, dataSet.getDataCount());
    assertNotNull(dataSet.getRealXValues());
    assertNotNull(dataSet.getRealYValues());
    assertEquals(TEST_LENGTH, dataSet.getRealXValues().size());
    assertEquals(TEST_LENGTH, dataSet.getRealYValues().size());
    assertFalse("default mode is symmetric", dataSet.isAsymmetric());
  }

  public void testGetDataCount()
  {
    assertEquals(TEST_LENGTH, dataSet.getDataCount());
  }

  public void testGetRealValues()
  {
    Real xValues = dataSet.getRealXValues();
    Real yValues = dataSet.getRealYValues();

    assertNotNull(xValues);
    assertNotNull(yValues);
    assertEquals(TEST_LENGTH, xValues.size());
    assertEquals(TEST_LENGTH, yValues.size());
  }

  public void testGet()
  {
    // Test valid dimension indices: midpoints of x and y.
    Real xRow = dataSet.getRealXValues();
    Real yRow = dataSet.getRealYValues();
    for (int i = 0; i < TEST_LENGTH; i++)
    {
      double x = dataSet.get(0, i);
      double y = dataSet.get(1, i);

      assertEquals(xRow.get(i).getMid().doubleValue(), x, EPSILON);
      assertEquals(yRow.get(i).getMid().doubleValue(), y, EPSILON);
    }
  }

  public void testGetInvalidDimension()
  {
    try
    {
      dataSet.get(-1, 0);
      fail("Should throw AssertionError for negative dimension");
    }
    catch (AssertionError e)
    {
      assertTrue(e.getMessage().contains("dimIndex=-1"));
    }

    try
    {
      dataSet.get(2, 0);
      fail("Should throw AssertionError for dimension > 1");
    }
    catch (AssertionError e)
    {
      assertTrue(e.getMessage().contains("dimIndex=2"));
    }
  }

  public void testGetInvalidIndex()
  {
    try
    {
      dataSet.get(0, TEST_LENGTH);
      fail("Should throw AssertionError for index >= data count");
    }
    catch (AssertionError e)
    {
      // Expected
    }
  }

  public void testGetResolution()
  {
    Float result   = new Float();
    Float returned = dataSet.getResolution(result);

    assertSame(result, returned);
    assertEquals(dataSet.resolution.doubleValue(), result.doubleValue(), EPSILON);

    result.close();
  }

  public void testToString()
  {
    String result = dataSet.toString();
    assertEquals("RealDataSet[testDataSet]", result);
  }

  public void testSetThrowsAssertion()
  {
    try
    {
      dataSet.set(null, false);
      fail("Should throw AssertionError");
    }
    catch (AssertionError e)
    {
      assertTrue(e.getMessage().contains("no can do"));
    }
  }

  public void testStructure()
  {
    // Initialize test data in the original dataset
    Real xVals = dataSet.getRealXValues();
    Real yVals = dataSet.getRealYValues();

    try ( Real temp = new Real())
    {
      for (int i = 0; i < TEST_LENGTH; i++)
      {
        xVals.get(i).set(i * 0.01);
        yVals.get(i).set(Math.sin(i * 0.01));
      }
    }

    int         structureSize = 50;
    RealDataSet structured    = dataSet.structure(structureSize);

    assertNotNull(structured);
    assertEquals(structureSize, structured.getDataCount());
    assertEquals(2, structured.getDimension());

    String expectedName = String.format("varianceStructure(%s,n=%s)", dataSet.toString(), structureSize);
    assertEquals(expectedName, structured.getName());

    // Verify resolution is copied
    try ( Float originalRes = new Float(); Float structuredRes = new Float())
    {
      dataSet.getResolution(originalRes);
      structured.getResolution(structuredRes);
      assertEquals(originalRes.doubleValue(), structuredRes.doubleValue(), EPSILON);
    }

    structured.close();
  }

  public void testMultipleDataSets()
  {
    RealDataSet dataSet2 = new RealDataSet("testDataSet2",
                                           50,
                                           domain);

    assertNotSame(dataSet.getRealXValues(), dataSet2.getRealXValues());
    assertNotSame(dataSet.getRealYValues(), dataSet2.getRealYValues());
    assertEquals(TEST_LENGTH, dataSet.getDataCount());
    assertEquals(50,          dataSet2.getDataCount());

    dataSet2.close();
  }

  public void testCloseIdempotency()
  {
    dataSet.close();
    dataSet.close(); // Should not throw

    // Create new dataset for tearDown
    dataSet = new RealDataSet("cleanup",
                              10,
                              domain);
  }

  public void testCloseWithNullData()
  {
    RealDataSet emptyDataSet = new RealDataSet("empty",
                                               10,
                                               domain);
    // close() must be idempotent and tolerate already-released storage.
    emptyDataSet.close();
    emptyDataSet.close();
  }

  // ── Phase 1 additions: error-bar interface ────────────────────────────

  public void testSymmetricErrorType()
  {
    assertEquals(ErrorType.NO_ERROR,  dataSet.getErrorType(0));
    assertEquals(ErrorType.SYMMETRIC, dataSet.getErrorType(1));
  }

  public void testAsymmetricErrorType()
  {
    RealDataSet asym = new RealDataSet("asym", 4, domain, true);
    try
    {
      assertEquals(ErrorType.NO_ERROR,   asym.getErrorType(0));
      assertEquals(ErrorType.ASYMMETRIC, asym.getErrorType(1));
      assertTrue(asym.isAsymmetric());
    }
    finally
    {
      asym.close();
    }
  }

  public void testErrorBarsZeroByDefault()
  {
    // Phase 1: dataset compiles and the renderer can query errors;
    // bars are zero-magnitude until phase 2 populates them.
    for (int i = 0; i < TEST_LENGTH; i++)
    {
      assertEquals(0.0, dataSet.getErrorPositive(0, i), EPSILON);
      assertEquals(0.0, dataSet.getErrorNegative(0, i), EPSILON);
      assertEquals(0.0, dataSet.getErrorPositive(1, i), EPSILON);
      assertEquals(0.0, dataSet.getErrorNegative(1, i), EPSILON);
    }
  }

  public void testSymmetricErrorRoundTrip()
  {
    // Symmetric: the radius of each Real cell is reported on both sides.
    // Magnitude is a 30-bit upper-bound float, so the read-back is an
    // upward-rounded approximation — use a relative tolerance.
    Real y = dataSet.getRealYValues();
    for (int i = 0; i < 5; i++)
    {
      y.get(i).getRad().set(0.25 + i);
    }
    for (int i = 0; i < 5; i++)
    {
      double expected = 0.25 + i;
      double tol      = Math.max(1e-9, expected * 1e-8);
      assertEquals(expected, dataSet.getErrorPositive(1, i), tol);
      assertEquals(expected, dataSet.getErrorNegative(1, i), tol);
    }
  }

  public void testAsymmetricErrorRoundTrip()
  {
    // Asymmetric: +error is re().getRad(), −error is im().getRad().
    RealDataSet asym = new RealDataSet("asym", 8, domain, true);
    try
    {
      Complex y = asym.getComplexYValues();
      for (int i = 0; i < 5; i++)
      {
        y.get(i).re().getRad().set(0.25 + i);
        y.get(i).im().getRad().set(0.10 + i);
      }
      for (int i = 0; i < 5; i++)
      {
        double pos    = 0.25 + i;
        double neg    = 0.10 + i;
        double posTol = Math.max(1e-9, pos * 1e-8);
        double negTol = Math.max(1e-9, neg * 1e-8);
        assertEquals(pos, asym.getErrorPositive(1, i), posTol);
        assertEquals(neg, asym.getErrorNegative(1, i), negTol);
      }
    }
    finally
    {
      asym.close();
    }
  }
}
