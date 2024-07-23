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
%};
 