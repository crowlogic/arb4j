%typemap(javainterfaces) fmpq "Becomable<Fraction>,AutoCloseable,NamedField<Fraction>,Verifiable,Comparable<Fraction>"
%typemap(javafinalize) fmpq ""
%typemap(javaimports) fmpq %{
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.Objects;
import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.functions.NullaryFunction;
import arb.utensils.Utensils;

/**
 * The {@link Fraction} class models rational numbers by mapping to FLINT's
 * fmpq_t type via SWIG, <br>
 * providing exact arithmetic and mathematical functions through JNI bindings to
 * the Arb library.
 *
 * <p>
 * Core features:
 * <ul>
 * <li>Basic arithmetic (+, -, *, /)</li>
 * <li>Advanced mathematical functions (gamma, factorial, powers)</li>
 * <li>Field operations and vector arithmetic</li>
 * <li>Automatic reduction to canonical form</li>
 * <li>Conversions to/from Real and Complex numbers</li>
 * </ul>
 *
 * <p>
 * String representation uses Unicode characters for display:
 * <ul>
 * <li>Superscripts (⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹) for numerators</li>
 * <li>Subscripts (₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉) for denominators</li>
 * <li>Fraction slash (⁄, U+2044) to make the fraction appear with the numerator
 * raised and the denomnitor lowered</li>
 * </ul>
 *
 * @see BusinessSourceLicenseVersionOnePointOne
 * @see TheArb4jLibrary
 */
%}

