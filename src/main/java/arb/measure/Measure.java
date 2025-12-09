package arb.measure;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * A {@link Function} from a {@link σField} over X denoted
 * Σ to the {@link Real} numbers is a {@link Measure} if it is:
 * 
 * <pre>
 * 1. non-negative for all Borel sets E∈Σ                         
 *       μ(E)≥0   
 * 2. equals zero on the empty set:                                 
 *       μ(∅)=0 
 * 3. σ-additive (the measure of the sum is the sum of the measure)                        
 *       μ(∑Eₖ)=∑μ(Eₖ)∀{Eₖ}⊂Σ
 *  </pre>

 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Measure<X, Σ extends σField<? extends X>> extends
                        Function<Σ, Real>
{

}
