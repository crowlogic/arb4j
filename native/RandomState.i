%typemap(javainterfaces) flint_rand_s "AutoCloseable"

%typemap(javacode) flint_rand_s %{
  static { System.loadLibrary( "arblib" ); }

  public RandomState(int seed)
  {
    this();
    arb.gmp_randinit_mt(getRandomState());
    arb.gmp_randseed_ui(getRandomState(), seed);
    setInitialValue(seed);
  }
  
  public void clear()
  {
    arb.gmp_randclear(getRandomState());    
  }
  
  @Override
  public void close()
  {
    clear();
  }
  
%}
