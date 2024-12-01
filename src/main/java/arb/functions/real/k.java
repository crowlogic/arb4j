package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.SphericalBesselFunction;
import arb.functions.integer.RealFunctionSequence;

public class k implements
               RealFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean                 isInitialized;
  public final Integer           cℤ1   = new Integer("2");
  public SphericalBesselFunction jsph1 = new SphericalBesselFunction();

  public static void main( String args[] )
  {
    k k = new k();
    RealFunction x = k.evaluate(3, 128);
    System.out.println( x );
  }
  @Override
  public Class<RealFunction> coDomainType()
  {
    return RealFunction.class;
  }

  @Override
  public RealFunction evaluate(Integer k, int order, int bits, RealFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    kfunc var10000 = new kfunc();
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
    cℤ1.close();
    jsph1.close();
  }

  @Override
  public String toString()
  {
    return "k➔2*j(k,x)";
  }

  @Override
  public String typeset()
  {
    return "2 \\cdot j_{k}(x)";
  }
}
