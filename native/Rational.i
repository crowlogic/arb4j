%typemap(javainterfaces) fmpq "AutoCloseable"
%typemap(javafinalize) fmpq ""

%typemap(javacode) fmpq %{
  static
  {
    System.loadLibrary("arblib");
  }
  
  Integer numerator;
  Integer denominator;

  public Rational add(Rational that, Rational result)
  {
    arblib.fmpq_add(result, this, that);
    return result;
  }
    
 public Rational one()
  {
    arblib.fmpq_one(this);
    return this;
  }
  
  public Integer getDenominator()
  {
    if (denominator == null)
    {
      denominator = new Integer(swigCPtr + Long.BYTES,
                                false);
    }
    else
    {
      denominator.swigCPtr = swigCPtr + Long.BYTES;
    }
    return denominator;
  }

  public Integer getNumerator()
  {
    if (numerator == null)
    {
      numerator = new Integer(swigCPtr,
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
 