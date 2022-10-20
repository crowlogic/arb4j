package arb.topological;

import arb.topology.transformations.Homeomorphism;

/**
 * Let X be a {@link TopologicalSpace}. A covering of X is a continuous function
 * 
 * π : E → X
 * 
 * such that there exists a discrete space D and for every x∈X an open
 * neighborhood U⊂X , such that π^(−1)(U)=⨆d∈D(V_d) and π|V_d:V_d→U is a
 * {@link Homeomorphism} for every d∈D
 * 
 */
public interface Covering
{

}
