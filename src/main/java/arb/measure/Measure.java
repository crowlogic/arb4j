package arb.measure;

import arb.Real;
import arb.functions.Function;

/**
 * A (set) {@link Function} from Σ to {@link Real} is a {@link Measure} if it
 * satisfies the following properties:
 * 
 * Non-negativity: μ(E)≥0 ∀ E∈Σ Null empty set: μ(∅)=0 σ-additivity :
 * μ(∑Eₖ(k=1..∞))=∑μ(Eₖ)(k=1..∞) ∀ countable collections of pairwise disjoint
 * subsets {Eₖ}⊂Σ
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Measure_(mathematics)">Wikipedia</a>
 */
public interface Measure<X, Σ extends σField<X>> extends
                        Function<Σ, Real>
{

}
