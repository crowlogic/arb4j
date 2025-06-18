

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
   
%};

