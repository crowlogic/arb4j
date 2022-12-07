package arb.functions.real.dynamics;

import static arb.RealConstants.one;
import static java.lang.Math.pow;
import static java.lang.System.err;
import static java.lang.System.out;

import java.util.ArrayList;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import arb.RealConstants;
import arb.RealRootInterval;
import arb.RootLocatorOptions;
import arb.Roots;
import arb.functions.complex.CircularSFunction;
import arb.functions.real.RealPart;
import arb.geometry.curves.ComplexCircle;
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
    CircularSFunction angle = new CircularSFunction(RealConstants.one,
                                                    new Real().set("0.1", 512));
    Real              a     = Real.newVector(2);
    a.set("-0.75", 128);

    Real             w            = angle.converge(true,
                                                   new Real("0.1",
                                                            prec),
                                                   a,
                                                   prec,
                                                   Real.newVector(2));

    RealRootInterval interval     = new RealRootInterval(-.8,
                                                         -0.7);
    Complex          locatedRoot  = locateRoot(interval, angle);
    Real             locatedAngle = locatedRoot.getReal();

    System.out.println("locatedAngle=" + locatedAngle);
    out.printf("locatedAngle=%s locatedRoot=%s\n", locatedAngle, locatedRoot);

    Real θ = w.get(0);
    assertEquals(θ.doubleValue(), locatedAngle.doubleValue(), pow(10, -13));

  }

  final static int prec = 128;

  public void testSOrbit()
  {
    out.println("===========testSOrbit===============");

    ArrayList<Complex> coordinates = new ArrayList<>();
    coordinates.add(new Complex());

    try ( Real c = Real.newVector(2); Real h = new Real("0.05",
                                                        128);
          CircularSFunction disc = new CircularSFunction(one,
                                                         h);
          Complex value = Complex.newVector(2); FloatInterval location = new FloatInterval())
    {
      h.printPrecision = true;
      Real a = Real.newVector(2);
      a.printPrecision = true;
      a.π(prec).div(4, prec).neg(); // a=-π/4=-45°
      ComplexCircle circle = disc.g;
      for (int i = 0; i < 16; i++)
      {
        String initialAngle    = Double.toString(Math.toDegrees(a.doubleValue()));
        String initialPosition = circle.center.toString();
        Real   w               = disc.converge(true,
                                               new Real("0.025",
                                                        prec),
                                               a,
                                               prec,
                                               c);                                       // a=initial angle, c=angle
                                                                                         // to step
        // towards
        String newAngle        = Double.toString(Math.toDegrees(c.get(0).doubleValue()));

        value.setRealObj(c.get(0));
        value.setImagObj(c.get(1));
        a.set(value.getReal());

        disc.g.shift(a, prec, h);
        out.format("Shifted position to %s ", circle.center.toString());
        coordinates.add(new Complex(circle.center));
        // value.getReal().set(value.getReal().doubleValue(RoundingMode.Near));

        disc.f.evaluate(circle.center, 2, prec, value);
        out.println("in the direction of " + newAngle + " from " + initialAngle + "@" + initialPosition);
        assertEquals(0, Math.abs(value.get(0).getReal().doubleValue()), Math.pow(10, -3));
        // TODO: check for divergence of real part
      }
      err.println("TODO: check for divergence and enforce modulo π");
    }

    out.println("coordinates= " + coordinates);
  }

  public Complex locateRoot(RealRootInterval interval, CircularSFunction radialVector)
  {
    RealPart           realAngle = new RealPart(radialVector);

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
