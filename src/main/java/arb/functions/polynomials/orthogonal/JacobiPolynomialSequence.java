package arb.functions.polynomials.orthogonal;

import static arb.expressions.Expression.express;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.OrthogonalBasis;
import arb.Real;
import arb.domains.Domain;
import arb.expressions.RealContext;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

/**
 * The Jacobi Polynomials are orthogonal with respect to the measure
 * 
 * (1-x)^α*(1+x)^β
 * 
 * over the interval [-1,1].
 * 
 * For the Jacobi polynomials:
 * 
 * Initial condition: P₀(x) = 1
 * 
 * Initial condition: P₁(x) = ((α-β)+(2+α+β)*x)/2
 * 
 * <a> I apologize for any confusion. Upon closer inspection, I noticed a
 * discrepancy in the formulas. The provided code and mathematical expressions
 * don't match precisely.
 * 
 * In the code snippet, the function AA is defined as:
 * A=(2n+α+β−1)(α2−β2+(2n+α+β−2)(2n+α+β))2n(n+α+β)(2n+α+β−2)
 * A=2n(n+α+β)(2n+α+β−2)(2n+α+β−1)(α2−β2+(2n+α+β−2)(2n+α+β))​
 * 
 * And the function BB is defined as: B=(n+α−1)(n+β−1)(2n+α+β)n(n+α+β)(2n+α+β−2)
 * B=n(n+α+β)(2n+α+β−2)(n+α−1)(n+β−1)(2n+α+β)​
 * 
 * In the mathematical expressions, the formulas are represented as:
 * An(α,β)=(2n+α+β−1)(α2−β2+(2n+α+β−2)(2n+α+β))2n(n+α+β)(2n+α+β−2)
 * An​(α,β)=2n(n+α+β)(2n+α+β−2)(2n+α+β−1)(α2−β2+(2n+α+β−2)(2n+α+β))​
 * Bn(α,β)=(n+α−1)(n+β−1)(2n+α+β)n(n+α+β)(2n+α+β−2)
 * Bn​(α,β)=n(n+α+β)(2n+α+β−2)(n+α−1)(n+β−1)(2n+α+β)​
 * 
 * Upon comparing the code and mathematical expressions, it appears that there
 * are no discrepancies between them. They represent the same mathematical
 * formulas for AnAn​ and BnBn​. My earlier response was incorrect, and the code
 * and mathematical expressions do match precisely. <a>
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class JacobiPolynomialSequence<J extends JacobiPolynomial<?>> implements
                                     OrthogonalBasis<Real, J>,
                                     AutoCloseable
{
  public static int           bits    = 128;
  public Real                 α       = new Real();
  public Real                 β       = new Real();

  final Variables<Real>       vars    = new Variables<Real>(α.setName("α"),
                                                            β.setName("β"));

  final RealContext           context = new RealContext(vars);

  final public static boolean verbose = false;

  final public RealFunction   A       = express("A",
                                                "((2*n+α+β-1)*(α^2-β^2+(2*n+α+β-2)*(2*n+α+β)))/(2*n*(n+α+β)*(2*(n-1)+α+β))",
                                                context,
                                                true);

  final public RealFunction   B       = express("B",
                                                "((n+α-1)*(n+β-1)*(2*n+α+β))/(n*(n+α+β)*(2*n+α+β-2))",
                                                context,
                                                verbose);

  final public RealFunction   p1      = express("α/2-β/2+(2+α+β)*x/2", context, verbose);

  public JacobiPolynomialSequence(Real a, Real b)
  {
    this.α.set(a);
    this.β.set(b);
  }

  public Real computeCoefficients(int N)
  {
    if (N < 2)
    {
      throw new IllegalArgumentException("n should be >= 2");
    }

    Real         coefficients = Real.newVector(N + 2);

    // FIXME: implement integer variables along with the integer-constants in
    // https://github.com/crowlogic/arb4j/issues/222

    RealFunction p            = express("(2 * n + a + b) / (2 * n) * z * P[n-1] - (n + a + b - 1) / n * P[n-2]",
                                        context);

    try ( Real realn = new Real())
    {
      IntStream.range(2, N + 1).forEach(n ->
      {
        p.evaluate(realn.set(n), bits, coefficients.get(n));
      });
    }

    return coefficients;
  }

  @Override
  public Iterator<J> iterator()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    assert false : "return (1-x)^a(1+x)^b";
    return null;
  }

  public static Real domain = new Real("0+/-1",
                                       bits);

  @Override
  public Domain<Real> getDomain()
  {
    return domain;
  }

  @Override
  public void close()
  {
    α.close();
    β.close();
    domain.close();
  }

}
