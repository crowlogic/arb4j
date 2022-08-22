package arb.dynamical.systems;

import arb.theoretical.*;

/**
 * A delay embedding theorem gives the conditions under which a
 * {@link ChaoticDynamicalSystem} can be reconstructed from a sequence of
 * observations of the state of a {@link DynamicalSystem}. The reconstruction
 * preserves the properties of the dynamical system that do not change under
 * smooth coordinate changes (i.e., diffeomorphisms), but it does not preserve
 * the geometric shape of structures in phase space.
 */
public interface DelayEmbeddingTheorem extends
                                       Theorem
{

}
