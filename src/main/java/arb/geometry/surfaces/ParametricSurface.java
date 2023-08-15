package arb.geometry.surfaces;

import arb.Complex;
import arb.RealMatrix;
import arb.functions.ComplexToRealFunction;
import arb.space.topological.EuclideanSpace;

/**
 * A {@link ParametricSurface} is a {@link Surface} in the 3-dimensional
 * {@link EuclideanSpace}
 * 
 */
public interface ParametricSurface extends
                                   ComplexToRealFunction,
                                   Surface
{

  @Override
  default RealMatrix firstFundamentalForm(Complex point, int bits, RealMatrix result)
  {
    assert false : "todo: default methods returns func of E,F and G";
    return result;
  }

  @Override
  default RealMatrix secondFundamentalForm(Complex point, int bits, RealMatrix result)
  {
    assert false : "todo: default methods returns func of L,M,N";
    return result;
  }

}
