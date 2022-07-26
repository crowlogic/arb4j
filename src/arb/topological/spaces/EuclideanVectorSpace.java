package arb.topological.spaces;

import arb.*;

public interface EuclideanVectorSpace extends
                                      VectorSpace,
                                      EuclideanSpace
{
  public int dimension();

  public Real getCoordinate(int dim);
}
