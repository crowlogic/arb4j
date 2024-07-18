package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Manually generated wrapper for fmpz_poly_t
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerPolynomial implements AutoCloseable
{
  protected long    swigCPtr;
  protected boolean swigCMemOwn;

  public IntegerPolynomial(long cPtr, boolean cMemoryOwn)
  {
    swigCMemOwn = cMemoryOwn;
    swigCPtr    = cPtr;
  }

  public static long getCPtr(IntegerPolynomial obj)
  {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public synchronized void delete()
  {
    if (swigCPtr != 0)
    {
      if (swigCMemOwn)
      {
        swigCMemOwn = false;
        delete_IntegerPolynomial(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  static
  {
    System.loadLibrary("arblib");
  }

  @Override
  public void close()
  {
    delete();
  }

  public final static native void
         IntegerPolynomial_coeffsNative_set(long jarg1, IntegerPolynomial jarg1_, long jarg2);

  public final static native long IntegerPolynomial_coeffsNative_get(long jarg1, IntegerPolynomial jarg1_);

  public final static native void IntegerPolynomial_length_set(long jarg1, IntegerPolynomial jarg1_, int jarg2);

  public final static native int IntegerPolynomial_length_get(long jarg1, IntegerPolynomial jarg1_);

  public final static native long new_IntegerPolynomial();

  public final static native void delete_IntegerPolynomial(long jarg1);

  public void setCoeffsNative(Integer value)
  {
    IntegerPolynomial_coeffsNative_set(swigCPtr, this, Integer.getCPtr(value));
  }

  public Integer getCoeffsNative()
  {
    long cPtr = IntegerPolynomial_coeffsNative_get(swigCPtr, this);
    return (cPtr == 0) ? null : new Integer(cPtr,
                                            false);
  }

  public void setLength(int value)
  {
    IntegerPolynomial_length_set(swigCPtr, this, value);
  }

  public int getLength()
  {
    return IntegerPolynomial_length_get(swigCPtr, this);
  }

  public IntegerPolynomial()
  {
    this(new_IntegerPolynomial(),
         true);
  }

}
