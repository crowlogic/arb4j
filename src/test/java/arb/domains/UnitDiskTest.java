package arb.domains;

import arb.*;
import junit.framework.TestCase;

public class UnitDiskTest extends
                          TestCase
{

  @Override
  protected void tearDown() throws Exception
  {
    pointInside.close();
    pointOutside.close();
    pointOnBoundary.close();
  }

  private Complex pointInside;
  private Complex pointOnBoundary;
  private Complex pointOutside;

  public void setUp()
  {
    pointInside     = new Complex(RealConstants.half,
                                  RealConstants.half);
    pointOnBoundary = new Complex(RealConstants.one,
                                  RealConstants.zero);
    pointOutside    = new Complex(new Real(1.5),
                                  RealConstants.zero);
  }

  public void testContainsOpen()
  {
    UnitDisk openDisk = new UnitDisk(false);

    assertTrue("Point inside should be contained in an open disk", openDisk.contains(pointInside));
    assertFalse("Point on boundary should not be contained in an open disk", openDisk.contains(pointOnBoundary));
    assertFalse("Point outside should not be contained in an open disk", openDisk.contains(pointOutside));
  }

  public void testContainsClosed()
  {
    UnitDisk closedDisk = new UnitDisk(true);

    assertTrue("Point inside should be contained in a closed disk", closedDisk.contains(pointInside));
    assertTrue("Point on boundary should be contained in a closed disk", closedDisk.contains(pointOnBoundary));
    assertFalse("Point outside should not be contained in a closed disk", closedDisk.contains(pointOutside));
  }
}
