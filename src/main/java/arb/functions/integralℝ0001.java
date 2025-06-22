package arb.functions;

import arb.Initializable;
import arb.Real;
import arb.Typesettable;

public class integralℝ0001 implements
                           Function<Real, Real>,
                           Typesettable,
                           AutoCloseable,
                           Initializable
{
  public boolean isInitialized;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real y, int order, int bits, Real result)
  {
    return y.arcsin(bits, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public String toString()
  {
    return "y➔arcsin(y)";
  }

  @Override
  public String typeset()
  {
    return "\\arcsin(y)";
  }
}