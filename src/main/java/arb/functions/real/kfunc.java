package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.SphericalBesselFunction;

public class kfunc implements
                   RealFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean                 isInitialized;
  public final Integer           cℤ1   = new Integer("2");
  public Integer                 k;
  public Real                    iℝ1   = new Real();
  public SphericalBesselFunction jsph2 = new SphericalBesselFunction();

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real x, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return cℤ1.mul(jsph2.evaluate(x, order, bits, iℝ1), bits, result);
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
      jsph2.n.set(k);
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    iℝ1.close();
    jsph2.close();
  }

  @Override
  public String toString()
  {
    return "x➔2*(j(k,x))";
  }

  @Override
  public String typeset()
  {
    return "2 \\cdot j_{k}(x)";
  }
}
