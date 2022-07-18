%typemap(javafinalize) arb_struct ""

%typemap(javainterfaces) arb_struct "Comparable<Real>, NumberField"

%typemap(javaimports) arb_struct %{
import java.util.concurrent.TimeUnit;

import static arb.RealConstants.*;
import arb.MagnitudeConstants;
import static arb.IntegerConstants.*;
import static arb.arb.*;
/**
 * Real numbers are points on an infinitely long line known as the real number
 * line, where the points corresponding to integers are equally spaced. Any real
 * number can be determined by a possibly infinite decimal representation. The
 * real line is part of the complex plane, and the real numbers are part of the
 * complex numbers.<br>
 * 
 */
%}

%typemap(javacode) arb_struct %{
 static { System.loadLibrary( "arblib" ); }

  public Real div(Real σ, int prec)
  {
    return div(σ,prec,this);
  }

  public Real pow(int i, int prec)
  {
    return pow(i,prec,this);
  }

  public Real(String string, int prec)
  {
    this();
    assign(string, prec);
  }
  
  public Real log(int prec, Real res)
  {
    arb.arb_log(res, this, prec);
    return res;    
  }

  
  public Real mul2e( int e, Real res )
  {
    arb_mul_2exp_si(res, this, e);
    return res;
  }

  public Real random(RandomState state, int bits)
  {
    arb.arb_urandom(this, state, bits);
    return this;
  }
  
  public Real resize(int alloc)
  {
    swigCPtr = SWIGTYPE_p_void.getCPtr(arb.flint_realloc(new SWIGTYPE_p_void(swigCPtr,
                                                                                false),
                                                            2 * alloc * Real.BYTES));
    this.dim = alloc;                                                            
    return this;
  }

  @Override
  public Real abs(int prec, Real w)
  {
    arb.arb_abs(w, this);
    return w;
  }
  
  /**
   * Computes the (Normal Gaussian) error function using an automatic algorithm
   * choice. If z is too small to use the asymptotic expansion, a working
   * precision sufficient to circumvent cancellation in the hypergeometric series
   * is determined automatically, and a bound for the propagated error is computed
   * with acb_hypgeom_erf_propagated_error().
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erf(Real, Real, int)}
   */
  public Real erf(int prec, Real res)
  {
    arb.arb_hypgeom_erf(res, this, prec);
    return res;
  }

  /**
   * Computes the complementary (Normal Gaussian) error function  1-this{@link #erf(int, Real)}
   * whilst avoiding the catastrophic cancellation for large positive z.
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erf(Real, Real, int)}
   */
  public Real erfc(int prec, Real res)
  {
    arb.arb_hypgeom_erfc(res, this, prec);
    return res;
  }
    
 /**
   * The inverse of this{@link #erf(int, Real)}
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_erfinv(Real, Real, int)}
   */
  public Real erfinv(int prec, Real res)
  {
    arb.arb_hypgeom_erfinv(res, this, prec);
    return res;
  }

  /**
   * The inverse of this{@link #erfc(int, Real)}
   * 
   * @param prec
   * @param res
   * @return {@link arb#arb_hypgeom_ercfinv(Real, Real, int)}
   */
  public Real erfcinv(int prec, Real res)
  {
    arb.arb_hypgeom_erfcinv(res, this, prec);
    return res;
  }
      
  public Complex div(Complex divisor, int prec, Complex w)
  {
    try ( Complex multiplier = new Complex())
    {
      return mul( divisor.inv(prec, multiplier), prec, w );
    }
  }

	public Real sech(int prec, Real w)
  {
    arb.arb_sech(w, this, prec);
    return w;
  }
  
  public Complex sub(Complex a, int prec, Complex res)
  {
    try ( Complex subtrahend = new Complex())
    {
      return add(a.neg(subtrahend), prec, res);
    }
  }
  
  public Complex add(Complex a, int prec, Complex res)
  {
    arb.acb_add_arb(res, a, this, prec);
    return res;
  }

  public Real neg()
  {
    return negate(this);
  }

  
  /**
   * Adds the magnitude to the radius of this 
   * 
   * @param err
   * @return
   */
  public Real addUncertainty(Magnitude err)
  {
    arb.arb_add_error_mag(this, err);
    return this;
  }
  
  public Real clear()
  {
    if ( swigCMemOwn )
    {
      arb_clear(this);
      for ( int i = 2; i < dim; i++ )
      {
        get(i).clear();
      }
    }
    return this;
  }

  /**
   * Compares the midpoint of this to another Real, disregarding the uncertainty
   * radius if they are not equal. If they are equal, then compare the radius
   */
  @Override
  public int compareTo(Real o)
  {
    int cmp = getMid().compareTo(o.getMid());
    if ( cmp == 0 )
    {
      cmp = getRad().compareTo(o.getRad());
    }
    return cmp;
  }
  
  public Real set(int i)
  {
    arb.arb_set_si(this, i);;
    return this;
  }

  public Real exp(int prec, Real res)
  {
    arb.arb_exp(res, this, prec);
    return res;
  }

  /**
   * @return {@link arb#arb_equal(Real, Real)} != 0
   */
  @Override
  public boolean equals(Object obj)
  {
    if ( !(obj instanceof Real))
    {
      return false;
    }
    Real that = (Real)obj;
    return arb.arb_equal(this, that) != 0;
  }
  
  /**
   * 
   * @param prec
   * @param interval
   * @return {@link arb#arb_get_interval_arf(Float, Float, Real, int)
   */
  public FloatInterval getInterval(int prec, FloatInterval interval)
  {
    arb.arb_get_interval_arf(interval.getA(), interval.getB(), this, prec);
    return interval;
  }
  
  /**
   * @return {@link arb#arb_allocated_bytes(Real)}
   */
  public int getAllocatedBytes()
  {
    return arb.arb_allocated_bytes(this);
  }
  
  public Real negate(Real res)
  {
    arb.arb_neg(res, this);
    return this;
  }
  
  public Real sqrt( int prec )  
  {
    return sqrt(prec,this);
  }
  
  public Real sqrt( int prec, Real res )
  {
    arb.arb_sqrt(res, this, prec);
    return this;
  }
  
 public boolean isFinite()
 {
   return arb.arb_is_finite(this) != 0;
 }

 public Real floor( int prec, Real res )
 {
   arb.arb_floor( res, this, prec );
   return res;
 }

 public Real ceil( int prec, Real res )
 {
   arb.arb_ceil( res, this, prec );
   return res;
 }
 
  public Real frac(int prec, Real res)
  {
    try (Real f = new Real() )
    {
      return sub(floor(prec, f), prec, res);
    }
  }
 
   public int dim = 1;
  
  public int size()
  {
    return dim;
  }
 
  public Real slice( int startInclusive, int endExclusive )
  {
    int sliceDim = endExclusive - startInclusive;
    Real array = new Real( swigCPtr + startInclusive * BYTES, false );
    array.elements = new Real[array.dim = sliceDim];
    return array;
  }
     
  public static Real newVector( int dim )
  {
    Real array = arb._arb_vec_init(dim);    
    array.dim = dim;
    array.elements = new Real[array.dim = dim];
    return array;
  }
 
  public Real cos(int prec, Real result )
  {
    arb.arb_cos(result, this, prec );
    return result;
  }

  public Real sin(int prec, Real result )
  {
    arb.arb_sin(result, this, prec );
    return result;
  }
 
  public Real mul(int i, int prec, Real res)
  {
    arb.arb_mul_si(res, this, i, prec);
    return res;
  }
 
  public Complex mul(Complex exp, int prec, Complex r)
  {
    arb.acb_mul_arb(r, exp, this, prec );
    return r;
  }
  
  public Real tanh(Real result, int prec )
  {   
    arb.arb_tanh(result, this, prec );
    return result;
  }
  
  public Real swap(Real u)
  {
    arb.arb_swap(this, u);
    return this;
  }

  public Real div(Real exp, int prec, Real r)
  {
    arb.arb_div(r, this, exp, prec );
    return r;
  }
  
  public Real nthHardyZero(int n, int prec) 
  {    
    arb.nthHardyZero(this, n, prec);
    return this;
  }
  
  public int relAccuracyBits()
  {
   return arb.arb_rel_accuracy_bits(this);
  }

  public Real sub(Real real, int prec, Real res)
  {
    arb.arb_sub(res, this, real, prec);
    return res;
  }

  public Real setIntervalMagnitude( Magnitude a, Magnitude b, int prec )
  {
    arb.arb_set_interval_mag(this, a, b, prec);
    return this;
  }
  
  public static final int BYTES = 48;
  
  public Real pi( int prec )
  {
    arb.arb_const_pi(this, prec);
    return this;
  }
  
  public Real init()
  {
    arb.arb_init(this);
    return this;
  }
  
  @Override
  public void close() 
  { 
    clear();
  }

  public Real add(Real d, int prec, Real res)
  {
    arb.arb_add(res, this, d, prec );
    return res;
  }
  
    public Real[] elements;
  
  public Real get( int index )
  {
      assert index < dim : String.format( "index = %d >= dim = %d", index, dim );
    if ( index == 0 && dim == 1 )
    {
      return this;
    }
    Real element = elements[index];
    if (element == null)
    {
      element = new Real(swigCPtr + index * Real.BYTES,
                            false);
    }
    return element;  
  }
   
  public String toFixedString()
  {
    StringBuilder sb = new StringBuilder();
    sb.append("[");
    for (int i = 0; i < dim; i++)
    {
      if ( i > 0 )
      {
        sb.append(",\n ");
      }
      sb.append(String.format("%010.010f", get(i).doubleValue() ) );
    }
    sb.append("]");
    return sb.toString();
  }
  
  public String toString( )
  {
    return toString(20);
  }
  
  public int digits()
  {
    try ( Magnitude d = new Magnitude()  )
    {
      getRad().inv(d);
      d.log(d);
      d.div(MagnitudeConstants.log10mag, d);
      return (int) d.doubleValue() + 2;
    }
  }  
    public boolean  printPrecision = true;
  public String toString( int digits )
  {
    if ( dim == 1 )
    {
      // TODO: get the number of digits to from the exponent of the radius
      String prefix = getMid().toString(digits);
      if ( !printPrecision )
      {
        return prefix;
      }
      // dont print the last digit since its not gauranteed to be correct
      prefix = prefix.substring(0, prefix.length() - 1 );
      return prefix + " +/- " + getRad().toString(5);    
      //return arb.arb_get_str(this, digits, 1);
    }
    else
    {
      StringBuilder sb = new StringBuilder();
      sb.append("[");
      for (int i = 0; i < dim; i++)
      {
        if ( i > 0 )
        {
          sb.append(",\n ");
        }
      sb.append(String.format("%s",
                              get(i)));
    }
    sb.append("]");
    return sb.toString();
    }
  }
      
  public Real abs(Real res)  
  {
    arb.arb_abs(this, res);
    return res;
  }

        
  public Real set(Real real)
  {
     arb.arb_set( this, real );
     return this;    
  }
  
  public int bits()
  {
    return arb.arb_bits(this);
  }

  public Real posInf()
  {
    arb.arb_pos_inf(this);
    return this;
  }
  
  public Real negInf()
  {
    arb.arb_neg_inf(this);
    return this;
  }
  
  public Real zero()
  {
    arb.arb_zero(this);
    return this;
  }

  public Real one()
  {
    arb.arb_one(this);
    return this;
  }
         
  public Real set(String string, int prec)
  {
    arb.arb_set_str(this, string, prec);
    return this;
  }
  
  
  public boolean overlaps( Real interval )
  {
    return arb.arb_overlaps(this, interval) != 0;
  }
  
  public boolean contains( Real interval )
  {
    return arb.arb_contains(this, interval) != 0;
  }
  
  
  public Real assign( String string, int prec )
  {
    arb.arb_set_str(this, string, prec);
    return this;
  }
  
  public Real set(double d)
  {
    arb.arb_set_d(this, d);
    return this;
  }
  
  public Real div(int k, int prec, Real res)
  {
    arb.arb_div_si(res, this, k, prec);
    return res;
  }
  
  public double doubleValue()
  {
    return getMid().doubleValue();
  }

  public double doubleValue(RoundingMode rm)
  {
    return getMid().doubleValue(rm);
  }
  
  /**
   * @return arb#arb_sgn_nonzero(Real)
   */
  public int sign()
  {
    return arb.arb_sgn_nonzero(this);
  }

  public boolean isPositive()
  {
    return arb.arb_is_positive(this) != 0;
  }

  public boolean isNegative()
  {
    return arb.arb_is_negative(this) != 0;
  }
  
  public boolean containsZero()
  {
    return arb.arb_contains_zero(this) != 0;
  }
  
  public Real set(FloatInterval interval, int prec)
  {
    Float a = interval.getA();
    Float b = interval.getB();

    /* [-inf, -inf] or [+inf, +inf] */
    if (a.isInfinite() && a.equals(b) )
    {
      setMid(a);
      getRad().zero();
      return this;
    }

    /* any nan -> [nan +/- inf] */
    if (a.isNotANumber() || b.isNotANumber() )
    {
      arb_indeterminate(this);
      return this;
    }

    /* [-inf, x] or [x, +inf] = [+/- inf] */
    if (arf_is_neg_inf(a) != 0 || arf_is_pos_inf(b) != 0)
    {
      arf_zero(getMid());
      mag_inf(getRad());
      return this;
    }

    try ( Float t = new Float();)
    {
      /* [(a + b) +/- (b - a)] / 2 */
      arf_sub(t, b, a, MAG_BITS, ARF_RND_UP);

      if (arf_sgn(t) < 0)
      {
        throw new IllegalArgumentException("endpoints are out of order");
      }

      arf_get_mag(getRad(), t);

      int inexact = arf_add(getMid(), a, b, prec, ARB_RND);
      if (inexact != 0)
      {
        Magnitude xrad = getRad();
        arf_mag_add_ulp(xrad, xrad, getMid(), prec);
      }

      arb_mul_2exp_si(this, this, -1);

      return this;
    }
  }

  /**
   * 
   * @param prec
   * @param r
   * @return the multiplicative inverse of r 
   */
  public Real inv( int prec, Real r )
  {
    arb.arb_inv(r, this, prec);
    return r;
  }

  /**
   * The secant of r is the multiplicative inverse of the cosine of r
   * 
   * @param prec
   * @param r
   * @return
   */
  public Real sec(int prec, Real r)
  {
    return cos(prec, r).inv(prec, r);
  }
  
  public Real pow(int i, int prec, Real r)
  {
    assert i >= 0;  
    arb.arb_pow_ui(r, this, i, prec);
    return r;
  }
  
  public Real tan(int prec, Real r)
  {
    arb.arb_tan(r, this, prec);
    return r;
  }
  
  public boolean isZero()
  {
    return arb_is_zero(this) != 0;
  }

  /**
   * Calls this{@link #setMid(Float)}
   * @param u value to set the midpoint of this real number ball to 
   * @return this
   */
  public Real set(Float u)
  {
    setMid(u);
    return this;
  }  
  
  /**
   * Calls this{@link #div(int, int, Real)} with the result=this. Useful for constructors
   * @param i
   * @param precision
   * @return this
   */
  public Real div(int i, int precision)
  {
    return div(i,precision,this);
  }
  
  public Real mul(Real x, int prec, Real result)
  {
    arb.arb_mul(result, this, x, prec );
    return result;
  }
    
%};

