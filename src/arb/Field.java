package arb;

import arb.topological.*;

/**
 * A field is a set on which addition, subtraction, multiplication, and division
 * are defined and behave as the corresponding operations on rational and
 * {@link Real} numbers do. A field is thus a fundamental algebraic structure
 * which is widely used in algebra, number theory, and many other areas such as
 * physics where fields potentially represent actually existing physical fields
 * and forces and measurements on them, conserved quantities, etc
 */
public interface Field<X extends Field<X>> extends
                      AutoCloseable,
                      Space,
                      Iterable<X>
{
  /**
   * @return the number of X's available to this{@link #get(int)}
   */
  public int dim();

  public X get(int index);

  /**
   * 
   * @param prec
   * @param result
   * 
   * @return the sum of the elements(or points) (via
   *         {@link #add(Field, int, Field)} ) of this array of field elements
   *         regarded as an array of length this{@link #dim()}
   */
  public default X Σ(int prec, X result)
  {
    result.zero();
    forEach(element -> result.add(element, prec, result));
    return result;
  }

  /**
   * Calculates the arithmetic mean of the elements of this field regarded as an
   * array of size this{@link #dim()}
   * 
   * @param prec   precision
   * @param result
   * 
   * @return this{@link #Σ(int, Field)} / this{@link #dim()}
   */
  public default X arithmeticMean(int prec, X result)
  {
    return Σ(prec, result).div(dim(), prec);
  }

  /**
   * Compute the quotient of two arithmetic field elements
   * 
   * @param j    integer to divide by
   * @param prec precision
   * @return this
   */
  public default X div(int j, int prec)
  {
    return div(j, prec, (X) X.this);
  }

  /**
   * Compute the quotient of a field element with an integer
   * 
   * @param j      integer to divide by
   * @param prec   precision
   * @param result where to store the result
   * @return result
   */
  public X div(int j, int prec, X result);

  /**
   * Compute the quotient of a field element with another field element
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
  public default X div(X j, int prec)
  {
    return div(j, prec, (X) X.this);
  }

  /**
   * Adds two elements
   * 
   * @param element
   * @param prec
   * @return this after it has been assigned the result
   */
  public default X add(X element, int prec)
  {
    return add(element, prec, (X) X.this);
  }

  /**
   * Adds two elements of this field
   * 
   * @param element
   * @param prec
   * @param result
   * @return result
   */
  public X add(X element, int prec, X result);

  public X zero();

  public Real abs(int prec, Real w);

}
