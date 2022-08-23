package arb.operators;

import arb.Real;
import arb.topological.spaces.HilbertSpace;

/**
 * A linear mapping A of a set D_A in a {@link HilbertSpace} H (in general,
 * complex) into H such that ⟨Ax,y⟩=⟨x,yA⟩ for all x,y∈D_A. If DA is an
 * everywhere-dense linear manifold in H (and this is assumed in what follows),
 * then A is a linear operator. If DA=H, then A is bounded and hence continuous
 * on H. A symmetric operator A induces a bilinear Hermitian form B(x,y)=⟨Ax,y⟩
 * on DA, that is, B(x,y)=B(x,y). The corresponding quadratic form ⟨Ax,x⟩ is
 * real. Conversely, if the form ⟨Ax,x⟩ on DA is real, then A is symmetric. The
 * sum A+B of two symmetric operators A and B with a common domain of definition
 * DA=DB is again a {@link SymmetricOperator}, while if λ is a {@link Real}
 * number, then λA is also symmetric. Every symmetric operator A has a uniquely
 * defined closure Aoverbar and an adjoint A^*⊃Aoverbar. In general, A^* is not
 * symmetric and A^∗≠Aoverbar. If A^∗=A, then A is called a self-adjoint
 * operator. This holds, for example, in the case of symmetric operators defined
 * on the whole of H. If A is symmetric and bounded on DA, then A can be
 * extended as a bounded symmetric operator to the whole Hilbert space H.
 * 
 * @see <a href=
 *      "https://encyclopediaofmath.org/wiki/Symmetric_operator">SymmetricOperator@EncyclopediaOfMath</a>
 */
public interface SymmetricOperator extends
                                   LinearOperator
{

}
