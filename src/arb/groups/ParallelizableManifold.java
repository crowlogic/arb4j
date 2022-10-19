package arb.groups;

import arb.Complex;
import arb.geometry.DifferentiableManifold;

public interface ParallelizableManifold extends
                                        DifferentiableManifold
{
  /**
   * 
   * @return a set of n global smooth linearly independent vector fields.
   */
  public Complex parallelization();
}
