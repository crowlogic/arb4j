package arb;

import static java.lang.System.out;

import java.util.concurrent.atomic.AtomicInteger;

import junit.framework.TestCase;

public class RealTest extends
                      TestCase
{

  public void testDotProduct()
  {
    AtomicInteger a = new AtomicInteger(1);
    Real x = Real.newVector(3);
    x.name = "x";
    Real y = Real.newVector(3);
    y.name = "y";
    for ( int i = 0; i < 3; i++ )
    {
      x.get(i).set( a.getAndIncrement());
      y.get(i).set( a.getAndIncrement());
    }
    Real dp = x.dotProduct(y, 128, new Real());
    assertEquals( new Real("44",128), dp );
  }

}
