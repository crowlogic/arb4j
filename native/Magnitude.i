%typemap(javafinalize) mag_struct ""

%typemap(javaimports) mag_struct %{
import java.util.concurrent.TimeUnit;
import static arb.Constants.*;
%}

%typemap(javainterfaces) mag_struct "AutoCloseable,Comparable<Magnitude>"

%typemap(javacode) mag_struct %{
 
 static
 {
   System.loadLibrary("arblib");
 }
 
 public static final int BYTES = 16;
 
 int dim;
 
 public Magnitude set( double d )
 {
   arb.mag_set_d(this, d );
   return this;
 }
 
  public Magnitude resize(int alloc)
  {
    swigCPtr = (SWIGTYPE_p_void.getCPtr(arb.flint_realloc(new SWIGTYPE_p_void(Magnitude.getCPtr(this),
                                                                                        false),
                                                                    2 * alloc * Magnitude.BYTES)));
    this.dim = alloc;
    return this;    
  }
     
  public Magnitude get( int index )
  {
    assert index < dim;
    return new Magnitude(swigCPtr + index * Magnitude.BYTES, false);  
  } 
  
 public static Magnitude newVector(int dim)
 {
    Magnitude array = arb._mag_vec_init(dim);    
    array.dim = dim;
    return array;
 }

  public String toString( int digits )
  {
    try ( Float floatMag = new Float())
    {
      arb.arf_set_mag(floatMag, this);
      return floatMag.toString(digits);
    }
  }
  
  @Override
  public String toString()
  {
    try ( Float floatMag = new Float())
    {
      arb.arf_set_mag(floatMag, this);
      return floatMag.toString();
    }
  }

  public Magnitude clear()
  {
    if ( swigCMemOwn )
    {
      arb.mag_clear(this);
    }
    return this;
  }
  
  @Override
  public void close()
  { 
    clear();
  }
  
  @Override
  public int compareTo( Magnitude other )
  {
    return arb.mag_cmp( this, other );
  }
  
  public double doubleValue()
  {
    return arb.mag_get_d(this);
  }
  
  public Magnitude pow( long y, Magnitude res )
  {
    arb.mag_pow_ui(res, this, y);
    return res;
  }
  
  public Magnitude mul(Magnitude b, Magnitude res)
  {
    arb.mag_mul(res, this, b );
    return res;    
  }
  
  public Magnitude add(Magnitude u, Magnitude res)
  {
    arb.mag_add(res, this, u);
    return res;
  }
    
  public Magnitude zero()
  {
    arb.mag_zero(this);
    return this;
  }
  
 /**
   * @see arb#mag_swap(Magnitude, Magnitude)
   * @param that
   * @return
   */
  public Magnitude swap(Magnitude that)
  {
    arb.mag_swap(this, that);
    return this;
  }


  public Magnitude inv(Magnitude magnitude)
  {
    arb.mag_inv(magnitude,this);
    return this;
  }

  public Magnitude log(Magnitude d)
  {
    arb.mag_log(d, this);
    return d;
  }

  public Magnitude div(Magnitude a, Magnitude d)
  {
    arb.mag_div(d, this, a);
    return d;
  }
  
  
%};