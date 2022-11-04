package arb.geometry.differential;

import java.util.function.BinaryOperator;

import arb.Metric;
import arb.geometry.surfaces.Surface;
import arb.topological.spaces.AmbientSpace;
import arb.topological.spaces.EuclideanSpace;
import arb.topological.spaces.TangentSpace;

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
 */
public class FirstFundamentalForm<S extends Surface> implements
                                 BinaryOperator<TangentSpace<S>>
{

  @Override
  public TangentSpace<S> apply(TangentSpace<S> t, TangentSpace<S> u)
  {
    
    assert false : "TODO";
    return null;
  }

}
