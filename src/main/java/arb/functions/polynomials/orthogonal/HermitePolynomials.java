package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.*;
import arb.domains.Domain;
import arb.domains.ExtendedRealLine;
import arb.expressions.Expression;
import arb.expressions.Variables;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.RealFunction;
import arb.utensils.ShellCommands;

/**
 * Represents the Hermite polynomials, a sequence of orthogonal polynomials. The
 * Hermite polynomials can be defined using the Rodrigues formula:
 * 
 * <pre>
 * H_n(x) = (-1)ⁿ * e^(x²) * dⁿ/dxⁿ e^(-x²)
 * </pre>
 * 
 * where n is a non-negative integer, and Hₙ(x) is the n-th Hermite polynomial.
 * Alternatively, they can be defined using a generating function:
 * 
 * <pre>
 * G(x,t) = e^{2xt - t²} = ∑ ᪲ₙ₌₀( Hₙ(x) * tⁿ/n! )
 * </pre>
 * 
 * The Hermite polynomials are polynomials in x of degree n, and they form a
 * complete orthogonal system with respect to the weight function e^(-x²) on the
 * {@link ExtendedRealLine}
 */
public class HermitePolynomials implements
                                OrthogonalPolynomialSequence<HermitePolynomial>
{

  final static int bits = 128;

  public static void main(String arg[]) throws InterruptedException
  {

    try ( HermitePolynomial h1 = new HermitePolynomial(1);
          HermitePolynomial h2 = new HermitePolynomial(2);
          HermitePolynomial h3 = new HermitePolynomial(3);
          HermitePolynomial h4 = new HermitePolynomial(4))
    {
      ShellCommands.plot(-1, 1, h1, h2, h3, h4);

      Real v = h1.evaluate(RealConstants.one, 1, bits, new Real());
      System.out.println("h1(1)=" + v);
    }

    while (true)
    {
      Thread.sleep(1000);

    }
  }

  @Override
  public Iterator<RealFunction> iterator()
  {
    return new Iterator<RealFunction>()
    {
      int i = 0;

      @Override
      public boolean hasNext()
      {
        return true;
      }

      @Override
      public HermitePolynomial next()
      {
        return new HermitePolynomial(i++);
      }
    };
  }

  Variables<Real> context        = new Variables<Real>();

  RealFunction    standardNormal = (t, order, bits, result) -> t.pow(2, bits, result).neg().exp(bits);

  @Override
  public HolomorphicFunction getOrthogonalMeasure()
  {
    return (t, order, bits, result) ->
    {
      if (!t.im().isZero())
      {
        throw new UnsupportedOperationException("nonzero imaginary not allowed here, the solution is to properly generify this class and method so that we can just use the real type instead of passing around a complex and only using the real part of it");
      }
      else
      {
        standardNormal.evaluate(t.re(), order, bits, result.re());
      }
      return result;
    };
    // "todo: change getDistribution()s return value to be generic instead of
    // specificlally Complex->Complex";
  }

  @Override
  public Domain getDomain()
  {
    return ExtendedRealLine.instance;
  }

}
