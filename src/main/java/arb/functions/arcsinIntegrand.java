package arb.functions;

import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

public class arcsinIntegrand implements
                                   Function<Real, Real>,
                                   Typesettable,
                                   AutoCloseable,
                                   Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("1");
  public final Integer cℤ0001 = new Integer("2");
  public Real          vℝ0001 = new Real();
  public Real          vℝ0002 = new Real();
  public Real          vℝ0003 = new Real();

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
    return this.cℤ0000.div(this.cℤ0000.sub(y.pow(this.cℤ0001, bits, this.vℝ0001), bits, this.vℝ0002)
                                      .pow(FractionConstants.oneHalf, bits, this.vℝ0003),
                           bits,
                           result);
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
  public void close()
  {
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.vℝ0001.close();
    this.vℝ0002.close();
    this.vℝ0003.close();
  }

  @Override
  public String toString()
  {
    return "y➔1/((1-(y^2))^½)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{1}{{(\\left(1-{y}^{2}\\right))}^{\\frac{1}{2}}}";
  }
}