package arb.geometry.differential.homotopy;

import arb.geometry.curves.*;
import arb.topological.Space;

/**
 * Let X be a topological {@link Space}. A {@link Path} γ:[0,1]→X is called a
 * {@link Loop} if γ(0)=γ(1)=x then it is said to be a loop <b>based at x</b>.
 */
public interface Loop extends
                     Path
{

}
