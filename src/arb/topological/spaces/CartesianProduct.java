package arb.topological.spaces;

import arb.OrderedPair;
import arb.Set;
import arb.topological.TopologicalSpace;

/**
 * The Cartesian product of two {@link Set} A and B (also called the product
 * set, set direct product, or cross product) is defined to be the set of all
 * points (a,b) where a in A and b in B. It is denoted A×B, and is called the
 * Cartesian product since it originated in Descartes' formulation of analytic
 * geometry. <br>
 * <br>
 * 
 * In the Cartesian view, points in the plane are specified by their vertical
 * and horizontal coordinates, with points on a line being specified by just one
 * coordinate. The main examples of direct products are Euclidean three-space
 * (R×R×R, where R are the real numbers), and the plane (R×R).
 *
 * @see <a href="https://mathworld.wolfram.com/CartesianProduct.html">Wolfram
 *      Mathworld</a>
 * 
 * @param <A>
 * @param <B>
 */
public class CartesianProduct<A extends Set, B extends Set> extends
                             OrderedPair<A, B> implements
                             TopologicalSpace<CartesianProduct<A, B>>
{

  public CartesianProduct(A a, B b)
  {
    super(a,
          b);
    // TODO Auto-generated constructor stub
  }

}
