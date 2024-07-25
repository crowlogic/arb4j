%typemap(javafinalize) fmpz_poly_struct ""

%typemap(javaimports) fmpz_poly_struct %{
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.algebra.Ring;
 
/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}
%typemap(javafinalize) fmpz_poly_struct ""
%typemap(javainterfaces) fmpz_poly_struct "AutoCloseable,Ring<IntegerPolynomial>"

%typemap(javacode) fmpz_poly_struct %{
  static { System.loadLibrary( "arblib" ); }
  
  public IntegerPolynomial remainder;
  
  @Override
  public String toString()
  {
    return arblib.fmpz_poly_get_str_pretty(this, null);
  }
  
  public String name;

  public IntegerPolynomial add(IntegerPolynomial addend, IntegerPolynomial res)
  {
    return add(addend, 0, res);
  }

  public IntegerPolynomial set(int i)
  {
    arblib.fmpz_poly_set_si(this, i);
    return this;
  }
  
  public IntegerPolynomial set(Integer i)
  {
    arblib.fmpz_poly_set_fmpz(this, i.swigCPtr);
    return this;
  }
  
  public IntegerPolynomial(String str)
  {
    this();
    set(str);
  }

  public IntegerPolynomial set(String str)
  {
    arblib.fmpz_set_str(swigCPtr, str, 10);
    return this;
  }
  
  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof IntegerPolynomial))
    {
      return false;
    }
    IntegerPolynomial that = (IntegerPolynomial) obj;

    return arblib.fmpz_poly_equal(this, that) != 0;
  }
  
  public IntegerPolynomial add(IntegerPolynomial addend, int bits, IntegerPolynomial res)
  {
    arblib.fmpz_poly_add(res, this, addend);
    return res;
  }
    
  @Override
  public void close() 
  {
    delete();
  }
  
    @Override
  public IntegerPolynomial mul(IntegerPolynomial operand, int prec, IntegerPolynomial result)
  {
    arblib.fmpz_poly_mul(result, this, operand);
    return result;
  }

  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
   this.name = name;
   return (N) this;
  }

  @Override
  public String getName()
  {
    return name;
  }
  
  @Override
  public IntegerPolynomial div(IntegerPolynomial operand, int prec, IntegerPolynomial result)
  {
    arblib.fmpz_poly_div(result, this, operand);
    return result;
  }  
  
  @Override
  public IntegerPolynomial sub(IntegerPolynomial subtrahend, int bits, IntegerPolynomial res)
  {
    arblib.fmpz_poly_sub(res, this, subtrahend);
    return res;
  }

  public int get(int i)
  {
   return arblib.fmpz_poly_get_coeff_si(this, i);
  }
  
  public IntegerPolynomial div(IntegerPolynomial operand, IntegerPolynomial result)
  {
    return div(operand,0, result);
  }
  
  public IntegerPolynomial mul(IntegerPolynomial operand, IntegerPolynomial result)
  {
    return mul(operand, 0, result);
  }  
  
  public IntegerPolynomial set(int i, int j)
  {
    arblib.fmpz_poly_set_coeff_si(this, i, j);
    return this;
  }  
%}
