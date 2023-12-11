package arb.functions.polynomials.orthogonal;

import static arb.functions.real.RealFunction.express;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.OrthogonalBasis;
import arb.Real;
import arb.domains.Domain;
import arb.expressions.RealContext;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

/**
 * The Jacobi polynomials are recursively defined by
 * 
 * <pre>
 * Initial Conditions:
 * 
 *   P(0,x) = 1
 *   P(1,x) = (C(1)x+α-β)/2
 * 
 * Coefficient Functions:
 * 
 *   C(n) = 2n + α + β
 *   F(n) = C(n-1)*C(n)
 *   G = α²-β²
 *   A(n) = ( F(n)*x + G )*(C(n)-1)/2
 *   B(n) = (n + α - 1) * (n + β - 1) * C(n)
 *   E(n) = n * C(n/2) * C(n - 1)
 *   
 * Recurrence Relation for n >= 2:
 * 
 *   P[n] = (x * A(n) * P(n-1,x) - B(n) * P(n-2,x)) / E(n)
 * </pre>
 * 
 * The polynomials P(n) are mutually orthogonal with respect to the weight
 * function
 * 
 * (1 - x)^α * (1 + x)^β
 * 
 * over the interval [-1, 1].
 * 
 * <pre>
 * 
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class JacobiPolynomialSequence<J extends JacobiPolynomial<? extends JacobiPolynomial<?>>> implements
                                     OrthogonalBasis<Real, J>,
                                     AutoCloseable
{
  public int           bits    = 128;
  public Real                 α       = new Real();
  public Real                 β       = new Real();

  final Variables<Real>       vars    = new Variables<Real>(α.setName("α"),
                                                            β.setName("β"));

  final RealContext           context = new RealContext(vars);

  final public static boolean verbose = false;

  final public RealFunction   C       = express("C", "2*n+α+β", context, verbose);
  final public RealFunction   F       = express("F", "C(n-1)*C(n)", context, verbose);
  
  final public RealFunction   E       = express("E",
                                                "((n+α-1)*(n+β-1)*(2*n+α+β))/(n*(n+α+β)*(2*n+α+β-2))",
                                                context,
                                                verbose);
  final public RealFunction   A       = express("A", "(E(n)-1)*E(n)/(2*n*E(n/2))", context, verbose);

  final public RealFunction   B       = express("((E(n) - 1)*(α^2 - β^2))/(2*n*(n + α + β)*E(n - 1))",
                                                context,
                                                verbose);

  final public Real G = new Real();

  final public RealFunction   p1      = express("α/2-β/2+(2+α+β)*x/2", context, verbose);

  public JacobiPolynomialSequence(Real a, Real b)
  {
    bits = Math.max(a.bits(), b.bits());
    a.pow(2,bits,α).sub(b.pow(2, bits,β), bits, G);
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
                                       128);

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
    G.close();
  }

}
