package arb.functions.complex;

import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class HardyThetaInversion
                                 implements
                                 RealFunction
{
  public Real            centerPoint;
  public int             seriesOrder = 20;
  private RealPolynomial reversedSeries;
  private Real           thetaAtCenter;
  private boolean        initialized = false;
  RealFunction θ;

  public HardyThetaInversion()
  {
  }

  public HardyThetaInversion(RealFunction theta, Real centerPoint, int seriesOrder, int precision)
  {
    this.centerPoint = centerPoint;
    this.seriesOrder = seriesOrder;
    this.θ = theta;
    initialize(precision);
  }

  public void initialize(int precision)
  {
    if (initialized)
    {
      throw new IllegalStateException("Already initialized");
    }

    if (seriesOrder < 2)
    {
      throw new IllegalArgumentException("seriesOrder must be at least 2, got: " + seriesOrder);
    }

    try ( RealPolynomial series = new RealPolynomial())
    {
      buildTaylorSeries(centerPoint,
                        seriesOrder,
                        precision,
                        series);

      reversedSeries = series.invert(seriesOrder,
                                     precision,
                                     new RealPolynomial());

      thetaAtCenter  = Real.newVector(2);
      θ.evaluate(centerPoint,
                 2,
                 precision,
                 thetaAtCenter);

      initialized = true;
    }
  }


  @Override
  public Real evaluate(Real thetaValue, int order, int bits, Real result)
  {
    if (!initialized)
    {
      throw new IllegalStateException("Must call initialize(precision) before evaluate");
    }

    return reversedSeries.evaluate(thetaValue.sub(thetaAtCenter.get(0),
                                                  bits,
                                                  result),
                                   1,
                                   bits,
                                   result)
                         .add(centerPoint,
                              bits);

  }

  private RealPolynomial buildTaylorSeries(Real t, int order, int precision, RealPolynomial result)
  {
    result.setLength(order);
    result.fitLength(order);

    θ.evaluate(t,
               order,
               precision,
               result.getCoeffs());
    result.get(0).zero();

    return result;
  }

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
}
