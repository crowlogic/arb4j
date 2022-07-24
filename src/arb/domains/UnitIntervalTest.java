package arb.domains;

import static arb.ComplexConstants.*;
import static arb.RealConstants.*;
import static arb.RealConstants.π;

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
    assertFalse(interval.contains(negOne.getReal()));
  }

  public void testContainsOpen()
  {
    UnitInterval interval = new UnitInterval(false);
    assertFalse(interval.contains(zero));
    assertFalse(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne.getReal()));
  }
  
  public void testContainsHalfOpen()
  {
    UnitInterval interval = new UnitInterval(true,false);
    assertTrue(interval.contains(zero));
    assertFalse(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne.getReal()));
  }

  public void testContainsHalfClosed()
  {
    UnitInterval interval = new UnitInterval(false,true);
    assertFalse(interval.contains(zero));
    assertTrue(interval.contains(one));
    assertTrue(interval.contains(half));
    assertFalse(interval.contains(π));
    assertFalse(interval.contains(negOne.getReal()));
  }
  
}
