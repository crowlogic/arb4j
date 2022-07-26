%typemap(javaimports) arf_interval_struct %{
import java.util.ArrayList;
%}

%typemap(javafinalize) arf_interval_struct ""
%typemap(javainterfaces) arf_interval_struct "AutoCloseable"

%typemap(javabody) arf_interval_struct %{

 static
 {
   System.loadLibrary( "arblib" );
 }
 
  public long swigCPtr;
  public boolean swigCMemOwn;

  public FloatIntervalPartition partition(int n)
  {
    assert false : "implement me";
    return null;
  }

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
    arb.arf_interval_swap(this, u);
    return this;
  }
  
  public static final int BYTES = 64;

  @Override
  public String toString()
  {
    return String.format("FloatInterval[A=%s, B=%s]", getA(), getB());
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
    getA().assign(left);
    getB().assign(right);
  }
  
  public FloatInterval init()
  {
   getA().init();
   getB().init();
   return this;
  }
  
  public FloatInterval(Float left, Float right)
  {
    this();
    init();
    getA().assign(left);
    getB().assign(right);
  }
  
  public FloatInterval set(FloatInterval interval)
  {
    setA(interval.getA());
    setB(interval.getB());
    return this;
  }
  
  public Real getReal(Real res, int prec)
  {
    arb.arf_interval_get_arb(res, this, prec);
    return res;
  }
  

  
%};