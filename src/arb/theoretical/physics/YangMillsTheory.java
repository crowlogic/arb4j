package arb.theoretical.physics;

import arb.groups.LieGroup;
import arb.groups.SpecialUnitaryGroup;
import arb.physics.*;
import arb.physics.forces.*;

/**
 * Yang–Mills theory is a {@link GaugeTheory} based on the
 * {@link SpecialUnitaryGroup} SU(N), or more generally any compact, reductive
 * Lie algebra. The theory seeks to describe the behavior of <b>elementary
 * particles</b> using these non-commutative {@link LieGroup}s and is at the
 * core of the unification of the {@link ElectromagneticForce} and
 * {@link WeakForce}s (i.e. U(1) × SU(2)) as well as quantum chromodynamics, the
 * theory of the {@link StrongForce} (based on SU(3)). Thus it forms the basis
 * of our understanding of the {@link StandardModel} of particle physics.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Yang%E2%80%93Mills_theory">Wikipedia</a>
 */
public interface YangMillsTheory extends
                                 GaugeTheory
{

}
