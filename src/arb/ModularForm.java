package arb;

import arb.functions.complex.HolomorphicFunction;
import arb.functions.complex.MeromorphicFunction;
import arb.groups.Group;
import arb.groups.LieGroup;
import arb.groups.ModularGroup;

/**
 * a modular form is a (complex) analytic function on the upper half-plane
 * satisfying a certain kind of functional equation with respect to the
 * {@link Group} action of the {@link ModularGroup}, and also satisfying a
 * growth condition. The theory of modular forms therefore belongs to complex
 * analysis but the main importance of the theory has traditionally been in its
 * connections with number theory. Modular forms appear in other areas, such as
 * algebraic topology, sphere packing, and string theory.
 * 
 * A modular function is a function that is invariant with respect to the
 * modular group, but without the condition that f (z) be holomorphic in the
 * upper half-plane (among other requirements). Instead, modular functions are
 * {@link MeromorphicFunction}s (that is, they are {@link HolomorphicFunction}s
 * on the complement of a set of isolated points, which are poles of the
 * function).
 * 
 * Modular form theory is a special case of the more general theory of
 * automorphic forms which are functions defined on {@link LieGroup} which
 * transform nicely with respect to the action of certain discrete subgroups,
 * generalizing the example of the {@link ModularGroup} SL2(Z)⊂SL2(R)
 * 
 *
 */
public interface ModularForm
{

}
