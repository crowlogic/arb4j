package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.*;
import arb.domains.Domain;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;

public class LegendrePolynomials implements
                                 OrthogonalBasis<Real, LegendrePolynomial>
{

  final static int bits = 128;

  public static void main(String arg[]) throws InterruptedException
  {

    try ( LegendrePolynomial h1 = new LegendrePolynomial(1); LegendrePolynomial h2 = new LegendrePolynomial(2);
          LegendrePolynomial h3 = new LegendrePolynomial(3); LegendrePolynomial h4 = new LegendrePolynomial(4))
    {
      ShellFunctions.plot(-1, 1, 1000, h1, h2, h3, h4);

      Real v = h1.evaluate(RealConstants.one, 1, bits, new Real());
      System.out.println("h1(1)=" + v);
    }

    while (true)
    {
      Thread.sleep(1000);

    }
  }

  @Override
  public Iterator<LegendrePolynomial> iterator()
  {
    return new Iterator<LegendrePolynomial>()
    {
      int i = 0;

      @Override
      public boolean hasNext()
      {
        return true;
      }

      @Override
      public LegendrePolynomial next()
      {
        return new LegendrePolynomial(i++);
      }
    };
  }

  Variables<Real> context       = new Variables<Real>();

  RealFunction    constantUnity = (t, order, bits, result) -> result.one();

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    return constantUnity;
  }

  public static final Real domain = new Real();

  static
  {
    domain.setRad(MagnitudeConstants.one);
  }

  /**
   * @return 0 +/- 1 = [-1,1]
   */
  @Override
  public Domain<Real> getDomain()
  {
    return domain;
  }

}