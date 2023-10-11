package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.*;
import arb.domains.Domain;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;

/**
 * The {@code LegendrePolynomials} class provides methods and functionality to
 * work with Legendre polynomials, which are solutions to Legendre's
 * differential equation and arise in many physics problems. This class
 * implements the {@code OrthogonalBasis} interface, meaning it provides a basis
 * for the representation of functions within an orthogonal system.
 * 
 * Legendre polynomials \( P_n(x) \) are defined on the interval [-1, 1] and can
 * be generated using Rodrigues' formula:
 * 
 * \[ P_n(x) = \frac{1}{2^n n!} \frac{d^n}{dx^n} \left[ (x^2 - 1)^n \right] \]
 * 
 * They are orthogonal with respect to the weight function \( w(x) = 1 \) on the
 * interval [-1,1].
 * 
 * Usage example, assuming proper definitions of LegendrePolynomial and related
 * classes:
 * 
 * <pre>
 * {@code
 * LegendrePolynomial h1 = new LegendrePolynomial(1);
 * Real v = h1.evaluate(RealConstants.one, 1, 128, new Real());
 * System.out.println("h1(1)=" + v);
 * }
 * </pre>
 * 
 * @implNote This implementation relies on {@code LegendrePolynomial},
 *           {@code RealFunction}, {@code Real}, and other classes which are not
 *           defined here. Ensure to have appropriate definitions for them.
 * 
 * @author [Your Name]
 * @version 1.0
 * @see LegendrePolynomial
 * @see RealFunction
 * @since 1.0
 */
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