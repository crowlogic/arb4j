package arb;

import junit.framework.TestCase;

public class RealTest extends
                      TestCase
{

  public void testLockAndUnlock()
  {
    Real a = new Real("1.4", 128 );
    a.lock();
    a.unlock();
  }

  public void testUnlock()
  {
    fail("Not yet implemented");
  }

}
