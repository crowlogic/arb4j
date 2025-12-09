package arb.groups;

import java.util.function.BinaryOperator;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A {@link CommutativeGroup} is a {@link Group} A, together with a binary
 * operator called multiplication ⋅ that combines any two elements a,b of A to
 * form another element of A , denoted by a ⋅ b. The symbol ⋅ is a general
 * placeholder for a concretely given operation. To qualify as a
 * {@link CommutativeGroup}, the set and the {@link BinaryOperator},
 * 
 * <pre>
 * ( A , ⋅ )
 * </pre>
 * 
 * , must satisfy four requirements known as the {@link CommutativeGroup}
 * axioms:
 * 
 * <b>Associativity</b>: For all a a, b b, and c c in A A, the equation ( a ⋅ b
 * ) ⋅ c = a ⋅ ( b ⋅ c ) holds.
 * 
 * <b>Identity element</b>: There exists an element e e in A A, such that for
 * all elements a a in A A, the equation e ⋅ a = a ⋅ e = a holds.
 * 
 * <b>Inverse element</b>: For each a a in A A there exists an element b b in A
 * A such that a ⋅ b = b ⋅ a = e, where e e is the identity element.
 * Commutativity For all a a, b b in A A, a ⋅ b = b ⋅ a .
 * 
 * A Group in which the group operation is not commutative is called a
 * "non-abelian group" or "non-commutative group".
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CommutativeGroup<X> extends
                                 Group<X>
{

}
