package arb;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Arrays;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.IntegerNullaryFunction;

/**
 * This class wraps the fmpz type in flint which is an arbitrary precision
 * integer implemented as a signed 64bit integer.
 * 
 * When its second most significant bit is 0, an fmpz represents an ordinary
 * signed long integer whose absolute value is at most
 * {@link IntegerConstants#FLINT_BITS} - 2 bits.
 * 
 * When the second most significant bit is 1 an fmpz represents a pointer which
 * is shifted right 2 bits and the second most siginificant bit is set to 1.
 * 
 * This feature relies on the fact that {@link arblib#flint_malloc(long)} always
 * allocates memory blocks on a 4 or 8 byte boundary
 * 
 * The second most significant bit is reserved to indicate whether the fmpz_t
 * value represents an ordinary signed 64-bit integer or a pointer to an
 * arbitrary precision integer.
 * 
 * Therefore the maximum size integer that can be passed to ARB as a fmpz_t
 * without it being interpreted as a pointer is 2^62 - 1.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Integer implements
                     AutoCloseable,
                     Comparable<Integer>,
                     Ring<Integer>,
                     Named
{
  public static int BYTES = Long.BYTES;

  public static Integer express(String expression)
  {
    return express(expression, 128);
  }

  public static Integer express(String expression, int bits)
  {
    return express(expression, null, bits);
  }

  public static Integer express(String expression, Context context, int bits)
  {
    return IntegerNullaryFunction.compile(expression, context).evaluate(bits);
  }

  public Integer set(Fraction f)
  {
    assert false : "set " + f;
    return null;
  }

  public Fraction mul(Fraction subtrahend, int prec, Fraction result)
  {
    return result.set(this).mul(subtrahend, prec, result);
  }

  public Fraction mul(Integer subtrahend, int prec, Fraction result)
  {
    return result.set(this).mul(subtrahend, prec, result);
  }

  public Fraction add(Integer subtrahend, int prec, Fraction result)
  {
    return result.set(this).add(subtrahend, prec, result);
  }

  public Fraction sub(Integer subtrahend, int prec, Fraction result)
  {
    return result.set(this).sub(subtrahend, prec, result);
  }

  public ComplexRationalFunction neg(ComplexRationalFunction result)
  {
    return result.set(this).neg();
  }

  public Real cos(int prec, Real result)
  {
    return result.set(this).cos(prec, result);
  }

  public Real sin(int prec, Real result)
  {
    return result.set(this).sin(prec, result);
  }

  @SuppressWarnings("resource")
  public static Integer named(String name)
  {
    return new Integer().setName("n");
  }

  static
  {
    System.loadLibrary("arblib");
  }

  /**
   * Divides this Integer by another Integer and returns the result as a
   * RationalFunction.
   *
   * @param operand The Integer to divide by
   * @param prec    The precision to use for the operation (not used for exact
   *                division)
   * @param result  The RationalFunction to store the result in
   * @return The resulting RationalFunction
   */
  public RationalFunction div(Integer operand, int prec, RationalFunction result)
  {
    assert operand.swigCPtr != 0;
    assert swigCPtr != 0;
    result.getNumerator().set(this);
    result.getDenominator().set(operand);
    result.reduce();
    return result;
  }

  public static Integer newVector(int dim)
  {
    Integer vec = new Integer((long) dim);
    vec.dim = dim;
    return vec;
  }

  public static Real factorial(Integer n, int bits, Real result)
  {
    arblib.arb_fac_ui(result, n.getUnsignedValue(), bits);
    return result;
  }

  public static Integer factorial(Integer n, Integer result)
  {
    arblib.fmpz_fac_ui(result.swigCPtr, n.getUnsignedValue());
    return result;
  }

  public static Real factorial(long n, int bits, Real result)
  {
    arblib.arb_fac_ui(result, n, bits);
    return result;
  }

  public RationalFunction div(RationalFunction operand, int prec, RationalFunction result)
  {
    return result.set(this).div(operand, prec);
  }

  public RationalFunction mul(RationalFunction operand, int prec, RationalFunction result)
  {
    return result.set(this).mul(operand, prec);
  }

  public static Integer factorial(long n, Integer result)
  {
    arblib.fmpz_fac_ui(result.swigCPtr, n);
    return result;
  }

  public static long getCPtr(Integer obj)
  {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public int            dim         = 1;

  public Integer[]      elements;

  public String         name;

  private MemorySegment nativeSegment;

  public Integer        remainder;

  public boolean        swigCMemOwn = true;

  public long           swigCPtr;

  public Integer        divisor;

  private Arena         arena;

  public Integer()
  {
    init(1);
  }

  public Integer(int i)
  {
    init();
    set(i);
  }

  public Integer(int i, String name)
  {
    this(i);
    setName(name);
  }

  public Integer(long cPtr, boolean cMemoryOwn)
  {
    swigCMemOwn = cMemoryOwn;
    swigCPtr    = cPtr;
    assert swigCPtr % 4 == 0 : "fmpz pointer not aligned on 4-byte boundary";
  }

  public Integer(String string)
  {
    init();
    set(string);
  }

  public Integer(long dim2)
  {
    init((int) dim2);
  }

  public Real add(Fraction addend, int bits, Real result)
  {
    try ( Real blip = new Real())
    {
      return blip.set(this).add(addend, bits, result);
    }
  }

  public Fraction add(Fraction frac, int bits, Fraction result)
  {
    return result.set(this).add(frac, bits);
  }

  public Integer add(int i)
  {
    return add(i, this);
  }

  public Integer add(int i, Integer result)
  {
    arblib.fmpz_add_si(result.swigCPtr, this.swigCPtr, i);
    return result;
  }

  public ComplexFraction add(Fraction operand, int prec, ComplexFraction result)
  {
    operand.add(this, prec, result.realPart);
    return result;
  }

  public ComplexRationalFunction add(Fraction operand, int prec, ComplexRationalFunction result)
  {
    return result.set(this).add(operand, prec, result);
  }

  public ComplexRationalFunction add(Integer operand, int prec, ComplexRationalFunction result)
  {
    return result.set(this).add(operand, prec, result);
  }

  public Complex add(Integer operand, int prec, Complex result)
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

  public Real add(Integer operand, int prec, Real result)
  {
    return result.set(this).add(operand, prec);
  }

  public Real add(Real addend, int bits, Real result)
  {
    arblib.arb_add_fmpz(result, addend, this.swigCPtr, bits);
    return result;
  }

  public RationalFunction add(Real addend, int bits, RationalFunction result)
  {
    try ( Real blip = new Real())
    {
      return result.set(add(addend, bits, blip));
    }
  }

  public Integer additiveIdentity()
  {
    return set(0);
  }

  public Real ascendingFactorial(Integer n, int bits, Real res)
  {
    assert n.sign() >= 0 : "negative arguments to the ascending factorial are not supported, n="
                           + n;
    arblib.arb_hypgeom_rising_ui(res, res.set(this), n.getUnsignedValue(), bits);
    return res.set(res);
  }

  public Real ascendingFactorial(Fraction n, int bits, Real result)
  {
    try ( Real blip = new Real())
    {
      return result.set(this).ascendingFactorial(blip.set(n), bits);
    }
  }

  public Real ascendingFactorial(Real n, int bits, Real result)
  {
    arblib.arb_rising(result, result.set(this), n, bits);
    return result;
  }

  public Integer choose(Integer n, int bits, Integer result)
  {
    arblib.fmpz_bin_uiui(result.swigCPtr, swigCPtr, n.swigCPtr);
    return result;
  }

  @Override
  public void close()
  {
    if (arena != null)
    {
      arena.close();
      arena = null;
    }
    else
    {
      if (elements != null && dim > 1)
      {
        Arrays.stream(elements).forEach(Integer::close);
      }
      else
      {
        delete();
        if (remainder != null)
        {
          remainder.close();
        }
        if (divisor != null)
        {
          divisor.close();
        }
      }
    }
  }

  @Override
  public int compareTo(Integer o)
  {
    return arblib.fmpz_cmp(swigCPtr, o.swigCPtr);
  }

  public void delete()
  {
    if (swigCPtr != 0 && swigCMemOwn)
    {
      arblib.fmpz_clear(swigCPtr);
      swigCPtr = 0;
    }
  }

  public Complex div(Complex dividend, int prec, Complex res)
  {
    res.bits = prec;
    return res.set(this).div(dividend, prec);
  }

  public ComplexPolynomial div(ComplexPolynomial dividend, int prec, ComplexPolynomial res)
  {
    res.bits = prec;
    return res.set(this).div(dividend, prec);
  }

  public Integer div(Integer operand)
  {
    return div(operand, this);
  }

  public Complex div(Integer operand, int prec, Complex result)
  {
    return result.set(this).div(operand, prec);
  }

  /**
   * Division, rounded to integer. If you want the remainder to be calculated, it
   * must be non-null
   */
  @Override
  public Integer div(Integer operand, int prec, Integer result)
  {
    if (result.remainder != null)
    {
      result.remainder = new Integer();
    }
    if (result.divisor != null)
    {
      result.divisor = operand;
    }
    if (result.remainder != null)
    {
      arblib.fmpz_mod(result.remainder.swigCPtr, this.swigCPtr, operand.swigCPtr);
    }
    arblib.fmpz_divexact(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real div(Integer operand, int prec, Real result)
  {
    result.set(this).div(operand, prec);
    return result;
  }

  public RealPolynomial div(Integer dividend, int prec, RealPolynomial res)
  {
    res.bits = prec;
    return res.set(this).div(dividend, prec, res);
  }

  public Fraction div(Integer dividend, int prec, Fraction res)
  {
    res.getNumerator().set(this);
    res.getDenominator().set(dividend);
    res.reduce();
    return res;
  }

  /**
   * Shortcut for this{@link #div(Integer, int, Integer)} since it doesnt need
   * bits
   * 
   * @param operand
   * @param result
   * @return
   */
  public Integer div(Integer operand, Integer result)
  {
    return div(operand, 0, result);
  }

  public Real div(Real dividend, int prec, Real res)
  {
    res.bits = prec;
    return res.set(this).div(dividend, prec);
  }

  public RealPolynomial div(Real dividend, int prec, RealPolynomial res)
  {
    res.bits = prec;
    return res.set(this).div(dividend, prec);
  }

  public RealPolynomial div(RealPolynomial dividend, int prec, RealPolynomial res)
  {
    res.bits = prec;
    return res.set(this).div(dividend, prec);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Integer other = (Integer) obj;
    return arblib.fmpz_equal(swigCPtr, other.swigCPtr) != 0;
  }

  public Integer factorial()
  {
    return factorial(this, this);
  }

  public Integer factorial(int bits, Integer result)
  {
    arblib.fmpz_fac_ui(result.swigCPtr, getUnsignedValue());
    return result;
  }

  public Real factorial(int bits, Real result)
  {
    arblib.arb_fac_ui(result, getUnsignedValue(), bits);
    return result;
  }

  public Integer get(int index)
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return this;
    }

    if (elements == null)
    {
      elements = new Integer[dim];
    }
    Integer element = elements[index];
    if (element == null)
    {
      element = elements[index] = new Integer(swigCPtr + index * Long.BYTES,
                                              false);
    }
    return element;
  }

  public String getName()
  {
    return name;
  }

  /**
   * @return {@link arblib#fmpz_get_si(long)}
   */
  public int getSignedValue()
  {
    return arblib.fmpz_get_si(swigCPtr);
  }

  /**
   * Calls this{@link #increment()} before returning this{@link #getSignedValue()}
   * 
   * @return integer value before being incremented
   */
  public int getSignedValueAndIncrement()
  {
    var r = arblib.fmpz_get_si(swigCPtr);
    increment();
    return r;
  }

  /**
   * @return {@link arblib#fmpz_get_ui(long)}
   */
  public long getUnsignedValue()
  {
    return arblib.fmpz_get_ui(swigCPtr);
  }

  /**
   * 
   * @return this += 1
   */
  public Integer increment()
  {
    arblib.fmpz_add_si(swigCPtr, swigCPtr, 1);
    return this;
  }

  /**
   * 
   * @return this += i
   */
  public Integer increment(int i)
  {
    arblib.fmpz_add_si(swigCPtr, swigCPtr, i);
    return this;
  }

  public Integer init()
  {
    swigCPtr    = Arena.global().allocate(Long.BYTES).address();
    swigCMemOwn = false;
    arblib.fmpz_init(swigCPtr);
    return this;
  }

  /**
   * Calls this{@link #initialize(Arena, int)} with {@link Arena#ofShared()}
   * 
   * @param n
   * @return
   */
  public Integer init(int n)
  {
    return init(Arena.ofShared(), n);
  }

  public Integer init(Arena arena, int n)
  {
    this.dim = n;
    return initialize(arena, n);
  }

  /**
   * Sets this{@link #arena} and calls {@link Arena#allocate(long)} with the
   * appropriate size and assigns the results to this{@link #swigCMemOwn}, sets
   * this{@link #swigCPtr} then calls {@link arblib#fmpz_init2(long, long)} on it
   * 
   * @param newArena
   * @param n
   * @return
   */
  public Integer initialize(Arena newArena, int n)
  {
    elements      = null;
    arena         = newArena;
    nativeSegment = arena.allocate(Long.BYTES * n);
    swigCPtr      = nativeSegment.address();
    assert swigCPtr % 4 == 0 : "fmpz pointer not aligned on 4-byte boundary";
    for (int i = 0; i < n; i++)
    {
      get(i).init();
    }
    return this;
  }

  public boolean isNonNegative()
  {
    return sign() >= 0;
  }

  public boolean isStrictlyPositive()
  {
    return sign() > 0;
  }

  public Complex log(int bits, Complex result)
  {
    result.im().zero();
    result.re().set(this);
    return result.log(bits);
  }

  public Real log(int bits, Real result)
  {
    return result.set(this).log(bits);
  }

  public Complex mul(Complex x, int bits, Complex result)
  {
    return result.set(this).mul(x, bits);
  }

  public ComplexRationalFunction
         mul(ComplexRationalFunction x, int bits, ComplexRationalFunction res)
  {
    return res.set(this).mul(x, bits);
  }

  public ComplexPolynomial mul(ComplexPolynomial x, int bits, ComplexPolynomial res)
  {
    return res.set(this).mul(x, bits);
  }

  @Override
  public Integer mul(Integer operand, int prec)
  {
    return mul(operand, prec, this);
  }

  @Override
  public Integer mul(Integer operand, int prec, Integer result)
  {
    assert operand != null;
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_mul(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real mul(Integer operand, int prec, Real result)
  {
    return result.set(this).mul(operand, prec);
  }

  public Real mul(Real s, int bits, Real result)
  {
    result.bits = bits;
    arblib.arb_mul_fmpz(result, s, this.swigCPtr, bits);
    return result;
  }

  public RealPolynomial mul(Real x, int bits, RealPolynomial res)
  {
    return res.set(this).mul(x, bits);
  }

  public RealPolynomial mul(RealPolynomial x, int bits, RealPolynomial res)
  {
    return res.set(this).mul(x, bits);
  }

  public Integer multiplicativeIdentity()
  {
    return set(1);
  }

  public Integer neg()
  {
    return neg(this);
  }

  public Complex neg(Complex result)
  {
    return result.set(this).neg();
  }

  public Integer neg(Integer result)
  {
    arblib.fmpz_neg(result.swigCPtr, swigCPtr);
    return result;
  }

  public Real neg(Real result)
  {
    return result.set(this).neg();
  }

  public ComplexFraction neg(ComplexFraction res)
  {
    neg(res.realPart);
    res.imaginaryPart.zero();
    return res;
  }

  public Fraction neg(Fraction res)
  {
    res.set(this);
    res.neg();
    return res;
  }

  public RationalFunction neg(RationalFunction res)
  {
    res.set(this);
    res.neg();
    return res;
  }

  public Integer pow(Integer operand, int bits, Integer result)
  {
    arblib.fmpz_pow_fmpz(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real pow(Integer operand, int prec, Real result)
  {
    return result.set(this).pow(operand, prec);
  }

  public Integer risingFactorial(Integer n, int bits, Integer result)
  {
    assert n.getSignedValue() >= 0 : String.format("power=%d must be non-negative where this=%d",
                                                   n.getSignedValue(),
                                                   getSignedValue());
    ;

    try ( Real x = new Real(); Real realResult = new Real();)
    {
      arblib.arb_rising_ui(realResult, x.set(this), n.getUnsignedValue(), bits);
      assert realResult.isInteger() : realResult + " is not an integer";
      return realResult.getInteger(result);
    }
  }

  public Real risingFactorial(Integer n, int bits, Real result)
  {
    assert n.getSignedValue() >= 0 : "power must be non-negative";

    try ( Real x = new Real();)
    {
      arblib.arb_rising(result, x.set(this), result.set(n), bits);
    }
    return result;
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
    assert value != null : "value is null";
    arblib.fmpz_set(swigCPtr, value.swigCPtr);
    return this;
  }

  public Integer set(long val)
  {
    arblib.fmpz_set_ui(swigCPtr, val);
    return this;
  }

  /**
   * @see arblib#fmpz_set_str(long, String, int)
   * @param value
   * @return
   */
  public Integer set(String value)
  {
    assert value != null : "value is null";
    arblib.fmpz_set_str(swigCPtr, value, 10);
    return this;
  }

  @SuppressWarnings("unchecked")
  public Integer setName(String name)
  {
    this.name = name;
    return this;
  }

  public int sign()
  {
    return arblib.fmpz_sgn(swigCPtr);
  }

  public Complex sqrt(int bits, Complex result)
  {
    return result.set(this).sqrt(bits);
  }

  public Real sqrt(int bits, Real result)
  {
    return result.set(this).sqrt(bits);
  }

  public Complex sub(Complex operand, int prec, Complex result)
  {
    return result.set(this).sub(operand, prec);
  }

  public Integer sub(int i)
  {
    return sub(i, this);
  }

  public Integer sub(int i, int bits, Integer res)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_sub_si(res.swigCPtr, this.swigCPtr, i);
    return res;
  }

  public Integer sub(int i, Integer result)
  {
    arblib.fmpz_sub_si(result.swigCPtr, swigCPtr, i);
    return result;
  }

  public Integer sub(Integer b, int i)
  {
    return sub(b, i, this);
  }

  public Complex sub(Integer operand, int prec, Complex result)
  {
    return result.set(this).sub(operand, prec);
  }

  @Override
  public Integer sub(Integer operand, int prec, Integer result)
  {
    // assert prec == 0 : "exact precision methods require bits=0";
    arblib.fmpz_sub(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public Real sub(Integer operand, int prec, Real result)
  {
    return result.set(this).sub(operand, prec);
  }

  public Real sub(Real subtrahend, int bits, Real result)
  {
    return result.set(this).sub(subtrahend, bits);
  }

  public RealPolynomial sub(Real operand, int prec, RealPolynomial result)
  {
    return result.set(this).sub(operand, prec);
  }

  public RealPolynomial sub(RealPolynomial subtrahend, int prec, RealPolynomial res)
  {
    res.bits = prec;
    return res.set(this).sub(subtrahend, prec);
  }

  public RationalFunction sub(RationalFunction subtrahend, int prec, RationalFunction res)
  {
    res.bits = prec;
    return res.set(this).sub(subtrahend, prec);
  }

  public Complex tanh(int bits, Complex result)
  {
    return result.set(this).tanh(bits);
  }

  public Real tanh(int bits, Real result)
  {
    return result.set(this).tanh(bits);
  }

  @Override
  public String toString()
  {
    String nameStr = name != null ? (name + "=") : "";

    if (dim > 1)
    {
      StringBuffer buf = new StringBuffer(nameStr + "[");
      for (int i = 0; i < dim; i++)
      {
        if (i > 0)
        {
          buf.append(" ");
        }
        buf.append(arblib.fmpz_get_str(null, 10, elements[i].swigCPtr));
      }
      buf.append("]");
      return buf.toString();
    }
    else
    {
      return nameStr + arblib.fmpz_get_str(null, 10, swigCPtr);
    }
  }

  public Real Γ(int bits, Real result)
  {
    return result.set(this).Γ(bits);
  }

  public Integer add(Integer operand, Integer result)
  {
    return add(operand, 0, result);
  }

  public Integer sub(Integer operand, Integer result)
  {
    return sub(operand, 0, result);
  }

  public Integer mul(Integer four, Integer result)
  {
    return mul(four, 0, result);
  }

  @Override
  public int dim()
  {
    return dim;
  }

  public ComplexFraction div(Integer i, int bits, ComplexFraction result)
  {
    div(i, bits, result.realPart);
    result.imaginaryPart.zero();
    return result;
  }

  public boolean isZero()
  {
    return arblib.fmpz_is_zero(swigCPtr) != 0;
  }

  public Integer abs(Integer res)
  {
    arblib.fmpz_abs(res.swigCPtr, swigCPtr);
    return this;
  }

}
