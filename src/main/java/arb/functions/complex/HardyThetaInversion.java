package arb.functions.complex;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.functions.real.RiemannSiegelThetaFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HardyThetaInversion
{
  private static final int           DEFAULT_PRECISION = 128;

  private RiemannSiegelThetaFunction θ                 = new RiemannSiegelThetaFunction();

  public Real
         invertTheta(Real thetaValue, Real centerPoint, int seriesOrder, int precision, Real result)
  {
    try ( RealPolynomial series = buildTaylorSeries(centerPoint,
                                                    seriesOrder,
                                                    precision,
                                                    new RealPolynomial());
          RealPolynomial reversed = new RealPolynomial(); Real thetaAtCenter = new Real();
          Real delta = new Real())
    {
      arblib.arb_poly_revert_series(reversed, series, seriesOrder, precision);

      return reversed.evaluate(thetaValue.sub(θ.evaluate(centerPoint, 0, precision, thetaAtCenter),
                                              precision,
                                              delta),
                               0,
                               precision,
                               result)
                     .add(centerPoint, precision);
    }
  }

  RealFunction rsThetaDerivative = θ.derivative();

  private RealPolynomial buildTaylorSeries(Real t, int order, int precision, RealPolynomial result)
  {
    result.fitLength(order);

    try ( Real coeff = new Real())
    {
      result.get(0).zero();
      result.set(1, rsThetaDerivative.evaluate(t, 0, precision, coeff));

      for (int n = 2; n < order; n++)
      {
        result.get(n).zero();
      }

      return result;
    }
  }

  private Real evaluateTheta(Real t, int precision, Real result)
  {
    return θ.evaluate(t, 0, precision, result);
  }

  public static void main(String[] args)
  {
    int                 precision   = java.lang.Integer.parseInt(args.length > 0 ? args[0] : "128");
    int                 seriesOrder = java.lang.Integer.parseInt(args.length > 1 ? args[1] : "20");

    HardyThetaInversion inverter    = new HardyThetaInversion();

    try ( Real thetaValue = Real.valueOf(1); Real result = new Real();
          Real centerPoint = Real.valueOf(2);)
    {
      inverter.invertTheta(thetaValue, centerPoint, seriesOrder, precision, result);
      System.out.println("Result: " + result.toString(20));
    }
  }
}
