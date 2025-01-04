package arb;

import java.io.Closeable;
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
                     Closeable,
                     Comparable<Integer>,
                     Ring<Integer>,
                     Named
{
  public static int BYTES = Long.BYTES;

  static
  {
    System.loadLibrary("arblib");
  }

  public static Integer express(String expression)
  {
    return express(expression, 128);
  }

  public static Integer express(String expression, Context context, int bits)
  {
    return IntegerNullaryFunction.compile(expression, context).evaluate(bits);
  }

  public static Integer express(String expression, int bits)
  {
    return express(expression, null, bits);
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

  public static Integer factorial(long n, Integer result)
  {
    arblib.fmpz_fac_ui(result.swigCPtr, n);
    return result;
  }

  public static long getCPtr(Integer obj)
  {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  @SuppressWarnings("resource")
  public static Integer named(String name)
  {
    return new Integer().setName(name);
  }

  public static Integer newVector(int dim)
  {
    Integer vec = new Integer((long) dim);
    vec.dim = dim;
    return vec;
  }

  public static Integer newVectorNamed(int dim, String name)
  {
    return newVector(dim).set(name);
  }

  public static long prime(long n)
  {
    return arblib.n_nth_prime(n);
  }

  private Arena         arena;

  public int            dim         = 1;

  public Integer        divisor;

  public Integer[]      elements;

  public String         name;

  private MemorySegment nativeSegment;

  public Integer        remainder;

  public boolean        swigCMemOwn = true;

  public long           swigCPtr;

  public Integer()
  {
    init(1);
  }

  public Integer(Complex val)
  {
    this();
    assert val.im().isZero() : "imaginary part must be 0 but instead it is " + val;
    assert val.re().isExact() : "real part must be exact but instead it is " + val;
    val.re().integerValue(this);
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

  public Integer(Integer copy)
  {
    init();
    set(copy);
  }

  public Integer(long dim2)
  {
    init((int) dim2);
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

  public Integer abs(Integer res)
  {
    arblib.fmpz_abs(res.swigCPtr, swigCPtr);
    return this;
  }

  public Complex add(Complex addend, int bits, Complex result)
  {
    return result.set(this).add(addend, bits);
  }

  public ComplexPolynomial add(ComplexPolynomial addend, int bits, ComplexPolynomial result)
  {
    return result.set(this).add(addend, bits, result);
  }

  public ComplexRationalFunction add(ComplexRationalFunction addend, int bits, ComplexRationalFunction result)
  {
    return result.set(this).add(addend, bits, result);
  }

  public Complex add(Fraction operand, int prec, Complex result)
  {
    add(operand, prec, result.re());
    result.im().zero();
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

  public Fraction add(Fraction frac, int bits, Fraction result)
  {
    return result.set(this).add(frac, bits);
  }

  public Real add(Fraction addend, int bits, Real result)
  {
    try ( Real blip = new Real())
    {
      return blip.set(this).add(addend, bits, result);
    }
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

  public Integer add(Integer operand, int prec)
  {
    return add(operand, prec, this);
  }

  public AlgebraicNumber add(Integer addend, int bits, AlgebraicNumber result)
  {
    return result.set(this).add(addend, bits, result);
  }

  public Complex add(Integer operand, int prec, Complex result)
  {
    return result.set(this).add(operand, prec);
  }

  public ComplexRationalFunction add(Integer operand, int prec, ComplexRationalFunction result)
  {
    return result.set(this).add(operand, prec, result);
  }

  public Fraction add(Integer subtrahend, int prec, Fraction result)
  {
    return result.set(this).add(subtrahend, prec, result);
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
    try ( Real blip = new Real())
    {
      return blip.set(this).add(operand, prec, result);
    }
  }

  public RealMatrix add(Integer operand, int prec, RealMatrix result)
  {
    return result.set(this).add(operand, prec, result);
  }

  public Integer add(Integer operand, Integer result)
  {
    return add(operand, 0, result);
  }

  public RationalFunction add(RationalFunction addend, int bits, RationalFunction result)
  {
    return result.set(this).add(addend, bits, result);
  }

  public Complex add(Real addend, int bits, Complex result)
  {
    this.add(addend, bits, result.re());
    result.im().zero();
    return result;
  }

  public IntegerPolynomial add(Real addend, int bits, IntegerPolynomial result)
  {
    return result.set(this).add(addend, bits, result);
  }

  public Real add(Real addend, int bits, Real result)
  {
    assert bits > 0;
    arblib.arb_add_fmpz(result, addend, this.swigCPtr, bits);
    return result;
  }

  public RealPolynomial add(RealPolynomial addend, int bits, RealPolynomial result)
  {
    return result.set(this).add(addend, bits, result);
  }

  public Integer additiveIdentity()
  {
    return set(0);
  }

  public Real ascendingFactorial(Fraction n, int bits, Real result)
  {
    try ( Real blip = new Real())
    {
      return result.set(this).ascendingFactorial(blip.set(n), bits);
    }
  }

  public Integer ascendingFactorial(Integer n, int bits, Integer result)
  {
    assert n.getSignedValue() >= 0 : String.format("power=%d must be non-negative where this=%d",
                                                   n.getSignedValue(),
                                                   getSignedValue());
    ;

    try ( Real x = new Real(); Real realResult = new Real();)
    {
      arblib.arb_rising(realResult, x.set(this), realResult.set(n), bits);
      assert realResult.isInteger() : realResult + " is not an integer";
      return realResult.getInteger(result);
    }
  }

  public Real ascendingFactorial(Integer n, int bits, Real result)
  {
    assert n.getSignedValue() >= 0 : "power must be non-negative";

    try ( Real x = new Real();)
    {
      arblib.arb_rising(result, x.set(this), result.set(n), bits);
    }
    return result;
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

  public Complex cos(int prec, Complex result)
  {
    return result.set(this).cos(prec, result);
  }

  public Real cos(int prec, Real result)
  {
    return result.set(this).cos(prec, result);
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
  public int dim()
  {
    return dim;
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

  public ComplexRationalFunction div(ComplexRationalFunction dividend, int prec, ComplexRationalFunction res)
  {
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

  public ComplexFraction div(Integer i, int bits, ComplexFraction result)
  {
    div(i, bits, result.realPart);
    result.imaginaryPart.zero();
    return result;
  }

  public Fraction div(Integer dividend, int prec, Fraction res)
  {
    res.getNumerator().set(this);
    res.getDenominator().set(dividend);
    res.reduce();
    return res;
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

  public RationalFunction div(RationalFunction operand, int prec, RationalFunction result)
  {
    return result.set(this).div(operand, prec);
  }

  public RationalFunction div(Real operand, int prec, RationalFunction result)
  {
    return result.set(this).div(operand, prec, result);
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

  public Integer init(Arena arena, int n)
  {
    this.dim = n;
    return initialize(arena, n);
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

  public boolean isPositive()
  {
    return sign() >= 0;
  }

  public boolean isStrictlyPositive()
  {
    return sign() > 0;
  }

  public boolean isZero()
  {
    return arblib.fmpz_is_zero(swigCPtr) != 0;
  }

  public Complex log(int bits, Complex result)
  {
    return result.set(this).log(bits);
  }

  public Real log(int bits, Real result)
  {
    return result.set(this).log(bits);
  }

  public Complex mul(Complex x, int bits, Complex result)
  {
    return result.set(this).mul(x, bits);
  }

  public ComplexPolynomial mul(ComplexPolynomial x, int bits, ComplexPolynomial res)
  {
    return res.set(this).mul(x, bits);
  }

  public ComplexRationalFunction mul(ComplexRationalFunction x, int bits, ComplexRationalFunction res)
  {
    return res.set(this).mul(x, bits);
  }

  public Fraction mul(Fraction subtrahend, int prec, Fraction result)
  {
    return result.set(this).mul(subtrahend, prec, result);
  }

  public AlgebraicNumber mul(AlgebraicNumber multiplicand, int prec, AlgebraicNumber result)
  {
    return result.set(this).mul(multiplicand, prec, result);
  }

  
  @Override
  public Integer mul(Integer operand, int prec)
  {
    return mul(operand, prec, this);
  }

  public Complex mul(Integer operand, int prec, Complex result)
  {
    return result.set(this).mul(operand, prec, result);
  }

  public Fraction mul(Integer subtrahend, int prec, Fraction result)
  {
    return result.set(this).mul(subtrahend, prec, result);
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

  public Integer mul(Integer four, Integer result)
  {
    return mul(four, 0, result);
  }

  public IntegerPolynomial mul(IntegerPolynomial x, int bits, IntegerPolynomial res)
  {
    return res.set(this).mul(x, bits);
  }

  public RationalFunction mul(RationalFunction operand, int prec, RationalFunction result)
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

  public ComplexFraction neg(ComplexFraction res)
  {
    neg(res.realPart);
    res.imaginaryPart.zero();
    return res;
  }

  public ComplexRationalFunction neg(ComplexRationalFunction result)
  {
    return result.set(this).neg();
  }

  public Fraction neg(Fraction res)
  {
    return res.set(this).neg();
  }

  public Integer neg(Integer result)
  {
    arblib.fmpz_neg(result.swigCPtr, swigCPtr);
    return result;
  }

  public RationalFunction neg(RationalFunction res)
  {
    return res.set(this).neg();
  }

  public Real neg(Real result)
  {
    return result.set(this).neg();
  }

  public AlgebraicNumber pow(Fraction operand, int bits, AlgebraicNumber res)
  {
    return res.set(this).pow(operand, res);
  }

  public AlgebraicNumber pow(Integer exp, int bits, AlgebraicNumber result)
  {
    result.set(this);
    if (exp.sign() >= 0)
    {
      return result.pow(exp);
    }
    else
    {
      try ( var negExp = exp.neg(new Integer()))
      {
        return result.pow(negExp).inverse();
      }
    }
  }

  public ComplexRationalFunction pow(Integer operand, int bits, ComplexRationalFunction result)
  {
    try ( Integer intres = new Integer())
    {
      return result.set(pow(operand, bits, intres));
    }
  }

  public Fraction pow(Integer div, int bits, Fraction res)
  {
    Integer in  = new Integer(div);
    boolean neg = in.sign() < 0;
    if (neg)
    {
      in.neg();
    }
    pow(in, bits, in);
    res.set(in);
    return neg ? res.inverse(res) : res;
  }

  public Integer pow(Integer operand, int bits, Integer result)
  {
    if (!operand.isPositive())
    {
      throw new IllegalArgumentException(operand + " must be positive if an Integer result is required");
    }
    arblib.fmpz_pow_fmpz(result.swigCPtr, this.swigCPtr, operand.swigCPtr);
    return result;
  }

  public RationalFunction pow(Integer operand, int bits, RationalFunction result)
  {
    try ( Integer blip = new Integer())
    {
      return result.set(pow(operand, bits, blip));
    }
  }

  public Real pow(Integer operand, int prec, Real result)
  {
    return result.set(this).pow(operand, prec);
  }

  public Real pow(Real operand, int bits, Real res)
  {
    assert res != operand : "aliasing not implemented";
    return res.set(this).pow(operand, bits, res);
  }

  public Integer set(Fraction f)
  {
    assert false : "set " + f;
    return null;
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

  public Complex sin(int prec, Complex result)
  {
    return result.set(this).sin(prec, result);
  }

  public Real sin(int prec, Real result)
  {
    return result.set(this).sin(prec, result);
  }

  public AlgebraicNumber sqrt(AlgebraicNumber result)
  {
    return result.set(this).sqrt(result);
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

  public ComplexRationalFunction sub(ComplexRationalFunction addend, int bits, ComplexRationalFunction result)
  {
    return result.set(this).sub(addend, bits, result);
  }

  public Fraction sub(Fraction subtrahend, int prec, Fraction res)
  {
    return res.set(this).sub(subtrahend, prec);
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

  public Fraction sub(Integer subtrahend, int prec, Fraction result)
  {
    return result.set(this).sub(subtrahend, prec, result);
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

  public Integer sub(Integer operand, Integer result)
  {
    return sub(operand, 0, result);
  }

  public IntegerPolynomial sub(IntegerPolynomial x, int bits, IntegerPolynomial res)
  {
    return res.set(this).sub(x, bits);
  }

  public RationalFunction sub(RationalFunction subtrahend, int prec, RationalFunction res)
  {
    res.bits = prec;
    return res.set(this).sub(subtrahend, prec);
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

  public String toStringWithoutName()
  {
    String nameStr = "";

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

  public RationalFunction Γ(int bits, RationalFunction result)
  {
    try ( Real blip = new Real())
    {
      return result.set(Γ(bits, blip));
    }
  }

  public Real Γ(int bits, Real result)
  {
    return result.set(this).Γ(bits);
  }

  public Real pow(Fraction exponent, int bits, Real result)
  {
    try ( Real blip = new Real())
    {
      return pow(blip.set(exponent), bits, result);
    }
  }

}
