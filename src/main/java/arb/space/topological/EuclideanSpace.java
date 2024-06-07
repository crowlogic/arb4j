package arb.space.topological;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * EuclideanSpace represents the classical Euclidean space. It is a type of
 * manifold and a metric space where the distance is defined by the Euclidean
 * distance formula.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface EuclideanSpace extends
                                MetricSpace,
                                LocallyCompactHausdorffSpace<Real>
{

  @Override
  default Real distance(int bits, Real x, Real y, Real res)
  {
    try ( Real diff = res.dim >= intrinsicDimension() ? res : Real.newVector(intrinsicDimension()))
    {
      x.sub(y, bits, res).pow(2, bits).sum(bits, res);
    }
    return res;
  }
}
