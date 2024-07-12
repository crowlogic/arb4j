package arb;

import java.io.Closeable;
import java.util.Iterator;

import arb.algebra.Ring;
import arb.annotations.Commutative;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.binary.Addition;
import arb.expressions.nodes.binary.Multiplication;

/**
 * a set of elements such that {@link Addition} and {@link Multiplication} are
 * {@link Commutative} and associative and multiplication is distributive over
 * addition and there are two elements 0 and 1; "the set of all rational numbers
 * is a field"
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Field<X extends Field<X>> extends
                      AutoCloseable,
                      Closeable,
                      Comparable<X>,
                      Iterable<X>,
                      Ring<X>,
                      Named
{
  public X additiveIdentity();

  public X multiplicativeIdentity();

  @Commutative
  public default X add(X x)
  {
    return add(x, bits(this, x));
  }

  @Commutative
  public default X add(X x, X result)
  {
    return add(x, bits(this, x), result);
  }

  /**
   * Adds two elements
   * 
   * @param element
   * @param prec
   * @return this after it has been assigned the result
   */
  @SuppressWarnings("unchecked")
  @Commutative
  public default X add(X element, int prec)
  {
    return add(element, prec, (X) this);
  }

  /**
   * Adds two elements of this field
   * 
   * @param element
   * @param prec
   * @param result
   * @return result
   */
  @Commutative
  public X add(X element, int prec, X result);

  /**
   * @return minimum number of bits required to represent this element without
   *         loss of precision (information)
   */
  public int bits();

  @Override
  default void close()
  {

  }

  /**
   * @return the number of X's available to this{@link #get(int)}
   */
  public int dim();

  public default X div(X x)
  {
    return div(x, bits(this, x));
  }

  public default X div(X x, X result)
  {
    return div(x, bits(this, x), result);
  }

  /**
   * Compute the quotient of two arithmetic field elements
   * 
   * @param j    integer to divide by
   * @param prec precision
   * @return this
   */
  @SuppressWarnings("unchecked")
  public default X div(int j, int prec)
  {
    return div(j, prec, (X) this);
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
   * @param j    the field element to divide by
   * @param prec precision
   * @return this after the resulting calculation has been assigned to it
   */
  @SuppressWarnings("unchecked")
  public default X div(X j, int prec)
  {
    return div(j, prec, (X) this);
  }

  /**
   * Compute the quotient of a field element with another field element
   * 
   * @param j      the field element to divide by
   * @param prec   precision
   * @param result where to store the result
   * @return result
   */
  public X div(X j, int prec, X result);

  public X get(int index);

  public String getName();

  @Override
  default Iterator<X> iterator()
  {
    assert false : "implement me";
    return null;

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
  public default X mean(int prec, X result)
  {
    return Σ(prec, result).div(dim(), prec);
  }

  /**
   * Performs multiplication with a (signed) integer
   * 
   * @param x
   * @param prec
   * @return this after it has been populated with the result
   */
  @SuppressWarnings("unchecked")
  @Commutative
  public default X mul(int x, int prec)
  {
    X result = (X) this;
    return mul(x, prec, result);
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
  @Commutative
  public X mul(int x, int prec, X result);

  @Commutative
  public default X mul(X x)
  {
    return mul(x, bits(this, x));
  }

  /**
   * Performs multiplication
   * 
   * @param x
   * @param prec
   * @return this after it has been populated with the result
   */
  @SuppressWarnings("unchecked")
  @Commutative
  public default X mul(X x, int prec)
  {
    X result = (X) this;
    return mul(x, prec, result);
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
  @Commutative
  public X mul(X x, int prec, X result);

  @Commutative
  public default X mul(X x, X result)
  {
    return mul(x, bits(this, x), result);
  }

  public X newFieldElement();

  /**
   * Assignment operator
   * 
   * @param value
   * @return this after having been assigned value
   */
  public X set(X value);

  /**
   * Subtracts a field element from this field
   * 
   * @param element to be subtracted from this
   * @param prec
   * @return this after the result has been assigned to it
   */
  @SuppressWarnings("unchecked")
  public default X sub(X element, int prec)
  {
    return sub(element, prec, (X) this);
  }

  /**
   * Subtracts a field element from this field
   * 
   * @param element to be subtracted from this
   * @param prec
   * @param result
   * @return result
   */
  public X sub(X element, int prec, X result);

  public default X sub(X x)
  {
    return sub(x, bits(this, x));
  }

  /**
   * Calculate the number of bits to use for a given pair of operands
   * 
   * @param <X>
   * @param x
   * @param y
   * 
   * @return no less than 128 since
   */
  public static <X extends Field<? extends X>> int bits(X x, X y)
  {
    return Math.max(128, Math.max(x.bits(), y.bits()));
  }

  public default X sub(X x, X result)
  {
    return sub(x, bits(this, x), result);
  }

  public X zero();

  /**
   * 
   * @param prec
   * @param result
   * @return this{@link #Σ(int, Field)}
   */
  public default X sum(int prec, X result)
  {
    return Σ(prec, result);
  }

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
  @SuppressWarnings("resource")
  public default X Σ(int prec, X result)
  {
    result.zero();
    forEach(element -> result.add(element, prec, result));
    return result;
  }

  @SuppressWarnings("unchecked")
  public default X set(int n)
  {
    return (X) this;
  }

}
