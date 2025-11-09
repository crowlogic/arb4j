

%typemap(javafinalize) flint_rand_struct""
%typemap(javainterfaces) flint_rand_struct "AutoCloseable"

%typemap(javacode) flint_rand_struct %{

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
	throw new UnsupportedOperationException( "TODO");
    arblib.gmp_randinit_default(getGmpRandomState());
    return this;
  }
  
  public RandomState seed(long seed)
  {
    arblib.gmp_randseed_ui(getGmpRandomState(), seed);
    return this;
  }  
     
%};

