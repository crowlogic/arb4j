package arb.domains;

import static arb.FloatConstants.*;
import static arb.FloatConstants.π;

import arb.*;
import junit.framework.*;

public class UnitIntervalTest extends
                              TestCase
{

  public void testContainsClosed()
  {
    UnitInterval interval = new UnitInterval(true);
    assertTrue(interval.contains(zero));
    assertTrue(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne));
  }

  public void testContainsOpen()
  {
    UnitInterval interval = new UnitInterval(false);
    assertFalse(interval.contains(zero));
    assertFalse(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne));
  }

  public void testContainsHalfOpen()
  {
    UnitInterval interval = new UnitInterval(true,
                                             false);
    assertTrue(interval.contains(zero));
    assertFalse(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne));
  }

  public void testContainsHalfClosed()
  {
    UnitInterval interval = new UnitInterval(false,
                                             true);
    assertFalse(interval.contains(zero));
    assertTrue(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne));
  }

}
