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

  @Override
  public void close() 
  {
    delete();
  }

%}
