%typemap(javaimports) __mpfr_struct %{
%}

%typemap(javafinalize) __mpfr_struct ""
%typemap(javainterfaces) __mpfr_struct "AutoCloseable"

%typemap(javabody) __mpfr_struct %{

 static
 {
   System.loadLibrary( "arblib" );
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

%typemap(javacode) __mpfr_struct %{

  public MultiPrecFloat clear()
  {
    if ( swigCMemOwn )
    {
      arb.mpfr_clear(this);
    }
    return this;
  }

  

  @Override
  public void close()
  { 
      clear();
  }


  
%};