

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
    arblib.flint_rand_clear(this);
  }

  public RandomState initialize()
  {
    arblib.flint_rand_init(this);
    return this;
  }
  
  public RandomState seed(long seed)
  {
    arblib.flint_rand_set_seed(this, seed, seed >>> 32);
    return this;
  }  
     
%};

