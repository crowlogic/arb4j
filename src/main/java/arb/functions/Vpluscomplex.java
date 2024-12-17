package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;

public class Vpluscomplex implements
                          ComplexFunctionSequence,
                          Typesettable,
                          AutoCloseable,
                          Initializable
{
  public boolean isInitialized;

  @Override
  public Class<ComplexFunction> coDomainType()
  {
    return ComplexFunction.class;
  }

  @Override
  public ComplexFunction evaluate(Integer m, int order, int bits, ComplexFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Vpluscomplexfunc var10000 = new Vpluscomplexfunc();
    var10000.m = m;
    var10000.initialize();
    return var10000;
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
  }

  @Override
  public String toString()
  {
    return "Vpluscomplex:m➔pFq([1,m,-m],[1/2];-(1/2*ⅈ)/y)";
  }

  @Override
  public String typeset()
  {
    return "{_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; -\\frac{\\frac{1}{2} \\cdot ⅈ}{y}\\right)";
  }

  public String intermediateStates()
  {
    return "TODO: insert intermediate states here";
  }
}
