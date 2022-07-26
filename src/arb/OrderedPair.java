package arb;

import arb.topological.spaces.VectorSpace;

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
 * Cartesian products and binary relations (and hence functions) are defined in
 * terms of ordered pairs.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Ordered_pair">Wikipedia</a>
 *
 */
public class OrderedPair<A, B>
{
  public OrderedPair()
  {

  }

  public OrderedPair(A a, B b)
  {
    super();
    this.a = a;
    this.b = b;
  }

  public A a;
  public B b;

}
