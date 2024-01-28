package arb;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Arrays;

import arb.algebra.Ring;

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
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class Integer implements
                     AutoCloseable,
                     Comparable<Integer>,
                     Ring<Integer>,
                     HasName
{

  public String name;

  public String getName()
  {
    return name;
  }

  public Integer setName(String name)
  {
    this.name = name;
    return this;
  }

  public Real factorial(int bits, Real result)
  {
    arblib.arb_fac_ui(result, getUnsignedValue(), bits);
    return result;
  }

  public static Real factorial(long n, int bits, Real result)
  {
    arblib.arb_fac_ui(result, n, bits);
    return result;
  }

  public Real tanh(int bits, Real result)
  {
    return result.set(this).tanh(bits, result);
  }

  public Complex tanh(int bits, Complex result)
  {
    return result.set(this).tanh(bits, result);
  }

  public Complex sqrt(int bits, Complex result)
  {
    return result.set(this).sqrt(bits);
  }

  public Real sqrt(int bits, Real result)
  {
    return result.set(this).sqrt(bits);
  }

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
    init(1);
  }

  public static Arena   arena       = Arena.ofAuto();

  public long           swigCPtr;
  public boolean        swigCMemOwn = true;
  private MemorySegment nativeSegment;
  public Integer[]      elements;

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

  public Integer get(int index)
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return this;
    }
    Integer element = elements[index];
    if (element == null)
    {
      element = elements[index] = new Integer(swigCPtr + index * Long.BYTES,
                                              false);
    }
    return element;
  }

  /**
   * Sets this{@link #nativeSegment} by calling
   * {@link MemorySegment#allocateNative(long, SegmentScope)} and passing
   * this{@link #arena} as the second argument then calling
   * {@link arblib#fmpz_init2(long, long)} on it
   * 
   * @param n
   * @return this
   */
  public Integer init(int n)
  {
    nativeSegment = arena.allocate(Long.BYTES * dim);
    swigCPtr      = nativeSegment.address();
    arblib.fmpz_init2(swigCPtr, n);
    return this;
  }

  public Integer(long cPtr, boolean cMemoryOwn)
  {
    swigCMemOwn = cMemoryOwn;
    swigCPtr    = cPtr;
  }

  public Integer(String string)
  {
    init();
    set(string);
  }

  public Integer(int i)
  {
    init();
    set(i);
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
    if (elements != null && dim > 1)
    {
      Arrays.stream(elements).forEach(Integer::delete);
    }
    else
    {
      delete();
    }
  }

  @Override
  public Integer mul(Integer operand, int prec, Integer result)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_mul(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real mul(Integer operand, int prec, Real result)
  {
    return result.set(this).mul(operand, prec);
  }

  public Real pow(Integer operand, int prec, Real result)
  {
    return result.set(this).pow(operand, prec);
  }

  public Real div(Integer operand, int prec, Real result)
  {
    return result.set(this).div(operand, prec);
  }

  public Integer remainder;

  public Integer pow(Integer operand, int bits, Integer result)
  {
    arblib.fmpz_pow_fmpz(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  /**
   * Division, rounded to integer
   * 
   * TODO: add version for this{@link #remainder}
   */
  @Override
  public Integer div(Integer operand, int prec, Integer result)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_divexact(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real add(Real addend, int bits, Real result)
  {
    arblib.arb_add_fmpz(result, addend, this.swigCPtr, bits);
    return result;
  }

  public Real mul(Real s, int bits, Real result)
  {
    arblib.arb_mul_fmpz(result, s, this.swigCPtr, bits);
    return result;
  }

  public Real sub(Integer operand, int prec, Real result)
  {
    return result.set(this).sub(operand, prec);
  }

  public Real add(Integer operand, int prec, Real result)
  {
    return result.set(this).add(operand, prec);
  }

  @Override
  public Integer add(Integer operand, int prec, Integer result)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_add(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real sub(Real subtrahend, int bits, Real result)
  {
    return result.set(this).sub(subtrahend, bits);
  }

  @Override
  public Integer sub(Integer operand, int prec, Integer result)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_sub(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Integer sub(Integer b, int i)
  {
    return sub(b, i, this);
  }

  public Real log(int bits, Real result)
  {
    return result.set(this).log(bits);
  }

  public Complex log(int bits, Complex result)
  {
    result.im().zero();
    result.re().set(this);
    return result.log(bits);
  }

  public Integer sub(int i, int bits, Integer res)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_sub_si(res.swigCPtr, this.swigCPtr, i);
    return res;
  }

  @Override
  public int compareTo(Integer o)
  {
    return arblib.fmpz_cmp(swigCPtr, o.swigCPtr);
  }

}
