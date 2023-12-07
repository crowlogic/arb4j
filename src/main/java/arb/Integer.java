package arb;

import java.lang.foreign.MemorySegment;
import java.lang.foreign.SegmentScope;

/**
 * This class wraps the fmpz type in flint which is an arbitrary precision
 * integer implemented as a signed 64bit integer. When its second most
 * significant bit is 0, an fmpz represents an ordinary signed long integer
 * whose absolute value is at most {@link IntegerConstants#FLINT_BITS} - 2 bits.
 * When the second most significant bit is 1 an fmpz represents a pointer which
 * is shifted right 2 bits and the second most siginificant bit is set to 1 -
 * this relies on the fact that {@link arblib#flint_malloc(long)} always
 * allocates memory blocks on a 4 or 8 byte boundary and the second most
 * significant bit is reserved to indicate whether the fmpz_t value represents
 * an ordinary slong integer or a pointer to an arbitrary precision integer
 * therefore the maximum size integer that can be passed to ARB as a fmpz_t
 * without it being interpreted as a pointer is 2^62 - 1.
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class Integer implements
                     AutoCloseable
{
  @Override
  public String toString()
  {
    return arblib.fmpz_get_str(null, 10, swigCPtr);
  }

  static
  {
    System.loadLibrary("arblib");
  }

  public int dim;

  public Integer()
  {
    this(1);
  }

  static SegmentScope scope = SegmentScope.auto();

  public Integer(int dim)
  {
    init(dim);
  }

  public long           swigCPtr;
  public boolean        swigCMemOwn = true;
  private MemorySegment nativeSegment;

  /**
   * @return {@link arblib#fmpz_get_ui(long)}
   */
  public long getUnsignedValue()
  {
    return arblib.fmpz_get_ui(swigCPtr);
  }

  /**
   * @return {@link arblib#fmpz_get_si(long)}
   */
  public int getSignedValue()
  {
    return arblib.fmpz_get_si(swigCPtr);
  }

  /**
   * @see arblib#fmpz_set_str(long, String, int)
   * @param value
   * @return
   */
  public Integer set(String value)
  {
    arblib.fmpz_set_str(swigCPtr, value, 10);
    return this;
  }

  /**
   * @see arblib#fmpz_set_si(long, int)
   * @param value
   * @return
   */
  public Integer set(int value)
  {
    arblib.fmpz_set_si(swigCPtr, value);
    return this;
  }

  /**
   * @see arblib#fmpz_set(long, long)
   * @param value
   * @return this
   */
  public Integer set(Integer value)
  {
    arblib.fmpz_set(swigCPtr, value.swigCPtr);
    return this;
  }

  public Integer init()
  {
    return init(1);
  }

  /**
   * Sets this{@link #nativeSegment} by calling
   * {@link MemorySegment#allocateNative(long, SegmentScope)} and passing
   * this{@link #scope} as the second argument then calling
   * {@link arblib#fmpz_init2(long, long)} on it
   * 
   * @param n
   * @return this
   */
  public Integer init(int n)
  {
    nativeSegment = MemorySegment.allocateNative(Long.BYTES * dim, scope);
    swigCPtr      = nativeSegment.address();
    arblib.fmpz_init2(swigCPtr, n);
    return this;
  }

  public Integer(long cPtr, boolean cMemoryOwn)
  {
    swigCMemOwn = cMemoryOwn;
    swigCPtr    = cPtr;
  }

  public static long getCPtr(Real obj)
  {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public void delete()
  {
    if (swigCPtr != 0 && swigCMemOwn)
    {
      arblib.fmpz_clear(swigCPtr);
      swigCPtr = 0;
    }
  }

  @Override
  public void close()
  {
    delete();
  }

}
