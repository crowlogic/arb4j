package arb.functions.complex;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RiemannSiegelThetaFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HardyThetaInversion
{
  private static final int           DEFAULT_PRECISION  = 128;

  private RiemannSiegelThetaFunction riemannSiegelTheta = new RiemannSiegelThetaFunction();

  public Real invertTheta(Real thetaValue, Real centerPoint, int seriesOrder, int precision)
  {
    try ( Real result = new Real();
          RealPolynomial series = buildTaylorSeries(centerPoint, seriesOrder, precision);
          RealPolynomial reversed = new RealPolynomial(); Real thetaAtCenter = new Real();
          Real delta = new Real())
    {
      arblib.arb_poly_revert_series(reversed, series, seriesOrder, precision);

      riemannSiegelTheta.evaluate(centerPoint, 0, precision, thetaAtCenter);
      thetaValue.sub(thetaAtCenter, precision, delta);

      reversed.evaluate(delta, 0, precision, result);
      result.add(centerPoint, precision);

      return new Real().set(result);
    }
  }

  private RealPolynomial buildTaylorSeries(Real t, int order, int precision)
  {
    RealPolynomial series = new RealPolynomial();
    series.fitLength(order);

    try ( Real coeff = new Real())
    {
      series.set(0, RealConstants.zero);

      riemannSiegelTheta.derivative().evaluate(t, 0, precision, coeff);
      series.set(1, coeff);

      for (int n = 2; n < order; n++)
      {
        series.set(n, Real.valueOf(0.0));
      }

      return series;
    }
  }

  private Real evaluateTheta(Real t, Real result, int precision)
  {
    return riemannSiegelTheta.evaluate(t, 0, precision, result);
  }

  public static void main(String[] args)
  {
    int                 precision   = java.lang.Integer.parseInt(args.length > 0 ? args[0] : "128");
    int                 seriesOrder = java.lang.Integer.parseInt(args.length > 1 ? args[1] : "20");

    HardyThetaInversion inverter    = new HardyThetaInversion();

    try ( Real thetaValue = new Real().set(1.0); Real centerPoint = new Real().set(2.0);
          Real result = new Real())
    {
      result.set(inverter.invertTheta(thetaValue, centerPoint, seriesOrder, precision));
      System.out.println("Result: " + result.toString(20));
    }
  }
}
