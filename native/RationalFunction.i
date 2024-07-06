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
%typemap(javainterfaces) fmpq_poly_struct "Named,AutoCloseable,Ring<RationalFunction>"

%typemap(javacode) fmpq_poly_struct %{
  static { System.loadLibrary( "arblib" ); }

  public String name;
  
  @SuppressWarnings("unchecked")
  @Override
  public RationalFunction setName(String name)
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
  public RationalFunction mul(RationalFunction operand, int prec, RationalFunction result)
  {
    arblib.fmpq_poly_mul(result, this, operand);
    return result;
  }
  
  @Override
  public RationalFunction div(RationalFunction operand, int prec, RationalFunction result)
  {
    arblib.fmpq_poly_div(result, this, operand);
    return result;
  }

  @Override
  public RationalFunction add(RationalFunction addend, int bits, RationalFunction result)
  {
    arblib.fmpq_poly_add(result, this, addend);
    return result;
  }

  @Override
  public RationalFunction sub(RationalFunction subtrahend, int bits, RationalFunction result)
  {
    arblib.fmpq_poly_sub(result, this, subtrahend);
    return result;
  }
  
  public RationalFunction( String str)
  {
    this();
    set(str);
  }
  
  public RationalFunction set(String str )
  {
    arblib.fmpq_poly_set_str(this, str);
    return this;
  }
  
  /**
   * 
   * @return {@link arblib#fmpq_poly_get_str_pretty(RationalFunction, String)}e
   */
  public String toPrettyString()
  {
    return arblib.fmpq_poly_get_str_pretty(this, new String());
  }

  /**
   * 
   * @return {@link arblib#fmpq_poly_get_str(RationalFunction)}
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
