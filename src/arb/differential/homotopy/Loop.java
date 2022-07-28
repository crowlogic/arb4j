package arb.differential.homotopy;

import arb.curves.*;
import arb.topological.Space;

/**
 * Let X be a topological {@link Space}. A {@link Path} in X is a continuous map
 * γ:[0,1]→X. You can think of this as a continuous parametric
 * {@link UnitSpeedCurve} γ(t) meaning that it has been normalized such that its
 * parameter ranges over t∈[0,1].
 * 
 * A path γ:[0,1]→X is called a {@link Loop} if γ(0)=γ(1). It is said to be a
 * loop <b>based at x</b> if γ(0)=γ(1)=x.
 */
public interface Loop extends
                      Path
{

}