%typemap(javacode) fmpq %{

  public AlgebraicNumber pow(Fraction exponent, int prec, AlgebraicNumber result)
  {
    try ( AlgebraicNumber base = new AlgebraicNumber(); AlgebraicNumber exp = new AlgebraicNumber())
    {
      return base.set(this).pow(exp.set(exponent), prec, result);
    }
  }
  
  public Complex Γ(int bits, Complex result)
  {
    result.set(this);
    arblib.acb_gamma(result, result, bits);
    result.bits = bits;
    return result;
  }
  
  public Real Γ(int bits, Real res)
  {
    return res.set(this).Γ(bits);
  }

  public AlgebraicNumber mul(AlgebraicNumber x, int prec, AlgebraicNumber result)
  {
    return result.set(this).mul(x, prec, result);
  }
    
  @SuppressWarnings("resource")
  public static Fraction named(String string)
  {
    return new Fraction().setName(string);
  }

  public RealPolynomial Γ(int bits, RealPolynomial res)
  {
    try ( var blip = new Real())
    {
      blip.set(this).Γ(bits, blip);
      return res.set(blip);
    }
  }
  
  public ComplexPolynomial add(ComplexPolynomial that, int bits, ComplexPolynomial result)
  {
    result.set(this);
    return result.add(that, bits);   
  }

  public Real mul(Fraction element, int prec, Real result)
  {
    try ( Real blip = new Real())
    {
      return mul(result.set(element), prec,result);
    }
  }
  
  public RealPolynomial mul(RealPolynomial that, int bits, RealPolynomial result)
  {
    return result.set(this).mul(that,bits,result);
  }

  public ComplexRationalFunction div(ComplexRationalFunction divisor, int prec, ComplexRationalFunction result)
  {
    return result.set(this).div(divisor, prec, result);
  }
  
  public Integer floor(int bits, Integer result)
  {
    try ( var blip = new Real())
    {
      return blip.set(this).floor(bits, result);
    }
  }

  public boolean isOne()
  {
    return arblib.fmpq_is_one(this) != 0;
  }
        
  public RealPolynomial add(RealPolynomial that, int bits, RealPolynomial result)
  {
    result.set(this);
    return result.add(that, bits);   
  }

  public RationalFunction div(RationalFunction divisor, int prec, RationalFunction result)
  {
    return result.set(this).div(divisor, prec, result);
  }
  
  public Fraction(Real val)
  {
    this();
    set(val);
  }
  
  public Complex sub(Fraction element, int prec, Complex result)
  {
    try ( Fraction blip = new Fraction())
    {      
      return result.set(sub(element, prec, blip));
    }
  }
  
  @Override
  public Fraction inverse(Fraction res)
  {
    arblib.fmpq_inv(res, this );
    return res;
  }
    
  public RealPolynomial div(RealPolynomial divisor, int prec, RealPolynomial result)
  {
    return result.set(this).div(divisor, prec, result);
  }
 
  public Complex neg( Complex result )
  {
    return result.set(this).neg();
  }
   
  public RationalFunction add(RationalFunction element, int prec, RationalFunction result)
  {
    return result.set(this).add(element, prec, result);
  }
  
  public Real sqrt(int bits, Real result)
  {
    assert bits > 0 : "bits must be strictly positive";
    return result.set(this).sqrt(bits);
  }

  public Real floor(int bits, Real result)
  {
    return result.set(this).floor(bits, result);
  }
 
  public Fraction sub(Real subtrahend, int prec, Fraction result)
  {
    try ( Fraction blip = new Fraction())
    {
      return sub(blip.set(subtrahend), prec, result);
    }
  }
  
  public Fraction add(Real addend, int prec, Fraction result)
  {
    try ( Fraction blip = new Fraction())
    {
      return add(blip.set(addend), prec, result);
    }
  }
  
  public double doubleValue()
  {
    assert swigCPtr != 0 : "null pointer";
    return arblib.fmpq_get_d(this);
  }
    
  public Fraction become(Fraction that)
  {
    close();
    elements         = that.elements;
    swigCPtr         = that.swigCPtr;
    swigCMemOwn      = that.swigCMemOwn;
    dim              = that.dim;
    name             = that.name;
    that.swigCMemOwn = false;
    return this;
  }

  public Fraction(int numerator, int denominator)
  {
    this();
    set(numerator, denominator);
  }

  public static int BYTES = Integer.BYTES * 2;

  public ComplexFraction sub(Integer element, int prec, ComplexFraction result)
  {
    sub(element, prec, result.realPart);
    result.imaginaryPart.zero();
    return result;
  }

  public ComplexFraction sub(Fraction element, int prec, ComplexFraction result)
  {
    sub(element, prec, result.realPart);
    result.imaginaryPart.zero();
    return result;
  }
  
  public ComplexFraction neg( ComplexFraction result )
  {
    neg(result.realPart);
    result.imaginaryPart.zero();
    return result;
  }

  public Complex mul(Complex that, int bits, Complex result)
  {
    return result.set(this).mul(that,bits,result);
  }
  
  public Fraction add(Integer that, int prec, Fraction res)
  {
    arblib.fmpq_add_fmpz(res, this, that.swigCPtr );    
    return res;
  }
  
  public ComplexFraction add(Complex that, int bits, ComplexFraction result)
  {
    result.realPart.set(this);
    result.imaginaryPart.zero();
    return result.add(that, bits, result);   
  }
  
  public Real sub(Real element, int prec, Real result)
  {
    return result.set(this).sub(element, prec, result);
  }

  public Fraction mul(Integer that, int prec, Fraction res)
  {
    arblib.fmpq_sub_fmpz(res, this, that.swigCPtr );    
    return res;
  }  

  public boolean
         isZero()
  {
    return arblib.fmpq_is_zero(this) != 0;
  }

  public Real ascendingFactorial(Integer power, int bits, Real result)
  {
    return result.set(this, bits).ascendingFactorial(power, bits);
  }
      
  public Fraction set(int numerator, int denominator)
  {
    setNumeratorAddress(numerator);
    setDenominatorAddress(denominator);
    if (this.numerator != null)
    {
      this.numerator.swigCPtr = numerator;
    }
    if (this.denominator != null)
    {
      this.denominator.swigCPtr = denominator;
    }
    return this;
  }
  
  public ComplexRationalFunction
         add(ComplexRationalFunction addend, int prec, ComplexRationalFunction result)
  {
    addend.realPart.add(this, prec, result.realPart);
    result.imaginaryPart.set(addend.imaginaryPart);
    return result;
  }

  public ComplexRationalFunction
         sub(ComplexRationalFunction subtrahend, int prec, ComplexRationalFunction result)
  {
    sub(subtrahend.realPart,prec,result.realPart);
    subtrahend.imaginaryPart.neg(result.imaginaryPart);
    return result;
  }
    
  @Override
  public boolean verify()
  {
    boolean denominatorConsistent = denominator == null || denominator.swigCPtr == getDenominatorAddress();
    boolean numeratorConsistent   = numerator == null || numerator.swigCPtr == getNumeratorAddress();
    return denominatorConsistent && numeratorConsistent;
  }

  public void assertPointerConsistency()
  {
    if (!verify())
    {
      throw new ArbException(String.format("swigCPtr=%s\nnumeratorAddress=%s\ndenominatorAddress=%s\nnumerator=%s\ndenominator=%s\n",
                                           swigCPtr != 0 ? getNumeratorAddress() : 0,
                                           swigCPtr != 0 ? getDenominatorAddress() : 0,
                                           numerator == null ? "null" : numerator.swigCPtr,
                                           denominator == null ? "null" : denominator.swigCPtr));
    }
  }
  
  public Fraction sub(Integer that, int prec )
  {
    return sub(that,prec,this);
  }
  
  public Fraction sub(Integer that, int prec, Fraction res )
  {
    arblib.fmpq_sub_fmpz(res, this, that.swigCPtr );    
    return res;
  }
  
  public Real mul(Real that, int bits, Real result)
  {
    return result.set(this).mul(that,bits,result);
  }
    
  public Real mul(Integer that, int bits, Real result)
  {
    return result.set(this).mul(that,bits,result);
  }

  public Real add(Real real, int bits, Real result)
  {
    if (result == null)
    {
      result = new Real();
    }
    try ( Real blip = new Real())
    {
      return blip.set(this).add(real, bits, result);
    }
  }  

  public ComplexRationalFunction mul(ComplexRationalFunction that, int bits, ComplexRationalFunction result)
  {
    return result.set(this).mul(that,bits,result);
  }
        
  public RationalFunction mul(RationalFunction that, int bits, RationalFunction result)
  {
    return result.set(this).mul(that,bits,result);
  }
  
  public Fraction set(Integer val)
  {
    arblib.fmpq_set_fmpz(this, val.swigCPtr );
    return this;
  }
  
  public RationalFunction ascendingFactorial(Integer power, int bits, RationalFunction result)
  {
    try ( Real thisReal = new Real())
    {
      thisReal.set(this, bits);
      return thisReal.ascendingFactorial(power, bits, result);
    }
  }
  
  /**
   * NOTICE: this is 1-indexed, not 0 indexed like this{@link #get(int)} !!!
   * 
   * @param k
   * @return
   */
  public Fraction get(Integer k)
  {
    return get(k.getSignedValue() - 1);
  }
  
  @Override
  public String getName()
  {
    return name;
  }

  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
    this.name = name;
    return (N) this;
  }
  
  public String name;


  public Fraction set(Fraction... elements)
  {
    close();
    this.elements    = elements;
    this.dim         = elements.length;
    this.swigCMemOwn = false;
    this.swigCPtr    = elements.length > 0 ? elements[0].swigCPtr : 0;
    return this;
  }
  
  public Arena arena;
  public int           dim = 1;
  public Fraction[] elements;

  public Fraction resize(Arena arena, int alloc)
  {
    if (alloc == dim)
    {      return this;
    }
    Fraction newLocation = Fraction.newVector(arena,alloc).setName(name);
    int  nd          = Math.min(alloc, dim);
    for (int i = 0; i < nd; i++)
    {
      newLocation.get(i).set(get(i));
    }
    become(newLocation);
    return this;
  }
  
  @SuppressWarnings("resource")
  public static Fraction newVector(Arena arena, int dim)
  {
    MemorySegment segment = arena.allocate(Long.BYTES * dim * 2);
    Fraction array = new Fraction(segment.address(),
                                  false);
    array.arena = arena;
    array.dim         = dim;
    array.elements    = new Fraction[array.dim = dim];
    for ( int i = 0; i < dim; i++ )
    {
      Fraction frac = new Fraction(array.swigCPtr + i*Long.BYTES*2, false );
      array.elements[i] = frac.init();
    }
    return array;
  }

  public Fraction init()
  {
    arblib.fmpq_init(this);
    return this;
  }
  
  static
  {
    System.loadLibrary("arblib");
  }

  public Complex add(Complex that, int bits, Complex result)
  {
    result.zero().getReal().set(this);
    return result.add(that, bits);   
  }
  
  public Complex sub(Complex that, int bits, Complex result)
  {
    result.zero().getReal().set(this);
    return result.sub(that, bits);   
  }
  
  public ComplexPolynomial sub(ComplexPolynomial element, int prec, ComplexPolynomial result)
  {
    result.setLength(1);
    result.fitLength(1);
    result.getCoeffs().re().set(this);
    return result.sub(element, prec);
  }    
    
  public Fraction neg()
  {
    return neg(this);
  }
  
  public Fraction neg( Fraction result )
  {
    arblib.fmpq_neg(result, this);   
    return result;
  }
 
  public Real neg( Real result )
  {
    return result.set(this).neg();
  }
   
  public Real sub(Fraction element, int prec, Real result)
  {
    try ( Fraction blip = new Fraction())
    {      
      return result.set(sub(element, prec, blip));
    }
  }
  
  public Fraction set(int j)
  {
    arblib.fmpq_set_si(this, j, 1);
    return this;
  } 
  
  public Fraction set(Real value)
  {
    if (dim != value.dim)
    {
      become(Fraction.newVector(Arena.global(), value.dim));
    }
    assert value != null : "value is null";
    for (int i = 0; i < dim; i++)
    {

      Real ithElement = value.get(i);
      if (!ithElement.isExact())
      {
        var str   = String.valueOf(ithElement.doubleValue());
        var point = str.indexOf('.');
        if (point < 0)
        {
          get(i).set(str);
        }
        else
        {
          var    integerPart     = str.substring(0, point);
          var    fractionalPart  = str.substring(point + 1);
          var    fractionalUnits = "1" + Utensils.repeat('0', fractionalPart.length());
          String expr            = String.format("%s+%s/%s", integerPart, fractionalPart, fractionalUnits);
          NullaryFunction.express(Fraction.class, expr).evaluate(null, 128, get(i));
        }
      }
      else
      {
        arblib.arf_get_fmpq(this.get(i), ithElement.getMid());
      }

    }
    return this;
  }

  public RealPolynomial sub(RealPolynomial element, int prec, RealPolynomial result)
  {
    return result.set(this).sub(element, prec, result);
  }
  
  public RationalFunction add(Fraction element, int prec, RationalFunction result)
  {
    return result.set(this).add(element,prec, result);
  }
  
  public RationalFunction sub(RationalFunction element, int prec, RationalFunction result)
  {
    return result.set(this).sub(element, prec, result);
  }
  
  @Override
  public int
         hashCode()
  {
    return Objects.hash(numerator, denominator);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (obj == null)
    {
      return false;
    }
    if (obj instanceof RationalFunction rfunc)
    {
      if (rfunc.isFraction())
      {
        Integer otherNumerator   = rfunc.getNumerator().get(0);
        Integer otherDenominator = rfunc.getDenominator().get(0);
        Integer thisNumerator    = getNumerator();
        Integer thisDenominator  = getDenominator();
        return otherNumerator.equals(thisNumerator) && otherDenominator.equals(thisDenominator);
      }
    }
    if (!(obj instanceof Fraction))
    {
      return false;
    }
    Fraction that = (Fraction) obj;
    return arblib.fmpq_equal(this, that) != 0;
  }    
  
  private Integer numerator;
  private Integer denominator;

  public Fraction add(Fraction that, Fraction result)
  {
    arblib.fmpq_add(result, this, that);
    return result;
  }

  public Fraction sub(Fraction that, Fraction result)
  {
    arblib.fmpq_sub(result, this, that);
    return result;
  }

  public Fraction mul(Fraction that, Fraction result)
  {
    arblib.fmpq_mul(result, this, that);
    return result;
  }

  public Fraction div(Fraction that, Fraction result)
  {
    arblib.fmpq_div(result, this, that);
    return result;
  }

  public Fraction set(String str)
  {
    arblib.fmpq_set_str(this, str.replaceAll("⁄", "/"), 10);
    return this;
  }
          
