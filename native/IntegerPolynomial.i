%typemap(javafinalize) fmpz_poly_struct ""

%typemap(javaimports) fmpz_poly_struct %{
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
%}
%typemap(javafinalize) fmpz_poly_struct ""
%typemap(javainterfaces) fmpz_poly_struct "AutoCloseable"

%typemap(javacode) fmpz_poly_struct %{
  static { System.loadLibrary( "arblib" ); }

  public IntegerPolynomial add(IntegerPolynomial addend, IntegerPolynomial res)
  {
    return add(addend, 0, res);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof IntegerPolynomial))
    {
      return false;
    }
    IntegerPolynomial other = (IntegerPolynomial) obj;

    return arblib.fmpz_poly_equal(this, other) != 0;
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

%}
