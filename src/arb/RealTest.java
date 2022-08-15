package arb;

import static java.lang.System.out;

import junit.framework.TestCase;

public class RealTest extends
                      TestCase
{

  public void testLockAndUnlock()
  {
    System.loadLibrary("arblib");
    int pagesize = arb.getpagesize();
    System.out.println("Pagesize=" + pagesize);
    long pointer = SWIGTYPE_p_void.getCPtr(arb.memalign(pagesize, Real.BYTES));
    System.out.format("pointer = 0x%x\n", pointer);
    try ( Real a = new Real(pointer,true) )
    {
      a.init();
      System.out.format("a=" + a+ " at 0x%x \n swigCptrFromMalloc=0x%x \n", pointer, Real.getCPtr(a) );
      a.set("2.14", 128);
      System.out.println("a=" + a);
      a.lock();
      a.unlock();
      out.println( "locked");
      a.set("3.14", 128);
      System.out.println("a=" + a);
      a.unlock();
      out.println( "unlocked");

    }
  }

  public void testUnlock()
  {
    fail("Not yet implemented");
  }

}
