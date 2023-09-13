package arb.groups;

import arb.Complex;
import arb.Field;
import arb.geometry.DifferentiableManifold;

public interface ParallelizableManifold<X extends Field<X>> extends
                                       DifferentiableManifold<X>
{
  /**
   * 
   * @return a set of n global smooth linearly independent vector fields.
   */
  public Complex parallelization();
}
