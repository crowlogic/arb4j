package arb;

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
    assertNotNull(dataSet.data);
    assertEquals(2, dataSet.data.getNumRows());
    assertEquals(TEST_LENGTH, dataSet.data.getNumCols());
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

    // Verify they reference the correct matrix rows
    assertSame(dataSet.data.getRow(0), xValues);
    assertSame(dataSet.data.getRow(1), yValues);
  }

  public void testGet()
  {
    // Test valid dimension indices
    for (int i = 0; i < TEST_LENGTH; i++)
    {
      double x = dataSet.get(0, i);
      double y = dataSet.get(1, i);

      assertEquals(dataSet.data.get(0, i).getMid().doubleValue(), x, EPSILON);
      assertEquals(dataSet.data.get(1, i).getMid().doubleValue(), y, EPSILON);
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

    String expectedName = String.format("varianceStructure(%s,n=%s)",
                                        dataSet.toString(),
                                        structureSize);
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

    assertNotSame(dataSet.data, dataSet2.data);
    assertEquals(TEST_LENGTH, dataSet.getDataCount());
    assertEquals(50, dataSet2.getDataCount());

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
    emptyDataSet.data.close();
    // Simulate null data
    emptyDataSet.close(); // Should handle gracefully
  }
}
