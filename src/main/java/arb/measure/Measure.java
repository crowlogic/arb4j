package arb.measure;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * A {@link Measure} is a {@link Function} from a {@link σField} over X denoted
 * Σ to the {@link Real} numbers if it satisfies the following properties:
 * 
 * <pre>
 * Non-negativity: μ(E)≥0 ∀ E∈Σ 
 * Null empty set: μ(∅)=0 
 * σ-additivity  : μ(∑Eₖ(k=1..∞))=∑μ(Eₖ)(k=1..∞) ∀ {Eₖ}⊂Σ
 * </pre>
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Measure_(mathematics)">Wikipedia</a>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Measure<X, Σ extends σField<? extends X>> extends
                        Function<Σ, Real>
{

}
