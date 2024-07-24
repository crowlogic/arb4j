%typemap(javainterfaces) fmpz_poly_q_struct "AutoCloseable,Field<IntegerRationalFunction>"
%typemap(javafinalize) fmpz_poly_q_struct ""
%typemap(javaimports) fmpz_poly_q_struct %{
import java.util.Objects;
%}



%typemap(javacode) fmpz_poly_q_struct %{
  static
  {
    System.loadLibrary("arblib");
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
  
 @Override
  public <N extends Named> N setName(String name)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction additiveIdentity()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction multiplicativeIdentity()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction add(IntegerRationalFunction element, int prec, IntegerRationalFunction result)
  {
    assert false : "TODO";
    return null;
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

  @Override
  public IntegerRationalFunction div(int j, int prec, IntegerRationalFunction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction div(IntegerRationalFunction j, int prec, IntegerRationalFunction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction get(int index)
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
  public IntegerRationalFunction mul(int x, int prec, IntegerRationalFunction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction mul(IntegerRationalFunction x, int prec, IntegerRationalFunction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction newFieldElement()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction set(IntegerRationalFunction value)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction sub(IntegerRationalFunction element, int prec, IntegerRationalFunction result)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public IntegerRationalFunction zero()
  {
    assert false : "TODO";
    return null;
  }
  
%};
 