package arb.functions;

/**
 * A surjective function is a function whose image is equal to its codomain.
 * Equivalently, a function f f with domain X X and codomain Y Y is surjective
 * if for every y y in Y Y there exists at least one x x in X X with f ( x ) = y
 * f(x)=y.[1] Surjections are sometimes denoted by a two-headed rightwards arrow
 * (U+21A0 ↠ RIGHTWARDS TWO HEADED ARROW),[5] as in f : X ↠ Y . Symbolically, If
 * f : X → Y then f is said to be surjective if and only if f ( x ) = y ∀ y ∈ Y
 * , ∃ x ∈ X
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Surjective_function">SurjectiveFunction@Wikipedia</a>
 * @param <D>
 * @param <R>
 */
public interface SurjectiveFunction<D, R> extends
                                   Function<D, R>
{

}
