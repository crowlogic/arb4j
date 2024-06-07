%typemap(javainterfaces) fmpq "AutoCloseable"
%typemap(javafinalize) fmpq ""
%typemap(javaimports) fmpq %{
import java.util.Objects;
%}

%typemap(javacode) fmpq %{
  static
  {
    System.loadLibrary("arblib");
  }

  @Override
  public int
         hashCode()
  {
    return Objects.hash(numerator, denominator);
  }

  @Override
  public boolean
         equals(Object obj)
  {
    if (obj == null)
    {
      return false;
    }
    if (!obj.getClass()
            .isAssignableFrom(Rational.class))
    {
      return false;
    }
    Rational that = (Rational) obj;
    return arblib.fmpq_equal(this, that) != 0;
  }
    
  private Integer numerator;
  private Integer denominator;

  public Rational add(Rational that, Rational result)
  {
    arblib.fmpq_add(result, this, that);
    return result;
  }

  public Rational sub(Rational that, Rational result)
  {
    arblib.fmpq_sub(result, this, that);
    return result;
  }

  public Rational mul(Rational that, Rational result)
  {
    arblib.fmpq_mul(result, this, that);
    return result;
  }

  public Rational div(Rational that, Rational result)
  {
    arblib.fmpq_div(result, this, that);
    return result;
  }

  public Rational set(String str)
  {
    arblib.fmpq_set_str(this, str, 10);
    return this;
  }
        
  public String toString()
  {
    return arblib.fmpq_get_str(null, 10,this);
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
 