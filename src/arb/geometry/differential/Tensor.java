package arb.geometry.differential;

import arb.Basis;
import arb.topological.spaces.VectorSpace;

/**
 * Definition. A tensor of type (p, q) is an assignment of a multidimensional
 * array
 * 
 * T j 1 … j q i 1 … i p [ f ]
 * 
 * to each basis f = (e1, ..., en) of an n-dimensional vector space such that,
 * if we apply the change of basis
 * 
 * f ↦ f ⋅ R = ( e i R 1 i , … , e i R n i )
 * 
 * then the multidimensional array obeys the transformation law
 * 
 * The definition of a tensor as a multidimensional array satisfying a
 * transformation law traces back to the work of Ricci.
 * 
 * An equivalent definition of a tensor uses the representations of the general
 * linear group. There is an action of the general linear group on the set of
 * all ordered bases of an n-dimensional vector space. If f = ( f 1 , … , f n )
 * is an ordered basis, and R = ( R j i ) is an invertible n × n n\times n
 * matrix, then the action is given by
 * 
 * f R = ( f i R 1 i , … , f i R n i ) .
 * 
 * Let F be the set of all ordered bases. Then F is a principal homogeneous
 * space for GL(n). Let W be a vector space and let ρ \rho be a representation
 * of GL(n) on W (that is, a group homomorphism ρ : GL ( n ) → GL ( W ) . Then a
 * tensor of type ρ is an equivariant map T : F → W . Equivariance here means
 * that
 * 
 * T ( F R ) = ρ ( R − 1 ) T ( F ) .
 * 
 * When ρ is a tensor representation of the general linear group, this gives the
 * usual definition of tensors as multidimensional arrays. This definition is
 * often used to describe tensors on manifolds, and readily generalizes to other
 * groups.
 * 
 * @author crow
 *
 */
public interface Tensor<V extends VectorSpace>  
{

}
