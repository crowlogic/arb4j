package arb.measures;

import arb.Real;
import arb.Set;
import arb.functions.Function;

/**
 * Let X a {@link Set} and Σ a σ-algebra over X . A set function μ: from Σ to
 * the extended {@link Real} real number line is called a {@link Measure} if it
 * satisfies the following properties:
 * 
 * <b>Non-negativity<b>: For all E in Σ , we have μ (E)≥0.<br>
 * </b>Null empty set</b>: μ(∅)=0.<br>
 * <b>σ-additivity</b></b>: For all countable collections {Eₖ}(k=1..∞) of
 * pairwise disjoint sets in Σ we have μ(∑Eₖ(k=1..∞))=∑μ(Eₖ)(k=1..∞)
 *
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Measure_(mathematics)">Wikipedia</a>
 */
public interface Measure<Σ> extends
                        Function<Σ, Real>
{

}
