%typemap(javainterfaces) fmpz_poly_q_struct "Named,AutoCloseable,Field<RationalFunction>,Function<Fraction,Fraction>"
%typemap(javafinalize) fmpz_poly_q_struct ""
%typemap(javaimports) fmpz_poly_q_struct %{
import arb.functions.Function;
%}

%typemap(javaconstruct) fmpz_poly_q_struct %{
  {
    this($imcall, true);
    init();
  }
%}

%typemap(javacode) fmpz_poly_q_struct %{

  public RationalFunction pow(Integer power, int unused, RationalFunction res)
  {
    arblib.fmpz_poly_q_pow(res, this, power.swigCPtr);
    return res;
  }
  
  @Override
  public Fraction evaluate(Fraction t, int order, int bits, Fraction res)
  {
    arblib.fmpz_poly_q_evaluate_fmpq(res, this, t);
    return res;
  }
  
  static
  {
    System.loadLibrary("arblib");
  }

  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof RationalFunction))
    {
      return false;
    }
    RationalFunction that = (RationalFunction)obj;
    return arblib.fmpz_poly_q_equal(this, that) != 0;
  }
  
  public RationalFunction init()
  {
    arblib.fmpz_poly_q_init(this);
    return this;    
  }
  
  public RationalFunction set(int i)
  {
    arblib.fmpz_poly_q_set_si(this, i);
    return this;
  }
  
  public IntegerPolynomial numerator;
 
  public IntegerPolynomial denominator;

  public IntegerPolynomial getDenominator()
  {
    if (denominator == null)
    {
      denominator = new IntegerPolynomial(getLongDenominator(),
                                          false);
    }
    else
    {
      denominator.swigCPtr = getLongDenominator();
    }
    return denominator;
  }

  public IntegerPolynomial getNumerator()
  {
    if (numerator == null)
    {
      numerator = new IntegerPolynomial(getLongNumerator(),
                                        false);
    }
    else
    {
      numerator.swigCPtr = getLongNumerator();
    }
    return numerator;
  }
    
  @Override
  public void close() 
  {
    delete();
  }  
  
  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
    this.name = name;
    return (N) this;
  }

  @Override
  public RationalFunction additiveIdentity()
  {
    return zero();
  }
    
  @Override
  public String toString()
  {
    return arblib.fmpz_poly_q_get_str_pretty(this, "x");
  }
  
  @Override
  public RationalFunction multiplicativeIdentity()
  {
   getNumerator().set(0);
   getNumerator().set(1,1);
   getDenominator().set(1);
   return this;
  }
  
  @Override
  public RationalFunction add(RationalFunction element, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_add(result, this, element);
    return result;
  }

  public int bits = 128;
  
  @Override
  public int bits()
  {
    return bits;
  }

  @Override
  public int dim()
  {
    return 1;
  }

  public RationalFunction identity()
  {
    return multiplicativeIdentity();
  }

  @Override
  public RationalFunction div(RationalFunction operand, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_div(result, this, operand);
    return this;
  }

  @Override
  public RationalFunction get(int index)
  {
    assert index == 0 : "index can only be 0";
    return this;
  }

  @Override
  public String getName()
  {
    return name;
  }

  public String name;
  
  @Override
  public RationalFunction mul(int x, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_scalar_mul_si(result, this, x);
    return result;
  }

  @Override
  public RationalFunction mul(RationalFunction x, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_mul(result, this, x);
    return this;
  }

  @Override
  public RationalFunction newFieldElement()
  {
     return new RationalFunction();
  }

  @Override
  public RationalFunction set(RationalFunction value)
  {
    arblib.fmpz_poly_q_set(this, value);
    return this;
  }

  @Override
  public RationalFunction div(int j, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_scalar_div_si(result, this, j);
    return result;
  }

  public RationalFunction div(Integer j, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_scalar_div_fmpz(result, this, j.swigCPtr);
    return result;  
  }
  
  @Override
  public RationalFunction sub(RationalFunction element, int prec, RationalFunction result)
  {
    arblib.fmpz_poly_q_sub(result, this, element);
    return this;
  }

  @Override
  public RationalFunction zero()
  {
    arblib.fmpz_poly_q_zero(this);
    return this;
  }
  
  public RationalFunction set(Real real)
  {
    assert false : "TODO: support assignment from real?";
    return null;
  }  

  public RationalFunction set(Integer integer)
  {
   set(integer.getSignedValue());
   return this;
  }

  public RationalFunction neg(RationalFunction res)
  {
    arblib.fmpz_poly_q_neg(res, this);
    return this;
  }
  
  public RationalFunction neg()
  {
    return neg(this);
  }

  public RationalFunction mul(Real real, int bits, RationalFunction result)
  {
    assert false : "TODO";
    return null;
  }  
  
  public RationalFunction reduce()
  {
    arblib.fmpz_poly_q_canonicalise(this);
    return this;
  }
  
  public boolean isReduced()
  {   
    return arblib.fmpz_poly_q_is_canonical(this) != 0;                
  }
  
  public RationalFunction set(Fraction fraction)
  {
    getNumerator().set(fraction.getNumerator());
    getDenominator().set(fraction.getDenominator());
    return this;
  }
  
  public RationalFunction add(Fraction element, int prec, RationalFunction result)
  {
    try ( RationalFunction e = new RationalFunction())
    {
      e.set(element);
      return result.set(this).add(e, prec, result);
    }
  }
    
%};
 