package arb.domains;

import static arb.FloatConstants.*;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UnitIntervalTest extends
                              TestCase
{

  public void testContainsClosed()
  {
    try ( UnitFloatInterval interval = new UnitFloatInterval(true))
    {
      assertTrue(interval.contains(zero));
      assertTrue(interval.contains(one));
      assertTrue(interval.contains(half));
      assertFalse(interval.contains(π));
      assertFalse(interval.contains(negOne));
    }
  }

  public void testContainsOpen()
  {
    try ( UnitFloatInterval interval = new UnitFloatInterval(false))
    {
      assertFalse(interval.contains(zero));
      assertFalse(interval.contains(one));
      assertTrue(interval.contains(half));
      assertFalse(interval.contains(π));
      assertFalse(interval.contains(negOne));
    }
  }

  public void testContainsHalfOpen()
  {
    try ( UnitFloatInterval interval = new UnitFloatInterval(true, false))
    {
      assertTrue(interval.contains(zero));
      assertFalse(interval.contains(one));
      assertTrue(interval.contains(half));
      assertFalse(interval.contains(π));
      assertFalse(interval.contains(negOne));
    }
  }

  public void testContainsHalfClosed()
  {
    try ( UnitFloatInterval interval = new UnitFloatInterval(false, true))
    {
      assertFalse(interval.contains(zero));
      assertTrue(interval.contains(one));
      assertTrue(interval.contains(half));
      assertFalse(interval.contains(π));
      assertFalse(interval.contains(negOne));
    }
  }

}
