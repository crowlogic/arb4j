package arb;

import static arb.RealConstants.one;
import static arb.utensils.Utilities.println;
import static java.lang.System.out;

import java.util.concurrent.atomic.AtomicInteger;

import junit.framework.TestCase;

public class RealTest extends
                      TestCase
{

  private static final int prec = 128;

  public static void testCovariance()
  {
    Real r = Real.newVector(3);
    r.get(0).set("1.3", prec);
    r.get(1).set("2.3", prec);
    r.get(2).set("3.3", prec);
    Real sumOfrSquares = r.covariance(r, prec, new Real() );
    assertEquals( 2, sumOfrSquares.doubleValue() );
  }
  
  public static void testCovariance2()
  {
    Real r = Real.newVector(3);
    r.get(0).set("1", prec);
    r.get(1).set("2", prec);
    r.get(2).set("3", prec);
    Real p = Real.newVector(3);
    p.get(0).set("4", prec);
    p.get(1).set("5", prec);
    p.get(2).set("6", prec);
    Real sumOfrSquares = r.covariance(r, prec, new Real() );
    assertEquals( 2, sumOfrSquares.doubleValue() );
  }
  
  public static void testVecScalarSub()
  {
    Real r = Real.newVector(3);
    r.get(0).set("1.3", prec);
    r.get(1).set("2.3", prec);
    r.get(2).set("3.3", prec);
    Real rMinusOne = r.vecScalarSub(one, 128, Real.newVector(3));
    println(rMinusOne);
    assertEquals(3.9, rMinusOne.Σ(128, new Real()).doubleValue());
  }

  public void testInnerProduct()
  {
    AtomicInteger a = new AtomicInteger(1);
    try ( Real x = new Real(3); Real y = new Real(3))
    {
      x.name = "x";
      y.name = "y";
      for (int i = 0; i < 3; i++)
      {
        x.get(i).set(a.getAndIncrement());
        y.get(i).set(a.getAndIncrement());
      }
      Real dp = x.innerProduct(y, 128, new Real());
      assertEquals(new Real("44",
                            128),
                   dp);
    }
  }

}
