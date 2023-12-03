package arb.geometry.surfaces;

import arb.Complex;
import arb.Real;
import arb.RealMatrix;
import arb.geometry.Manifold;
import arb.space.topological.EuclideanSpace;

/**
 * A surface is a two-dimensional {@link Manifold}. Some surfaces arise as the
 * boundaries of three-dimensional solids; for example, the sphere is the
 * boundary of the solid ball. Other surfaces arise as graphs of functions of
 * two variables; see the figure at right. However, surfaces can also be defined
 * abstractly, without reference to any ambient space. For example, the Klein
 * bottle is a surface that cannot be embedded in three-dimensional
 * {@link EuclideanSpace}.
 * 
 * Topological surfaces are sometimes equipped with additional information, such
 * as a Riemannian metric or a complex structure, that connects them to other
 * disciplines within mathematics, such as differential geometry and complex
 * analysis. The various mathematical notions of surface can be used to model
 * surfaces in the physical world.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Surface_(topology)">Wikipedia</a>
 */
public interface Surface extends
                         Manifold<Complex>
{

  @Override
  default int dim()
  {
    return 1;
  }

  /**
   * Computes the first fundamental form at a given point.
   * 
   * The first fundamental form, often denoted by I, is a symmetric
   * positive-definite quadratic form that describes the inner product on the
   * tangent plane at each point of the surface. It allows us to measure lengths,
   * angles, and areas.
   *
   * @param point  A point on the surface.
   * @param bits   TODO
   * @param result TODO
   * @return The first fundamental form as a matrix at the given point.
   */
  RealMatrix firstFundamentalForm(Complex point, int bits, RealMatrix result);

  /**
   * Computes the second fundamental form at a given point.
   * 
   * The second fundamental form, denoted by IIIIII, measures how the surface
   * bends within the ambient space. It is used to calculate normal curvature and,
   * together with the first fundamental form, it can be used to calculate the
   * Gaussian curvature.
   *
   * @param point  A point on the surface.
   * @param bits   TODO
   * @param result TODO
   * @return The second fundamental form as a matrix at the given point.
   */
  RealMatrix secondFundamentalForm(Complex point, int bits, RealMatrix result);

  /**
   * Calculates the Gaussian curvature at a given point on the surface.
   *
   * @param point  A point on the surface.
   * @param bits
   * @param result
   * @return the result after having been assigned the value of the Gaussian
   *         curvature at the given point.
   */
  default Real gaussianCurvature(Complex point, int bits, Real result)
  {
    RealMatrix I     = firstFundamentalForm(point, bits, null);
    RealMatrix II    = secondFundamentalForm(point, bits, null);

    // Compute the determinants of I and II
    Real       detI  = I.determinant(bits, new Real());
    Real       detII = II.determinant(bits, new Real());

    // Compute the Gaussian curvature as the ratio of the determinants
    return detII.div(detI, bits, result);
  }

  /**
   * Computes the mean curvature at a given point on the surface.
   * 
   * The mean curvature, H, can be expressed as: H = (L * N - M^2) / (2 * (E * N -
   * F^2)) where E, F, G are coefficients of the first fundamental form and L, M,
   * N are coefficients of the second fundamental form.
   *
   * @param point  A point on the surface.
   * @param bits   TODO
   * @param result TODO
   * @return The mean curvature at the given point.
   */
  default Real meanCurvature(Complex point, int bits, Real result)
  {
    RealMatrix I           = firstFundamentalForm(point, bits, null);
    RealMatrix II          = secondFundamentalForm(point, bits, null);

    // Extracting the coefficients of the first and second fundamental forms
    Real       E           = I.get(0, 0);
    Real       F           = I.get(0, 1);
    Real       G           = I.get(1, 1);
    Real       L           = II.get(0, 0);
    Real       M           = II.get(0, 1);
    Real       N           = II.get(1, 1);

    // Calculating the mean curvature
    Real       numerator   = L.mul(N, bits, new Real()).sub(M.mul(M, bits, new Real()), bits, new Real());
    Real       denominator = E.mul(N, bits, new Real())
                              .sub(F.mul(F, bits, new Real()), bits, new Real())
                              .mul(new Real(2), bits, new Real());

    return numerator.div(denominator, bits, result);
  }

  /**
   * Computes the third fundamental form at a given point.
   * 
   * The third fundamental form is given by the relation: III - 2 * H * II + K * I
   * = 0 where H is the mean curvature and K is the Gaussian curvature of the
   * surface.
   *
   * @param point  A point on the surface.
   * @param bits   TODO
   * @param result TODO
   * @return The third fundamental form as a matrix at the given point.
   */
  default RealMatrix thirdFundamentalForm(Complex point, int bits, RealMatrix result)
  {
    // Compute the first and second fundamental forms
    try ( RealMatrix I = firstFundamentalForm(point, bits, RealMatrix.newMatrix(2, 2));
          RealMatrix II = secondFundamentalForm(point, bits, RealMatrix.newMatrix(2, 2));

          // Compute the Gaussian curvature
          Real K = gaussianCurvature(point, bits, new Real());

          // Compute the mean curvature (assumed to be defined elsewhere)
          Real H = meanCurvature(point, bits, new Real());)
    {
      // Compute the third fundamental form according to the given relation:
      // III - 2 * H * II + K * I = 0
      return I.mul(K, bits, result).sub(II.mul(H.mul(2, bits), bits, result), bits, result);
    }
  }

}
