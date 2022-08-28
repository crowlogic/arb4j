package arb.topological.spaces;

import arb.Complex;
import arb.Field;
import arb.Metric;
import arb.Real;
import arb.Set;
import arb.topological.Topology;

/**
 * An inner product space (or, rarely, a Hausdorff pre-Hilbert space[1][2]) is a
 * {@link Real} {@link VectorSpace} or a {@link Complex} {@link VectorSpace}
 * with an operation called an inner product. The inner product of two vector in
 * the space is a scalar, often denoted with angle brackets such as in ⟨a,b⟩.
 * Inner products allow formal definitions of intuitive geometric notions, such
 * as lengths, angles, and orthogonality (zero inner product) of vectors. Inner
 * product spaces generalize {@link EuclideanVectorSpace}, in which the inner
 * product is the dot product or scalar product of Cartesian coordinates. Inner
 * product spaces of infinite dimension are widely used in functional analysis.
 * Inner product spaces over the field of complex numbers are sometimes referred
 * to as unitary spaces. The first usage of the concept of a vector space with
 * an inner product is due to Giuseppe Peano, in 1898.
 * 
 * An inner product naturally induces an associated norm, |y| in the picture);
 * so, every inner product space is a normed vector space. If this normed space
 * is also complete (that is, a {@link BanachSpace}) then the inner product
 * space is a Hilbert space.[1] If an inner product space H is not a Hilbert
 * space, it can be extended by completion to a {@link HilbertSpace} H ¯ . This
 * means that H is a linear subspace of H¯ , the inner product of H is the
 * restriction of that of H¯ , and H is dense in H¯ for the {@link Topology}
 * defined by the norm
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Inner_product_space">InnerProductSpace@Wikipedia</a>
 * @param <X>
 */
public interface InnerProductSpace<X extends Field> extends
                                  NormedVectorSpace<X>
{

  @Override
  default Metric<X> metric()
  {
    return (P, order, prec, res) ->
    {
      return P.a.innerProduct(P.b, prec, res);
    };
  }

  public Real innerProduct(X that, int prec, Real result);
}
