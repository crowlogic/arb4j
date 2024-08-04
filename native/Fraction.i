%typemap(javainterfaces) fmpq "AutoCloseable,Field<Fraction>,Named,Verifiable"
%typemap(javafinalize) fmpq ""
%typemap(javaimports) fmpq %{
import java.util.Objects;
import arb.exceptions.ArbException;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
%}

%typemap(javacode) fmpq %{

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
  
  public MemorySegment nativeSegment;
  public int           dim = 1;
  public Fraction[] elements;

  public static Fraction newVector(Arena arena, int dim)
  {
    MemorySegment segment = arena.allocate(Long.BYTES * dim * 2);
    Fraction array = new Fraction(segment.address(),
                                  false);
    array.nativeSegment = segment;
    array.dim         = dim;
    array.elements    = new Fraction[array.dim = dim];
    for ( int i = 0; i < dim; i++ )
    {
      Fraction frac = new Fraction(array.swigCPtr + i*Long.BYTES*2, false );
      array.elements[i] = frac;
      arblib.fmpq_init(frac);
    }
    return array;
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
    return this;
  }
    
  public Fraction set(int j)
  {
    arblib.fmpq_set_fmpz(this, j);
    return this;
  } 
  
  public Fraction set(Real value)
  {
    if ( !value.isExact() )
    {
      throw new ArbException(value + " must be exact to be representable as a fraction");      
    }
    arblib.arf_get_fmpq(this, value.getMid());
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
  public boolean
         equals(Object obj)
  {
    if (obj == null)
    {
      return false;
    }
    if (!obj.getClass()
            .isAssignableFrom(Fraction.class))
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
    arblib.fmpq_set_str(this, str, 10);
    return this;
  }
        
  @Override
  public String toString()
  {
    if (dim == 1)
    {
      return arblib.fmpq_get_str(null, 10, this);
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
    setNumeratorAddress(value.getNumeratorAddress());
    setDenominatorAddress(value.getDenominatorAddress());
    if ( numerator != null )
    {
      numerator.swigCPtr = getNumeratorAddress();      
    }
    if ( denominator != null )
    {
      denominator.swigCPtr = getDenominatorAddress(); 
    }
    return this;
  }

  @Override
  public Fraction sub(Fraction element, int prec, Fraction result)
  {
    return set(element,result);
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
    assert false : "TODO";
    return null;
  }

  public RationalFunction pow(Integer n, int bits, RationalFunction result)
  {
    try ( RationalFunction tmp = new RationalFunction() )
    {
      tmp.set(this);
      tmp.pow(n, bits, result);
      return result;
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
  
%};
 