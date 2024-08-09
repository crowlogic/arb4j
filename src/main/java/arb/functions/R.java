package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.real.RealFunction;
import arb.functions.sequences.LommelPolynomialSequence;

public class R implements RealFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean                  isInitialized;
  Integer                         cℤ2       = new Integer("2");
  Integer                         cℤ1       = new Integer("1");
  Integer                         cℤ3       = new Integer("3");
  public LommelPolynomialSequence seqqR1    = new LommelPolynomialSequence();
  public RationalFunction         elementq1 = new RationalFunction();

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real z, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return elementq1.evaluate(z, order, bits, result);
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
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    seqqR1.close();
    elementq1.close();
  }

  @Override
  public String toString()
  {
    return "z➔R(1/2,3;z)";
  }

  @Override
  public String typeset()
  {
    return "$R_{\\frac{1}{2}, 3} (z)$";
  }
}
