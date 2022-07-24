package arb.differential.homotopy;

import arb.Field;
import arb.domains.UnitInterval;
import arb.functions.Function;
import arb.spaces.ProductSpace;

/**
 * two continuous functions from one topological space to another are called
 * homotopic (from Ancient Greek: ὁμός homós "same, similar" and τόπος tópos
 * "place") if one can be "continuously deformed" into the other, such a
 * deformation being called a homotopy (/həˈmɒtəpiː/, hə-MO-tə-pee;
 * /ˈhoʊmoʊˌtoʊpiː/, HOH-moh-toh-pee) between the two functions. A notable use
 * of homotopy is the definition of homotopy groups and cohomotopy groups,
 * important invariants in algebraic topology.
 * 
 * In practice, there are technical difficulties in using homotopies with
 * certain spaces. Algebraic topologists work with compactly generated spaces,
 * CW complexes, or spectra.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Homotopy">Wikipedia</a>
 *
 * @param <A>
 * @param <B>
 */
public interface Homotopy<A extends Field, B extends Field> extends
                         Function<ProductSpace<A, UnitInterval>, B>
{

}
