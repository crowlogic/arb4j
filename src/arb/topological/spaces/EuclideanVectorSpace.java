package arb.topological.spaces;

import arb.Field;
import arb.Real;

public interface EuclideanVectorSpace<X extends Field> extends
                                     VectorSpace<X>,
                                     EuclideanSpace<X>,
                                     InnerProductSpace<X>
{
  public int dimension();

  public Real getCoordinate(int dim);
}
