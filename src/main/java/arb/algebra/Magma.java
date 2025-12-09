package arb.algebra;

import java.util.Set;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.binary.BinaryOperationNode;

/**
 * A {@link Magma} consists of a set M and a {@link BinaryOperationNode} (•)
 * that maps any two elements a, b ∈ M to another element a • b ∈ M.
 * <p>
 * To qualify as a {@link Magma}, the {@link Set} and operation (M, •) must satisfy the closure
 * property (also known as the magma axiom):
 * </p>
 * <p>
 * For all a, b in M, the result of the operation a • b is also in M: 
 * a, b ∈ M ⟹ a • b ∈ M
 * </p>
 * <p>
 * 
 * @param <X> the type of elements in the magma set
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Magma<X> 
{
  
  
  public X pow(X x, int prec, X result);
  
  /**
   * Performs multiplication
   * 
   * @param operand
   * @param prec
   * @param result
   * @return the result after it has been populated with the the product of this
   *         and the operand
   */
  public X mul(X operand, int prec, X result);

  /**
   * Performs multiplication
   * 
   * @param x
   * @param prec
   * @return this after it has been populated with the result
   */
  @SuppressWarnings("unchecked")
  public default X mul(X x, int prec)
  {
    X result = (X) this;
    return mul(x, prec, result);
  }

  /**
   * Compute the quotient of this {@link Magma}
   * 
   * @param j      the field element to divide by
   * @param prec   precision
   * @param result where to store the result
   * @return result
   */
  public X div(X j, int prec, X result);

  /**
   * Compute the quotient of a field element with another field element
   * 
   * @param j    the field element to divide by
   * @param prec precision
   * @return this after the resulting calculation has been assigned to it
   */
  @SuppressWarnings("unchecked")
  public default X div(X j, int prec)
  {
    return div(j, prec, (X) this);
  }

}
