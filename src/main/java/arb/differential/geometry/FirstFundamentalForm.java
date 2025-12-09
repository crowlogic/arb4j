package arb.differential.geometry;

import arb.Metric;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.AmbientSpace;
import arb.space.topological.BilinearForm;
import arb.space.topological.CartesianProduct;
import arb.space.topological.EuclideanSpace;
import arb.space.topological.TangentSpace;

/**
 * the {@link FirstFundamentalForm} is the inner product on the
 * {@link TangentSpace} of a {@link Surface} in three-dimensional
 * R={@link EuclideanSpace} which is induced canonically from the dot product of
 * R^3.
 * 
 * It facilitates the determination of the curvature and {@link Metric}
 * properties of a {@link Surface} ( such as length and area ) in a way that is
 * consistent with the surrounding {@link AmbientSpace}. The
 * {@link FirstFundamentalForm} is denoted by the Roman numeral I
 * 
 * @param <S> the {@link Surface} over which this form is defined
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FirstFundamentalForm<S extends Surface> implements
                                 BilinearForm<Real, TangentSpace<S, Real>>
{

  @Override
  public Real evaluate(CartesianProduct<TangentSpace<S,Real>, TangentSpace<S,Real>> t,
                       int order,
                       int bits,
                       Real res)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }


}
