%typemap(javafinalize) mag_struct ""

%typemap(javaimports) mag_struct %{
import static arb.arblib.*;
%}

%typemap(javainterfaces) mag_struct "AutoCloseable,Comparable<Magnitude>"

%typemap(javacode) mag_struct %{
  String name;

  public Magnitude one()
  {
    mag_one(this);
    return this;
  }

  /**
   * 
   * @param mag
   * @return sets this to the maximum of this and mag
   */
  public Magnitude max(Magnitude mag)
  {
    return max(mag,this);
  }

  public Magnitude mul(Magnitude mag)
  {
    return mul(mag,this);
  }

  public Magnitude sub(Magnitude t)
  {
    return sub(t,this);
  }

  public Magnitude sqrt()
  {
    return sqrt(this);
  }

  public Magnitude sqrt(Magnitude magnitude)
  {
    mag_sqrt(magnitude, this);
    return magnitude;
  }
  
  /**
   * @see arb#mag_max(Magnitude, Magnitude, Magnitude)
   * 
   * @param other
   * @param res
   * @return
   */
  public Magnitude max(Magnitude that, Magnitude res)
  {
    mag_max(res, this, that);
    return res;
  }
    
  public Magnitude swap(int i, int j)
  {
    return get(i).swap(get(j));
  }
  
  /**
   * Sets result to an upper bound for sqrt(this^2+otherwSide^2) using
   * {@link arb#mag_hypot(Magnitude, Magnitude, Magnitude)}y
   * 
   * @param otherSide
   * @param result
   * @return result
   */
  public Magnitude hypotenuseLength(Magnitude otherSide, Magnitude result)
  {
    mag_hypot(result, this, otherSide);
    return result;
  }
  
  public static Magnitude newVector(int i, String string)
  {
    Magnitude vec = newVector(i);
    vec.name = string;
    return vec;    
  }
  

  public Magnitude set(Magnitude t)
  {
    mag_set(this, t);
    return this;
  }
   
  public Magnitude init()
  {
    mag_init(this);
    return this;
  }


  /**
   * Sets the value (of this {@link Magnitude}) to positive ∞
   * @see arb#mag_inf(Magnitude)
   * @return this
   */
  public Magnitude infinite()
  {
    mag_inf(this);
    return this;
  }
     
  public Magnitude log()
  {
    return log(this);
  }
   
  static
  {
   System.loadLibrary("arblib");
  }
 
  public static final int BYTES = 16;
 
  int dim;
 
  public Magnitude sub(Magnitude u, Magnitude res)
  {
    mag_sub(res, this, u);
    return res;
  }
   
  public Magnitude(double d)
  {
    this();
    set(d);
  }
     
  public Magnitude set( double d )
  {
    mag_set_d(this, d );
    return this;
  }
     
  public Magnitude get( int index )
  {
    assert index < dim;
    return new Magnitude(swigCPtr + index * Magnitude.BYTES, false);  
  } 
  
 public static Magnitude newVector(int dim)
 {
    Magnitude array = _mag_vec_init(dim);    
    array.dim = dim;
    return array;
 }

  public String toString( int digits )
  {
    try ( Float floatMag = new Float())
    {
      arf_set_mag(floatMag, this);
      return floatMag.toString(digits);
    }
  }
  
  @Override
  public String toString()
  {
    try ( Float floatMag = new Float())
    {
      arf_set_mag(floatMag, this);
      return floatMag.toString();
    }
  }

  public Magnitude clear()
  {
    if ( swigCMemOwn )
    {
      mag_clear(this);
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
    return mag_cmp( this, other );
  }
  
  public double doubleValue()
  {
    return mag_get_d(this);
  }
  
  public Magnitude mul(Magnitude b, Magnitude res)
  {
    mag_mul(res, this, b );
    return res;    
  }
  
  public Magnitude add(Magnitude u, Magnitude res)
  {
    mag_add(res, this, u);
    return res;
  }
    
  public Magnitude zero()
  {
    mag_zero(this);
    return this;
  }
  
 /**
   * @see arb#mag_swap(Magnitude, Magnitude)
   * @param that
   * @return
   */
  public Magnitude swap(Magnitude that)
  {
    mag_swap(this, that);
    return this;
  }


  public Magnitude inv(Magnitude magnitude)
  {
    mag_inv(magnitude,this);
    return this;
  }

  public Magnitude log(Magnitude d)
  {
    mag_log(d, this);
    return d;
  }

  public Magnitude div(Magnitude a, Magnitude d)
  {
    mag_div(d, this, a);
    return d;
  }

  public Magnitude pow(long y, Magnitude res)
  {
    assert y >= 0 : "negative magnitudes are not supported";
    mag_pow_ui(res, this, y);
    return res;
  }

  public Magnitude pow(long y)
  {
    return pow(y, this);
  }  
  
%};