package arb.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * an injective function (also known as injection, or one-to-one function) is a
 * function f that maps distinct elements of its domain to distinct elements;
 * that is, f(x1) = f(x2) implies x1 = x2. (Equivalently, x1 ≠ x2 implies f(x1)
 * ≠ f(x2) in the equivalent contrapositive statement.) In other words, every
 * element of the function's codomain is the image of at most one element of its
 * domain.[1] The term one-to-one function must not be confused with one-to-one
 * correspondence that refers to bijective functions, which are functions such
 * that each element in the codomain is an image of exactly one element in the
 * domain.
 * 
 * A homomorphism between algebraic structures is a function that is compatible
 * with the operations of the structures. For all common algebraic structures,
 * and, in particular for vector spaces, an injective homomorphism is also
 * called a monomorphism.
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface Injective
{

}
