package arb;

import arb.measure.*;
import arb.theoretical.*;
import arb.topological.*;

/**
 * A field is a topological {@link Space}, itself defined as a {@link Set}, on
 * which addition, subtraction, multiplication, and division are defined and
 * behave as the corresponding operations on rational and {@link Real} numbers
 * do. A field is thus a fundamental algebraic structure which is widely used in
 * algebra, {@link NumberTheory}, and many other areas such as physics where
 * fields potentially represent actually existing physical fields and forces and
 * {@link Measure}ments on them, conserved quantities, etc
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
   * Summation is the addition of a sequence of any kind of numbers, called
   * addends or summands; the result is their sum or total. Beside numbers, other
   * types of values can be summed as well: functions, vectors, matrices,
   * polynomials and, in general, elements of any type of mathematical objects on
   * which an operation denoted "+" is defined.
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
   * Performs multiplication
   * 
   * @param x
   * @param prec
   * @param result
   * @return the result after it has been populated with the the product of this
   *         and x
   */
  public X mul(X x, int prec, X result);

  /**
   * Performs multiplication with a (signed) integer
   * 
   * @param x
   * @param prec
   * @return this after it has been populated with the result
   */
  public default X mul(int x, int prec)
  {
    return mul(x, prec);
  }

  /**
   * Performs multiplication with a (signed) integer
   * 
   * @param x
   * @param prec
   * @param result
   * 
   * @return result after it has been populated with the the product of the field
   *         element with the integer
   */
  public X mul(int x, int prec, X result);

  /**
   * Performs multiplication
   * 
   * @param x
   * @param prec
   * @return this after it has been populated with the result
   */
  public default X mul(X x, int prec)
  {
    return mul(x, prec, (X) X.this);
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
