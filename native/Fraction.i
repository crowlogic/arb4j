%typemap(javainterfaces) fmpq "AutoCloseable,Field<Fraction>"
%typemap(javafinalize) fmpq ""
%typemap(javaimports) fmpq %{
import java.util.Objects;
%}

%typemap(javacode) fmpq %{
  static
  {
    System.loadLibrary("arblib");
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
        
  public String toString()
  {
    return arblib.fmpq_get_str(null, 10,this);
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
  public void close() 
  {
    delete();
  }  
  
  @Override
  public Fraction add(Fraction element, int prec, Fraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public int bits()
  {
    return 0;
  }

  @Override
  public int dim()
  {
    return 1;
  }

  @Override
  public Fraction div(int j, int prec, Fraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction div(Fraction j, int prec, Fraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction get(int index)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public String getName()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction mul(int x, int prec, Fraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction mul(Fraction x, int prec, Fraction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction newFieldElement()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction set(Fraction value)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public Fraction sub(Fraction element, int prec, Fraction result)
  {
    assert false : "TODO";
    return null;
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
 