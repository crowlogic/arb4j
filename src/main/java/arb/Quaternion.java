package arb;

/**
 * Implements a Quaternion class representing a quaternion in mathematics.
 * Quaternions are used in 3D spatial rotations and consist of a 'left' and
 * 'right' complex number.
 */
public class Quaternion implements
                        AutoCloseable
{
  public final Complex left;  // Left component of the quaternion
  public final Complex right; // Right component of the quaternion

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
    this.left  = left;
    this.right = right;
  }

  /**
   * Default constructor initializing the quaternion components to zero.
   */
  public Quaternion()
  {
    left  = new Complex();
    right = new Complex();
  }

  /**
   * Multiplies this quaternion with another quaternion and stores the result.
   * Quaternion multiplication formula: (a + bi + cj + dk) * (e + fi + gj + hk)
   * where a, b, c, d, e, f, g, h are real numbers.
   *
   * @param other  The quaternion to multiply with.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after multiplication.
   */
  public Quaternion mul(Quaternion other, int bits, Quaternion result)
  {
    try ( Complex tmp = new Complex(); Complex otherRightConjugate = other.right.conj(new Complex()))
    {
      left.mul(other.left, bits, result.left).sub(right.mul(otherRightConjugate, bits, tmp), bits);
      left.mul(other.right, bits, result.right).add(otherRightConjugate.mul(left, bits, tmp), bits);
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
   * inverse of the other.
   *
   * @param other  The quaternion to divide by.
   * @param bits   The precision of the operation.
   * @param result The quaternion where the result is stored.
   * @return The resulting quaternion after division.
   */
  public Quaternion div(Quaternion other, int bits, Quaternion result)
  {
    try ( Quaternion otherConjugate = other.conjugate(new Quaternion()); Real norm = other.norm(bits, new Real()))
    {
      return mul(otherConjugate.div(norm, bits), bits, result);
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
    right.conj(quaternion.right);
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
    left.div(norm, bits, result.left);
    right.div(norm, bits, result.right);
    return result;
  }

  /**
   * Calculates the norm of the quaternion.
   *
   * @param bits   The precision of the operation.
   * @param result The real number where the result is stored.
   * @return The norm of the quaternion.
   */
  public Real norm(int bits, Real result)
  {
    try ( Real tmp = new Real())
    {
      left.norm(bits, result);
      right.norm(bits, tmp);
      return result.add(tmp, bits);
    }
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
}
