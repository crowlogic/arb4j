package arb;

import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Quaternion implements
                        AutoCloseable,
                        Field<Quaternion>
{
  @Override
  public String toString()
  {
    return String.format("Quaternion[left=%s, right=%s]", left, right);
  }

  public final Complex left  = new Complex(); // Left component of the quaternion
  public final Complex right = new Complex(); // Right component of the quaternion

  /**
   * Constructor to create a quaternion from two complex numbers.
   *
   * @param left  The complex number representing the left component of the
   *              quaternion.
   * @param right The complex number representing the right component of the
   *              quaternion.
   */
  public Quaternion(Complex left, Complex right)
  {
    this.left.set(left);
    this.right.set(right);
  }

  /**
   * Default constructor initializing the quaternion components to zero.
   */
  public Quaternion()
  {

  }

  /**
   * Multiplies this {@link Quaternion} with another {@link Quaternion} and stores
   * the result.
   *
   * @param other  The quaternion to multiply with.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after multiplication.
   */
  public Quaternion mul(Quaternion other, int bits, Quaternion result)
  {
    assert other != result : "aliasing result with this is not supported";
    try ( Complex a = new Complex())
    {
      left.mul(other.left, bits, result.left).sub(right.mul(other.right.conj(a), bits, a), bits);
      left.mul(other.right, bits, result.right).add(right.mul(other.left.conj(a), bits, a), bits);
      return result;
    }
  }

  /**
   * Adds this quaternion to another quaternion and stores the result. Quaternion
   * addition is component-wise.
   *
   * @param other  The quaternion to add.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after addition.
   */
  public Quaternion add(Quaternion other, int bits, Quaternion result)
  {
    left.add(other.left, bits, result.left);
    right.add(other.right, bits, result.right);
    return result;
  }

  /**
   * Subtracts another quaternion from this quaternion and stores the result.
   * Quaternion subtraction is component-wise.
   *
   * @param other  The quaternion to subtract.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after subtraction.
   */
  public Quaternion sub(Quaternion other, int bits, Quaternion result)
  {
    left.sub(other.left, bits, result.left);
    right.sub(other.right, bits, result.right);
    return result;
  }

  /**
   * Divides this quaternion by another quaternion and stores the result.
   * Quaternion division is performed by multiplying the quaternion with the
   * this{@link #multiplicativeInverse(int, Quaternion)} of this
   *
   * @param other  The quaternion to divide by.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after division.
   */
  public Quaternion div(Quaternion other, int bits, Quaternion result)
  {
    try ( Quaternion multiplicativeInverse = other.multiplicativeInverse(bits, new Quaternion()))
    {
      return mul(multiplicativeInverse, bits, result);
    }
  }

  /**
   * Calculate the multiplicative inverse of this
   * 
   * @param bits
   * @param result
   * @return 1/this
   */
  public Quaternion multiplicativeInverse(int bits, Quaternion result)
  {
    try ( Real λ = norm2(bits, new Real());)
    {
      return conjugate(result).div(λ, bits);
    }
  }

  /**
   * Computes the conjugate of the quaternion.
   *
   * @param quaternion The quaternion to compute the conjugate of.
   * @return The conjugate of the quaternion.
   */
  public Quaternion conjugate(Quaternion quaternion)
  {
    left.conj(quaternion.left);
    right.re().neg(quaternion.right.re());
    right.im().neg(quaternion.right.im());
    return quaternion;
  }

  /**
   * Divides the quaternion by a real number.
   *
   * @param norm The real number to divide by.
   * @param bits The precision of the operation.
   * @return The resulting quaternion after division.
   */
  public Quaternion div(Real norm, int bits)
  {
    return div(norm, bits, this);
  }

  /**
   * Divides the quaternion by a real number and stores the result in another
   * quaternion.
   *
   * @param norm   The real number to divide by.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after division.
   */
  public Quaternion div(Real norm, int bits, Quaternion result)
  {
    left.re().div(norm, bits, result.left.re());
    left.im().div(norm, bits, result.left.im());
    right.re().div(norm, bits, result.right.re());
    right.im().div(norm, bits, result.right.im());
    return result;
  }

  /**
   * Calculates the squared norm of the quaternion.
   *
   * @param bits   The precision of the operation.
   * @param result The real number where the result is stored.
   * @return The norm of the quaternion.
   */
  public Real norm2(int bits, Real result)
  {

    result.zero();
    left.re().addmul(left.re(), bits, result);
    left.im().addmul(left.im(), bits, result);
    right.re().addmul(right.re(), bits, result);
    right.im().addmul(right.im(), bits, result);

    return result;

  }

  /**
   * Calculates the norm of the quaternion which is the square root of
   * this{@link #norm2(int, Real)}
   *
   * @param bits   The precision of the operation.
   * @param result The real number where the result is stored.
   * @return The norm of the quaternion.
   */
  public Real norm(int bits, Real result)
  {
    return norm2(bits, result).sqrt(bits);
  }

  /**
   * Closes resources associated with the quaternion.
   */
  @Override
  public void close()
  {
    left.close();
    right.close();
  }

  @Override
  public Quaternion additiveIdentity()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Quaternion multiplicativeIdentity()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  protected int bits;

  @Override
  public int bits()
  {
    return bits;
  }

  @Override
  public int dim()
  {
    assert false : "TODO: Auto-generated method stub";
    return 1;
  }

  @Override
  public Quaternion div(int j, int prec, Quaternion result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E> E get(int i)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String getName()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Quaternion mul(int x, int prec, Quaternion result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public Quaternion newFieldElement()
  {
    return new Quaternion();
  }

  @Override
  public Quaternion set(Quaternion value)
  {
    left.set(value.left);
    right.set(value.right);
    return this;
  }

  @Override
  public Quaternion zero()
  {
    left.zero();
    right.zero();
    return this;
  }

  @Override
  public Stream<Quaternion> stream()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }
}
