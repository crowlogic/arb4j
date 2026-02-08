package arb;

import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.CartesianProduct;
import arb.space.topological.VectorSpace;

/**
 * An ordered pair (a, b) is a pair of {@link Object}s. The order in which the
 * objects appear in the pair is significant: the ordered pair (a, b) is
 * different from the ordered pair (b, a) unless a = b. (In contrast, the
 * unordered pair {a, b} equals the unordered pair {b, a}.)
 * 
 * Ordered pairs are also called 2-tuples, or sequences (sometimes, lists in a
 * computer science context) of length 2. Ordered pairs of scalars are sometimes
 * called 2-dimensional vectors. (Technically, this is an abuse of terminology
 * since an {@link OrderedPair} need not be an element of a
 * {@link VectorSpace}.) The entries of an ordered pair can be other ordered
 * pairs, enabling the recursive definition of ordered n-tuples (ordered lists
 * of n objects). For example, the ordered triple (a,b,c) can be defined as (a,
 * (b,c)), i.e., as one pair nested in another.
 * 
 * In the ordered pair (a, b), the object a is called the first entry, and the
 * object b the second entry of the pair. Alternatively, the objects are called
 * the first and second components, the first and second coordinates, or the
 * left and right projections of the ordered pair.
 * 
 * {@link CartesianProduct} and binary relations (and hence functions) are
 * defined in terms of ordered pairs.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class OrderedPair<A, B>
{
  @Override
  public int hashCode()
  {
    return Objects.hash(a, b);
  }

  @Override
  public boolean equals(Object obj)
  {
    return this == obj ? true : obj instanceof OrderedPair other
                                    ? Objects.equals(a, other.a) && Objects.equals(b, other.b)
                : false;
  }

  @Override
  public String toString()
  {
    return String.format("OrderedPair[a=%s, b=%s]", a, b);
  }

  public OrderedPair(A a, B b)
  {
    super();
    this.a = a;
    this.b = b;
  }

  public A a;
  public B b;

  public A getLeft()
  {
    return a;
  }

  public B getRight()
  {
    return b;
  }

}
