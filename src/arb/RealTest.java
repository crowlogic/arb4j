package arb;

import static java.lang.System.out;

import junit.framework.TestCase;

public class RealTest extends
                      TestCase
{

  public void testLockAndUnlock()
  {
    Real a = new Real("1.4", 128 );
    int pageSize = arb.getpagesize();
   
    a.lock();
    a.unlock();
  }

  public void testUnlock()
  {
    fail("Not yet implemented");
  }

}
