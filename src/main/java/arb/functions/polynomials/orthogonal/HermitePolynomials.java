package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.OrthogonalBasis;
import arb.Real;
import arb.RealConstants;
import arb.domains.Domain;
import arb.domains.ExtendedRealLine;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;
import arb.utensils.ShellFunctions;

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
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class HermitePolynomials implements
                                OrthogonalBasis<Real, HermitePolynomial>
{

  final static int bits = 128;

  public static void main(String arg[]) throws InterruptedException
  {

    try ( HermitePolynomial h1 = new HermitePolynomial(1); HermitePolynomial h2 = new HermitePolynomial(2);
          HermitePolynomial h3 = new HermitePolynomial(3); HermitePolynomial h4 = new HermitePolynomial(4))
    {
      ShellFunctions.plot(-10, 40, 1000, h1, h2, h3, h4);

      Real v = h1.evaluate(RealConstants.one, 1, bits, new Real());
      System.out.println("h1(1)=" + v);
    }

    while (true)
    {
      Thread.sleep(1000);

    }
  }

  @Override
  public Iterator<HermitePolynomial> iterator()
  {
    return new Iterator<HermitePolynomial>()
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

  Variables context        = new Variables();

  RealFunction    standardNormal = (t, order, bits, result) -> t.pow(2, bits, result).neg().exp(bits);

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    return standardNormal;
  }

  @Override
  public Domain<Real> getDomain()
  {
    return ExtendedRealLine.instance;
  }

}
