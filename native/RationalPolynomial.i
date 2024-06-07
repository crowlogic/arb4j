%typemap(javafinalize) fmpq_poly_struct ""

%typemap(javaimports) fmpq_poly_struct %{
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.algebra.Ring;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}
%typemap(javafinalize) fmpq_poly_struct ""
%typemap(javainterfaces) fmpq_poly_struct "Named,AutoCloseable,Ring<RationalPolynomial>"

%typemap(javacode) fmpq_poly_struct %{
  static { System.loadLibrary( "arblib" ); }

  public String name;
  
  @SuppressWarnings("unchecked")
  @Override
  public RationalPolynomial setName(String name)
  {
    this.name = name;
    return this;
  }

  @Override
  public String getName()
  {
    return name;
  }
  
  @Override
  public RationalPolynomial mul(RationalPolynomial operand, int prec, RationalPolynomial result)
  {
    arblib.fmpq_poly_mul(result, this, operand);
    return result;
  }
  
  @Override
  public RationalPolynomial div(RationalPolynomial operand, int prec, RationalPolynomial result)
  {
    arblib.fmpq_poly_div(result, this, operand);
    return result;
  }

  @Override
  public RationalPolynomial add(RationalPolynomial addend, int bits, RationalPolynomial result)
  {
    arblib.fmpq_poly_add(result, this, addend);
    return result;
  }

  @Override
  public RationalPolynomial sub(RationalPolynomial subtrahend, int bits, RationalPolynomial result)
  {
    arblib.fmpq_poly_sub(result, this, subtrahend);
    return result;
  }
  
  public RationalPolynomial( String str)
  {
    this();
    set(str);
  }
  
  public RationalPolynomial set(String str )
  {
    arblib.fmpq_poly_set_str(this, str);
    return this;
  }
  
  /**
   * 
   * @return {@link arblib#fmpq_poly_get_str_pretty(RationalPolynomial, String)}e
   */
  public String toPrettyString()
  {
    return arblib.fmpq_poly_get_str_pretty(this, new String());
  }

  /**
   * 
   * @return {@link arblib#fmpq_poly_get_str(RationalPolynomial)}
   */
  @Override
  public String toString()
  {
    return arblib.fmpq_poly_get_str(this);
  }
  
  @Override
  public void close() 
  {
    delete();
  }

%}
