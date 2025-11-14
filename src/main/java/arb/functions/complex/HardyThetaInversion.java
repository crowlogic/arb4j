package arb.functions.complex;

import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RiemannSiegelThetaFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HardyThetaInversion
{
  private RiemannSiegelThetaFunction θ = new RiemannSiegelThetaFunction();

  public Real
         invertTheta(Real thetaValue, Real centerPoint, int seriesOrder, int precision, Real result)
  {
    if (seriesOrder < 2)
    {
      throw new IllegalArgumentException("seriesOrder must be at least 2, got: " + seriesOrder);
    }

    try ( RealPolynomial series = buildTaylorSeries(centerPoint,
                                                    seriesOrder,
                                                    precision,
                                                    new RealPolynomial());
          RealPolynomial reversed = new RealPolynomial(); Real thetaAtCenter = new Real();
          Real delta = new Real())
    {
      System.out.println("series=" + series);

      // Compute the inverse series
      series.invert(seriesOrder, precision, reversed);

      System.out.println("reversed=" + reversed);

      // Evaluate: t = centerPoint + reversed(thetaValue - θ(centerPoint))
      return reversed.evaluate(thetaValue.sub(θ.evaluate(centerPoint, 0, precision, thetaAtCenter),
                                              precision,
                                              delta),
                               0,
                               precision,
                               result)
                     .add(centerPoint, precision);
    }
  }

  /**
   * Build Taylor series for θ(centerPoint + x) - θ(centerPoint) around x=0 This
   * gives: series(x) = θ'(t)·x + (θ''(t)/2!)·x² + (θ'''(t)/3!)·x³ + ...
   */
  private RealPolynomial buildTaylorSeries(Real t, int order, int precision, RealPolynomial result)
  {
    if (order < 2)
    {
      throw new IllegalArgumentException("Order must be at least 2 for series reversion");
    }

    result.setLength(order);
    result.fitLength(order);

    try ( Real allDerivs = Real.newVector(order); Real temp = new Real())
    {
      // Get ALL derivatives at once: allDerivs.get(n) = θ^(n)(t) for n=0 to order-1
      θ.evaluate(t, order, precision, allDerivs);

      return result;
    }
  }

  public static void main(String[] args)
  {
    int precision   = java.lang.Integer.parseInt(args.length > 0 ? args[0] : "128");
    int seriesOrder = java.lang.Integer.parseInt(args.length > 1 ? args[1] : "20");

    if (seriesOrder < 2)
    {
      System.err.println("seriesOrder must be at least 2, setting to 2");
      seriesOrder = 2;
    }

    HardyThetaInversion inverter = new HardyThetaInversion();

    try ( Real thetaValue = Real.valueOf(1); Real result = new Real();
          Real centerPoint = Real.valueOf(2);)
    {
      inverter.invertTheta(thetaValue, centerPoint, seriesOrder, precision, result);
      System.out.println("Result: " + result.toString(20));
    }
  }
}
