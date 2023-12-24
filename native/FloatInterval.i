%typemap(javaimports) arf_interval_struct %{
import static arb.arblib.arf_interval_get_arb;
import static arb.arblib.arf_interval_swap;

import arb.domains.Interval;
%}

%typemap(javafinalize) arf_interval_struct ""
%typemap(javainterfaces) arf_interval_struct "AutoCloseable, Interval<Float>"

%typemap(javabody) arf_interval_struct %{

 static
 {
   System.loadLibrary( "arblib" );
 }
 
 /**
   * Calculates the length of the interval
   * 
   * @param prec the accuracy in bits of the result to be produced
   * @param res  the result
   * 
   * @return the result this{@link #getB()} - this{@link #getA()}
   */
  public Float length(int prec, Float res)
  {
    return getB().sub(getA(), prec, res);
  }
  public long swigCPtr;
  public boolean swigCMemOwn;

  public $javaclassname(long cPtr) {
    this(cPtr,false);
  }
    
  public $javaclassname(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  public static long getCPtr($javaclassname obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }
%}

%typemap(javacode) arf_interval_struct %{

  public static enum RootStatus
  {
   NoRoot,
   RootLocated,
   RootUnknown
  }

 
  public FloatInterval clear()
  {
    if ( swigCMemOwn )
    {
      getA().clear();
      getB().clear();
    }
    return this;
  }
  
  public FloatInterval swap(FloatInterval u)
  {
    arf_interval_swap(this, u);
    return this;
  }
  
  public static final int BYTES = Float.BYTES * 2;

  @Override
  public String toString()
  {
    return String.format("%s..%s", getA().doubleValue(), getB().doubleValue());
  }
    
  @Override
  public void close()
  { 
      clear();
  }
  
  public FloatInterval(double left, double right)
  {
    this();
    init();
    getA().set(left);
    getB().set(right);
  }
  
  public FloatInterval init()
  {
   getA().init();
   getB().init();
   return this;
  }
  
  public FloatPartition partition(int n, int prec)
  {
    return new FloatPartition(prec,
                    	      this,
                        	  n);
  }

  /**
   * partition this interval into a division of several disjoint sub-intervals
   * 
   * @param prec
   * @param includeError see {@link RealPartition}
   * @param n
   * 
   * @return a new {@link RealPartition}
   */
  public RealPartition generateRealPartition(int prec, boolean includeError, int n)
  {
    return new RealPartition(this,
                             prec,
                             n,
                             includeError);
  }

  /**
   * partition this interval into a division of several disjoint sub-intervals
   * 
   * @param prec
   * @param includeError see {@link RealPartition}
   * @param n
   * 
   * @return a new {@link RealPartition}
   */
  public RealPartition generateRealPartition(int prec, boolean includeError, Real T)
  {
    return new RealPartition(this,
                             prec,
                             T,
                             includeError);
  }
    
  public FloatInterval(Float left, Float right)
  {
    this();
    init();
    getA().set(left);
    getB().set(right);
  }
  
  public FloatInterval set(FloatInterval interval)
  {
    setA(interval.getA());
    setB(interval.getB());
    return this;
  }
  
  public Real getReal(int prec, Real res)
  {
    arf_interval_get_arb(res, this, prec);
    return res;
  }
  
  /**
   * Calculate the midpoint
   * 
   * @param prec
   * @param res
   * @return result after having been assigned (a+b)/2
   */
  public Float mid(int prec, Float res)
  {
    return getA().add(getB(), prec, res).div(2, prec);
  }
  
  @Override
  public Float left()
  {
    return getA();
  }

  @Override
  public Float right()
  {
    return getB();
  }  
  
%};