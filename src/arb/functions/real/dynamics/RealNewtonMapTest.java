package arb.functions.real.dynamics;

import static java.lang.System.out;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.RealRootInterval;
import arb.RootLocatorOptions;
import arb.Roots;
import arb.functions.complex.CircularCompositionS;
import arb.functions.real.RealPart;
import junit.framework.TestCase;

/**
 * TODO: define something that traces out Equipotential curves where the real
 * part of the function defines the potential and the imaginary part defines the
 * 
 * @author crow
 *
 */
public class RealNewtonMapTest extends
                               TestCase
{
  Real z = Real.newVector(2);

  @SuppressWarnings("resource")
  public void testS()
  {
    CircularCompositionS angle = new CircularCompositionS(RealConstants.one,
                                                          new Real().set("0.1", 512));
    Real                 a     = Real.newVector(2);
    a.set("-0.75", 128);

    Real w = angle.converge(a, Real.newVector(2));

    System.out.println("awesome. 1/3rd of time needs to be spent sleeping");
    Complex locatedRoot  = locateRoot(angle);
    Real    locatedAngle = locatedRoot.getReal();

    System.out.println("locatedAngle=" + locatedAngle);
    out.printf("locatedAngle=%s locatedRoot=%s", locatedAngle, locatedRoot);

    Real θ = w.get(0);
    assertEquals(θ.doubleValue(), locatedAngle.doubleValue());

  }

  @SuppressWarnings("resource")
  public void testSOrbit()
  {
    Real                 h    = new Real().set("0.1", 256);
    CircularCompositionS disc = new CircularCompositionS(RealConstants.one,
                                                         h);
    Real                 a    = Real.newVector(2);
    a.set("-0.75", 128);
    Real w = disc.converge(a, Real.newVector(2));

    out.format("started out at %s and converged to %s", a, w);

  }

  public Complex locateRoot(CircularCompositionS radialVector)
  {
    RealPart           realAngle = new RealPart(radialVector);
    RealRootInterval   interval  = new RealRootInterval(-.8,
                                                        -0.7);
    RootLocatorOptions config    = new RootLocatorOptions(interval,
                                                          1500,
                                                          50000,
                                                          1,
                                                          512);
    Roots              root      = realAngle.locateRoots(config);
    root.refine(realAngle, 256, 100, true);
    System.out.println("root=" + root);
    Complex hmm = new Complex(root.get(0).getReal(new Real(), 512));

    System.out.println("angle(w)=" + radialVector.evaluate(hmm, 1, 512, new Complex()));
    return hmm;
  }

}
