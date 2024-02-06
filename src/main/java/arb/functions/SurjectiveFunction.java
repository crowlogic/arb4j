package arb.functions;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.annotations.Surjective;

/**
 * A surjective function is a function whose image is equal to its range.
 * Equivalently, a {@link Function} f with {@link Domain} X and range Y is surjective
 * if for every y y in Y Y there exists at least one x x in X X with f ( x ) = y
 * f(x)=y.[1] Surjections are sometimes denoted by a two-headed rightwards arrow
 * (U+21A0 ↠ RIGHTWARDS TWO HEADED ARROW),[5] as in f : X ↠ Y . Symbolically, If
 * f : X → Y then f is said to be surjective if and only if f ( x ) = y ∀ y ∈ Y
 * , ∃ x ∈ X
 * 
 * @param <D>
 * @param <R>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Surjective
public interface SurjectiveFunction<D, R> extends
                                   Function<D, R>
{

}
