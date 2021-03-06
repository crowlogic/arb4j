%typemap(javaimports) arf_struct %{
import static arb.RealConstants.*;
import static arb.IntegerConstants.*;

/**
 * A {@link Float} contains four words: <br>
 * <ul>
 * <li>an fmpz exponent (exp)</li>
 * <li>a size field tracking the number of limbs used (one bit of this field is
 * also used for the sign of the number)</li>
 * <li>and two more words</li>
 * </ul>
 * <br>
 * If the precision is 128 bits or less then the last two (quad)words hold the
 * value directly if there are at most two limbs, otherwise they contain one
 * alloc field which tracks the total number of limbs allocated limbs, some of
 * which can be unused, and a pointer to the actual limbs.<br>
 * The limit in arb is 64 bits on a 32bit machine but arb4j is recommended to be
 * used on 64bit architecures (or better?) only
 * 
 */
%}

%typemap(javafinalize) arf_struct ""
%typemap(javainterfaces) arf_struct "AutoCloseable,Comparable<Float>"

%typemap(javacode) arf_interval_struct %{
 public static final int BYTES = 64;
%}

%typemap(javacode) arf_struct %{

  /**
   * @return {@link arb#arf_is_zero(Float)} != 0
   */
  public boolean isZero()
  {
    return arb.arf_is_zero(this) != 0;
  }

  @Override
  public int compareTo(Float o)
  {
    return arb.arf_cmp(this, o);
  }
  
  /**
   * 
   * @return {@link arb#arf_is_nan(Float)} != 0
   */
  public boolean isNotANumber()
  {
    return arb.arf_is_nan(this) != 0;
  }
  
  /**
   * @return {@link arb#arf_equal(Float, Float)} != 0
   */
  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof Float))
    {
      return false;
    }
    Float that = (Float)obj;
    return arb.arf_equal(this, that) != 0;
  }
  
  /**
   * 
   * @return {@link arb#arf_is_inf(Float)} != 0
   */
  public boolean isInfinite()
  {
    return arb.arf_is_inf(this) != 0;
  }
  
  @Override
  public void close()
  { 
	clear();    
  }
  
  public Float clear()
  {
    if ( swigCMemOwn )
    {
	    arb.arf_clear(this);
    }
    return this;
  } 
  
  public String toString(int digits)
  {
    return arb.arf_get_str(this,digits);
  }
  
  public Float zero()
  {
    arb.arf_zero( this );
    return this;
  }
  
  public Float neg( Float res )
  {
    arb.arf_neg( res, this );
    return this;
  }
  
  public Float mul( Float y, int prec, Float res )
  {
   arb.arf_mul_rnd_down( res, this, y, prec );
   return this;
  }

  public Magnitude getMagnitude(Magnitude v)
  {
    arb.arf_get_mag(v, this);
    return v;    
  }
  
  public Float assign( Float f )
  {
    arb.arf_set( this, f );
    return this;
  }
  
  public Float assign(double i)
  {
    arb.arf_set_d(this, i);
    return this;
  }
  
  public Float init()
  {
    arb.arf_init(this);
    return this;
  }
  
  public String toString()
  {
    return arb.arf_get_str(this,15);
  }

  public Float add(Float ay, int precision, Float result)
  {
    arb.arf_add(result, this, ay, precision, ARF_RND_DOWN);
    return result;    
  }
    
  public Float add(Float ay, int thisprec, RoundingMode roundingMode, Float result)
  {
    arb.arf_add(result, this, ay, thisprec, roundingMode.ordinal());
    return result;    
  }

  public double doubleValue( RoundingMode roundingMode )
  {
    return arb.arf_get_d( this, roundingMode.ordinal() );
  }
 
  public Float sub(Float ay, int thisprec, Float result)
  {
    return sub(ay,thisprec,RoundingMode.Down,result);
  }
    
  public Float sub(Float ay, int thisprec, RoundingMode round, Float result)
  {
    arb.arf_sub(result, this, ay, thisprec, round.ordinal());
    return result;    
  }
  
  public Float mul(int ay, int thisprec, Float result)
  {
    arb.arf_mul_ui(result, this, ay, thisprec, ARF_RND_DOWN);
    return result;    
  }

  public Float div(int i, RoundingMode round, int thisprec, Float res)
  {
   	arb.arf_div_ui(res, this, i, thisprec, round.ordinal());
    return res;    
  }
  
  public Float div(int i, int thisprec, Float res)
  {
    return div(i, RoundingMode.Down, thisprec, res);
  }

  public double doubleValue()
  {
    return doubleValue( RoundingMode.Down );
  }
 
  /**
   * Calls {@link arb#arf_mul_2exp_si(Float, Float, int)}(res,this,-1)
   * 
   * @param res where to store the result, aliasing with res=this is perfectly
   *            fine as is usually the case
   * @return res
   */
  public Float half(Float res)
  {
    arb.arf_mul_2exp_si(res, this, -1);
    return res;
  }    
%};