
package arb.geometry.differential;

import java.awt.Graphics2D;

import arb.Complex;
import arb.Real;
import arb.RealRootInterval;
import arb.RootLocatorOptions;
import arb.Roots;
import arb.functions.complex.CircularComposition;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.ImaginaryPart;
import arb.functions.real.LevelSet;
import arb.functions.real.RealComplexPart;
import arb.functions.real.RealPart;
import arb.geometry.Manifold;
import arb.geometry.curves.ComplexCircle;
import arb.geometry.curves.Curve;
import arb.geometry.curves.LevelCurve;
import arb.geometry.surfaces.LevelSurface;

/**
 * Parallel transport (or parallel translation) is a way of transporting
 * geometrical data along smooth {@link Curve} in a {@link Manifold}. If the
 * manifold is equipped with an {@link AffineConnection} (a covariant derivative
 * or connection on the tangent bundle), then this connection allows one to
 * transport vectors of the manifold along curves so that they stay parallel
 * with respect to the connection.
 * 
 * TODO: morph into something that will serve as a {@link LevelSet},
 * {@link LevelCurve}, {@link LevelSurface} ...
 * 
 * @param <P> the class of function representing the manifold
 */
public class ParallelTransporter<P extends HolomorphicFunction> implements
                                AutoCloseable
{
  public static enum What
  {
   Real,
   Imag
  }

  public Real    dt;

  public What    what;

  public Complex basepoint;

  public Real    θ = new Real();

  public Real    ρ = new Real();

  @Override
  public void close() throws Exception
  {
    θ.clear();
    ρ.clear();
    basepoint.clear();
    dt.clear();
  }

  /**
   * 
   * @param surface
   * @param t0      base-point from which to start flowing from
   * @param dt      the step-size which must be small enough not to miss any
   *                important features of the surface
   * @param what    specifies what part of the complex-valued function to minimize
   * @param θ0      initial angle
   * @param θradius angular radius
   */
  public ParallelTransporter(P surface, Complex t0, Real dt, What what, Real θ0, Real θwidth)
  {
    this.surface   = surface;
    this.dt        = dt;
    this.basepoint = t0;
    this.what      = what;
    this.θ.set(θ0);
    this.ρ.set(θwidth);
    direction = new CircularComposition<P>(surface,
                                           new ComplexCircle(basepoint,
                                                             dt));
    switch (what)
    {
    case Real:
      field = new RealPart(direction);
      break;
    case Imag:
      field = new ImaginaryPart(direction);
      break;

    default:

      throw new UnsupportedOperationException("TODO: implement " + what);
    }

  }

  P                      surface;

  CircularComposition<P> direction;

  final RealComplexPart  field;

  public void flow() throws InterruptedException
  {
    {

      RealRootInterval zeroPointInterval = new RealRootInterval();
      θ.getMid().sub(ρ.getMid(), 128, zeroPointInterval.getA());
      θ.getMid().add(ρ.getMid(), 128, zeroPointInterval.getB());

      System.out.println("Locating over " + zeroPointInterval);

      Roots root = field.locateRoots(new RootLocatorOptions(zeroPointInterval,
                                                            1500,
                                                            50000,
                                                            1,
                                                            512));
      System.out.println("Located  " + zeroPointInterval);
      System.out.println("Refining...");
      root.refine(field, 256, 100, true);
      System.out.println("root=" + root);
      Complex hmm = new Complex(root.get(0).getReal(new Real(), 128));

      System.out.println("angle(w)=" + direction.evaluate(hmm, 1, 512, new Complex()));

      Thread.sleep(60 * 1000);

    }

  }

  public void trace(Graphics2D graphics)
  {
    throw new UnsupportedOperationException("TODO: implement this after transition from Java2d to LWJGL is completed");
  }

}
