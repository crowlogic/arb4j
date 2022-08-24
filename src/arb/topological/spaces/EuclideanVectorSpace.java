package arb.topological.spaces;

import arb.*;

public interface EuclideanVectorSpace<X extends Field> extends
                                     VectorSpace<X>,
                                     EuclideanSpace<X>
{
  public int dimension();

  public Real getCoordinate(int dim);
}
