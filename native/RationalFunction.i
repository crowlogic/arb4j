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
    return arblib.fmpq_poly_equal(this, that) != 0;
  }
 
        
  public String toString()
  {
    return arblib.fmpq_get_str(null, 10,this);
  }
  
  public Rational one()
  {
    assert false : "todo";
    return this;
  }
  
  @Override
  public void close() 
  {
    delete();
  }  
%};
 