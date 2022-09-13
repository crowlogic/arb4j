%typemap(javainterfaces) flint_rand_s "AutoCloseable"

%typemap(javacode) flint_rand_s %{
  static { System.loadLibrary( "arblib" ); }

  @Override
  public String toString()
  {
    return String.format("RandomState[initialValueSeed=%s]", getInitialValue());
  }
  
  public RandomState(int seed)
  {
    this();
    seed(seed);
  }

  /**
   * Calls {@link arb#gmp_randinit_mt(GMPRandomState), then
   * arb#gmp_randseed_ui(GMPRandomState, long) with the seed value, and
   * this#setInitialValue(int)
   * 
   * @param seed
   * @return this
   */
  public RandomState seed(int seed)
  {
	arb.gmp_randinit_mt(getGmpRandomState());
    arb.gmp_randseed_ui(getGmpRandomState(), seed);
    setInitialValue(seed);
    return this;
  }
  
  public void clear()
  {
    arb.gmp_randclear(getGmpRandomState());    
  }
  
  @Override
  public void close()
  {
    clear();
  }
  
%}
