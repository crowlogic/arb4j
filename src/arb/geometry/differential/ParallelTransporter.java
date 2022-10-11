
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
import arb.functions.real.RealComplexPart;
import arb.functions.real.RealPart;
import arb.geometry.Manifold;
import arb.geometry.curves.ComplexCircle;
import arb.geometry.curves.Curve;

/**
 * Parallel transport (or parallel translation) is a way of transporting
 * geometrical data along smooth {@link Curve} in a {@link Manifold}. If the
 * manifold is equipped with an {@link AffineConnection} (a covariant derivative
 * or connection on the tangent bundle), then this connection allows one to
 * transport vectors of the manifold along curves so that they stay parallel
 * with respect to the connection.
 * 
 * The parallel transport for a {@link Connection} thus supplies a way of, in
 * some sense, moving the local geometry of a {@link Manifold} along a
 * {@link Curve}: that is, of connecting the geometries of nearby points. There
 * may be many notions of parallel transport available, but a specification of
 * one — one way of connecting up the geometries of points on a {@link Curve} —
 * is tantamount to providing a {@link Connection}. In fact, the usual notion of
 * connection is the infinitesimal analog of parallel transport. Or, vice versa,
 * parallel transport is the local realization of a {@link Connection}.
 * 
 * As parallel transport supplies a local realization of the connection, it also
 * supplies a local realization of the curvature known as holonomy. The
 * Ambrose–Singer theorem makes explicit this relationship between curvature and
 * holonomy.
 *
 * 
 * @param <P> the function class to flow thru
 */
public class ParallelTransporter<P extends HolomorphicFunction> implements
                                AutoCloseable
{
  public static enum What
  {
   Real,
   Imag,
   Phase,
   Magnitude
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
   * @param what    specifies what part of the scalar function of the surface to
   *                minimize
   */
  public ParallelTransporter(P surface, Complex t0, Real dt, What what, Real θ0, Real ρ)
  {
    this.surface   = surface;
    this.dt        = dt;
    this.basepoint = t0;
    this.what      = what;
    this.θ.set(θ0);
    this.ρ.set(ρ);
  }

  P surface;

  public void flow() throws InterruptedException
  {
    try ( CircularComposition<P> direction = new CircularComposition<P>(surface,
                                                                        new ComplexCircle(basepoint,
                                                                                          dt));)
    {

      /**
       * ρ controls the (angular) width of the sector that is searched over for a
       * minimum of the specified part of the function
       */
      RealComplexPart field;
      switch (what)
      {
      case Real:
        field = new RealPart(direction);
        break;
      case Imag:
        field = new ImaginaryPart(direction);
        break;
//      case Magnitude:
//        //field = new ComplexMagnitude(direction);
      default:

        throw new UnsupportedOperationException("TODO: implement " + what);
      }

      RealRootInterval zeroPointInterval = new RealRootInterval();
      θ.getMid().sub(ρ.getMid(), 128, zeroPointInterval.getA());
      θ.getMid().add(ρ.getMid(), 128, zeroPointInterval.getB());

//      try ( RealFunctionPlotter plotter = new RealFunctionPlotter(field,
//                                                                  zeroPointInterval,
//                                                                  new RealRootInterval(-0.001,
//                                                                                       0.001),
//                                                                  500))
//      {
//        plotter.plot();
//      }
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
