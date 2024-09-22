package arb.documentation;

import arb.documentation.concepts.Concept;

/**
 * 
 * <pre>
 * The integral operational matrix P for shifted Jacobi polynomials is defined as:
 *
 * P_(i*j)=int_0^1J_i^((α,β))(x)*J_j^((α,β))(x)*d*x  
 *
 * For an N-term representation, P is an N×N matrix.
 *  
 * This matrix allows us to express the integral of a function 
 * 
 * f(x)=sum_(i=0)^∞c_i*J_i^((α,β))(x) 
 * 
 * as:
 *
 * int_0^xf(t)*d*t=X^TPC  
 *
 * where X is the vector of Jacobi polynomials and C is the vector of coefficients.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OperationalMatrix extends
                                   Concept
{

}
