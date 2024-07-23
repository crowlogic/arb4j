%typemap(javainterfaces) fmpz_poly_q_struct "AutoCloseable"
%typemap(javafinalize) fmpz_poly_q_struct ""
%typemap(javaimports) fmpz_poly_q_struct %{
import java.util.Objects;
%}


%typemap(javacode) fmpz_poly_q_struct %{
  static
  {
    System.loadLibrary("arblib");
  }

  private IntegerPolynomial numerator;
  private IntegerPolynomial denominator;

 
  public IntegerPolynomial getDenominator()
  {
    if (denominator == null)
    {
      denominator = new IntegerPolynomial(swigCPtr + Long.BYTES,
                                          false);
    }
    else
    {
      denominator.swigCPtr = swigCPtr + Long.BYTES;
    }
    return denominator;
  }

  public IntegerPolynomial getNumerator()
  {
    if (numerator == null)
    {
      numerator = new IntegerPolynomial(swigCPtr,
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
%};
 