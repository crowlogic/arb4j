%typemap(javacode) fmpq %{
  Integer numerator;
  Integer denominator;
  
  public Integer getDenominator()
  {
    if (denominator == null)
    {
      denominator = new Integer(getLongDenominator(),
                                false);
    }
    else
    {
      denominator.swigCPtr = getLongDenominator();
    }
    return numerator;
  }

  public Integer getNumerator()
  {
    if (numerator == null)
    {
      numerator = new Integer(getLongNumerator(),
                              false);
    }
    else
    {
      numerator.swigCPtr = getLongNumerator();
    }
    return numerator;
  }
%};
 