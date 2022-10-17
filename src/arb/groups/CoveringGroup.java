package arb.groups;

import arb.algebraic.topology.Homomorphism;

/**
 * a covering group of a topological group H is a covering space G of H such
 * that G is a topological group and the covering map p : G → H is a continuous
 * Group {@link Homomorphism}. The map p is called the covering {@link Homomorphism}. A
 * frequently occurring case is a double covering group, a topological double
 * cover in which H has index 2 in G; examples include the spin groups, pin
 * groups, and metaplectic groups.
 *
 */
public interface CoveringGroup extends
                               Group
{

}
