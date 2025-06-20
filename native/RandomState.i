

%typemap(javafinalize) flint_rand_s ""
%typemap(javainterfaces) flint_rand_s "AutoCloseable"

%typemap(javacode) flint_rand_s %{

 static
 {
   System.loadLibrary( "arblib" );
 }

  @Override
  public void close() throws Exception
  {
    delete();
  }

  public RandomState initialize()
  {
    arblib.gmp_randinit_default(getGmpRandomState());
    setInitialized(1);
    return this;
  }
  
  public RandomState seed(long seed)
  {
    arblib.gmp_randseed_ui(getGmpRandomState(), seed);
    return this;
  }  
     
%};

