package arb;

import static arb.RealConstants.one;
import static arb.utensils.Utilities.println;

import java.util.concurrent.atomic.AtomicInteger;

import arb.stochastic.GaussianDistribution;
import arb.stochastic.StandardGaussianDistribution;
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
    Real sumOfrSquares = r.covariance(r, prec, new Real());
    assertEquals(0.66666666666666666667, sumOfrSquares.doubleValue(), Math.pow(10, -20));
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
    Real sumOfrSquares = r.covariance(p, prec, new Real());
    assertEquals(0.66666666666666666667, sumOfrSquares.doubleValue(), Math.pow(10, -20));

  }

  public static void testCovariance3()
  {
    Real r = Real.newVector(100000);
    r.randomlyGenerate(new StandardGaussianDistribution(), new RandomState(2022), prec);
    Real p = Real.newVector(100000);
    p.randomlyGenerate(new StandardGaussianDistribution(), new RandomState(31337), prec);
    Real rpCorrelation = r.covariance(p, prec, new Real());
    assertEquals(0, rpCorrelation.doubleValue(), Math.pow(10, -4));
  }

  public static void testNormalize()
  {
    Real r = Real.newVector(100000);
    r.randomlyGenerate(new GaussianDistribution(RealConstants.zero,
                                                new Real("2",
                                                         128)),
                       new RandomState(2022),
                       prec);
    assertEquals(2, r.standardDeviation(128, new Real()).doubleValue(), 0.01);
    r.normalize(prec, r);
    assertEquals(1, r.standardDeviation(128, new Real()).doubleValue(), Math.pow(10, -15));
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
