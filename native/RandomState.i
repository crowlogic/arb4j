%typemap(javainterfaces) flint_rand_s "AutoCloseable"

%typemap(javafinalize) flint_rand_s ""

%typemap(javainterfaces) flint_rand_s "RandomVectorGenerator"

%typemap(javaimports) flint_rand_s %{
import arb.stochastic.processes.RandomVectorGenerator;
%}

%typemap(javacode) flint_rand_s %{
  static { System.loadLibrary( "arblib" ); }


  @Override
  public RandomState getRandomState()
  {
    return this;
  }

  @Override
  public Real nextElement(int prec, Real result)
  {
    return result.random(this, prec);
  }

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
	arblib.gmp_randinit_mt(getGmpRandomState());
    arblib.gmp_randseed_ui(getGmpRandomState(), seed);
    setInitialValue(seed);
    return this;
  }
  
  public void clear()
  {
    arblib.gmp_randclear(getGmpRandomState());    
  }
  
  @Override
  public void close()
  {
    clear();
  }
  
%}