@Override
  public String toString()
  {
    if (dim == 1)
    {
      return arblib.fmpq_get_str(null, 10, this).replaceAll("/", "⁄");
    }
    StringBuilder sb = new StringBuilder("[");
    for (int i = 0; i < dim; i++)
    {
      if (i > 0)
        sb.append(", ");
      sb.append(get(i).toString());
    }
    sb.append("]");
    return sb.toString();
  }
    
  public Fraction one()
  {
    arblib.fmpq_one(this);
    return this;
  }
  
  public Integer getDenominator()
  {
    if (denominator == null)
    {
      denominator = new Integer(swigCPtr + Long.BYTES,
                                false);
    }
    else
    {
      denominator.swigCPtr = swigCPtr + Long.BYTES;
    }
    return denominator;
  }

  public Integer getNumerator()
  {
    if (numerator == null)
    {
      numerator = new Integer(swigCPtr,
                              false);
    }
    else
    {
      numerator.swigCPtr = swigCPtr;
    }
    return numerator;
  }
  
  @Override
  public void close() {
      if (swigCPtr != 0) {
          if (swigCMemOwn) {
              swigCMemOwn = false;
              if (dim == 1) {
                  arblibJNI.delete_Fraction(swigCPtr);
              }
              // For vectors (dim > 1), we don't need to do anything here
              // The Arena passed to newVector will handle the memory cleanup
          }
          swigCPtr = 0;
      }
  }
  
  @Override
  public Fraction add(Fraction element, int prec, Fraction result)
  {
    return add(element,result);
  }

  @Override
  public int bits()
  {
    return 0;
  }

  @Override
  public int dim()
  {
    return dim;
  }

  @Override
  public Fraction div(int j, int prec, Fraction result)
  {
    arblib.fmpq_div_fmpz(result, this, j);
    return result;
  }
  
  @Override
  public Fraction div(Fraction j, int prec, Fraction result)
  {
    return div(j,result);
  }

  @Override
  public Fraction get(int index)
  {
    assert index < dim : String.format("index = %d >= dim = %d", index, dim);
    if (index == 0 && dim == 1)
    {
      return this;
    }
    return elements[index];
  }

  @Override
  public Fraction mul(int x, int prec, Fraction result)
  {
    arblib.fmpq_mul_fmpz(result, this, x);
    return result;
  }

  @Override
  public Fraction mul(Fraction x, int prec, Fraction result)
  {
    return mul(x,result);
  }

  @Override
  public Fraction newFieldElement()
  {
    return new Fraction();
  }

  @Override
  public Fraction set(Fraction value)
  {
    getNumerator().set(value.getNumerator());
    getDenominator().set(value.getDenominator());
    return this;
  }

  @Override
  public Fraction sub(Fraction element, int prec, Fraction result)
  {
    return sub(element,result);
  }

  @Override
  public Fraction zero()
  {
    arblib.fmpq_zero(this);
    return this;
  }
  
  @Override
  public Fraction additiveIdentity()
  {
    return zero();
  }

  @Override
  public Fraction multiplicativeIdentity()
  {
    return one();
  }

  public Fraction pow(Integer n, int bits, Fraction result)
  {
    arblib.fmpq_pow_fmpz(result, this, n.swigCPtr);
    return result;
  }

  public Real div(Real divisor, int prec, Real result)
  {
    return result.set(this).div(divisor, prec, result);
  }

  
  public Fraction pow(Integer n, int bits)
  {
    return pow(n,bits,this);
  }

  public RationalFunction pow(Integer n, int bits, RationalFunction result)
  {
    try ( RationalFunction blip = new RationalFunction() )
    {
      return blip.set(this).pow(n, bits, result);
    }
  }
    
  /**
   * Reduces this {@link Fraction} into its simplest form, dividing the
   * {@link #numerator} and the this#denominator by the highest common factor.
   * 
   * @return this
   */
  public Fraction reduce()
  {
    arblib.fmpq_canonicalise(this);
    return this;
  }

  /**
   * A {@link Fraction} is said to be in canonical form if the this#numerator and
   * this#denominator have no common factor and the denominator is positive.
   * Except where otherwise noted, all functions in the fmpq module assume that
   * inputs are in canonical form, and produce outputs in canonical form. The
   * numerator and denominator of an fmpq_t can be modified severally as arbitrary
   * integers, but then becomes responsible for canonicalising the number (for
   * example by calling fmpq_canonicalise) before passing it to any library
   * function.
   * 
   * @return true if {@link arblib#fmpq_is_canonical(Fraction)} != 0
   */
  public boolean isReduced()
  {
    return arblib.fmpq_is_canonical(this) != 0;
  }    


  @Override
  public Stream<Fraction>
         stream()
  {
    return Stream.of(elements);
  }  
  
  public boolean isNegative()
  {
    return sign() < 0;
  }

  public int sign()
  {
    return arblib.fmpq_sgn(this);
  }
  
  @Override
  public int compareTo(Fraction o)
  {
    return arblib.fmpq_cmp(this, o);
  }
  
  
%};
 