package arb.theoretical.physics;

import arb.groups.Group;
import arb.groups.LieGroup;

/**
 * A gauge theory is a type of {@link FieldTheory} in which the Lagrangian (and
 * hence the dynamics of the system itself) does not change (is invariant) under
 * local transformations according to certain {@link LieGroup}s which are smooth
 * families of operations.
 * 
 * The term gauge refers to any specific mathematical formalism to regulate
 * redundant degrees of freedom in the Lagrangian of a physical system. The
 * transformations between possible gauges, called gauge transformations, form a
 * Lie group—referred to as the symmetry group or the gauge group of the theory.
 * Associated with any Lie group is the Lie algebra of group generators. For
 * each group generator there necessarily arises a corresponding field (usually
 * a vector field) called the gauge field. Gauge fields are included in the
 * Lagrangian to ensure its invariance under the local {@link Group}
 * transformations (called gauge invariance). When such a theory is quantized,
 * the quanta of the gauge fields are called gauge bosons. If the symmetry group
 * is non-commutative, then the gauge theory is referred to as non-abelian gauge
 * theory, the usual example being the {@link YangMillsTheory}.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Gauge_theory">Wikipedia</a>
 * 
 *      Note: the way a gauge regulates 'redundant' or overspecified
 *      'degress-of-freedom' is very similiar to how the exponential-powerlaw
 *      approximation is introduced which would have tens to hundreds of
 *      functional units that are completely determined by just a few
 *      parameters,. 2 to 5 or so.. enough to be said to be "low dimensional"
 * 
 * @author crowlogic@proton.me
 */
public interface GaugeTheory extends
                             FieldTheory
{

}
