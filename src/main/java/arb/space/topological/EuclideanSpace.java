package arb.space.topological;

import arb.Field;
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
public interface EuclideanSpace<F extends Field<F>> extends
                               MetricSpace<F>,
                               LocallyCompactHausdorffSpace<F>,
                               VectorSpace<F>
{

  @Override
  default F distance(int bits, F x, F y, F res)
  {
    try ( F diff = res.dim() >= intrinsicDimension() ? res : res.newFieldElementVector(intrinsicDimension()))
    {
      x.sub(y, bits, res).pow(2, bits).sum(bits, res);
    }
    return res;
  }
}
