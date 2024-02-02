package arb.functions.polynomials.orthogonal;

import static java.lang.System.out;
import static java.util.stream.Collectors.toList;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.Integer;
import arb.OrthogonalBasis;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.real.HypergeometricPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 *
 * The Jacobi polynomials are mutually orthogonal with respect to the weight
 * function
 * 
 * (1-x)^α*(1+x)^β
 * 
 * over the interval [-1,1] when α,β>-1 and are recursively defined by
 * 
 * The Jacobi polynomials are also known as a
 * {@link HypergeometricPolynomialSequence}s
 * 
 * <pre>
 *  C(n)=2n+α+β
 *  F(n)=C(n-1)C(n)
 *  G()=α²-β²
 *  A(n,x)=(F(n)x+G)*((C(n)-1)/2)
 *  B(n)=(n+α-1)(n+β-1)*C(n)
 *  E(n)=n*C(n/2)*C(n-1)
 *  P(0,x)=1
 *  P(1,x)=(C(1)x+α-β)/2  
 *  P(n,x)=(A(n,x)*P(n-1,x)-B(n)*P(n-2,x))/E(n)∀n≥2
 *  
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author Stephen Crowley
 */
public class JacobiPolynomialSequence implements
                                      OrthogonalBasis<Real, RealPolynomial>,
                                      Function<Integer, RealPolynomial>,
                                      AutoCloseable
{
  final public static boolean verbose = false;

  public static Real          domain  = new Real("0+/-1",
                                                 128);

  public static void main(String args[])
  {
    JacobiPolynomialSequence P = new JacobiPolynomialSequence(Real.of("-0.5", 128),
                                                              Real.of("-0.5", 128));

    try ( Integer index = new Integer())
    {
      var polys = IntStream.range(0, 20)
                           .mapToObj(n -> P.evaluate(index.set(n), 128, new RealPolynomial()))
                           .collect(toList());

      polys.forEach(p -> out.format("P(%d,x)=%s\n", p.getLength() - 1, p));

      // ShellFunctions.plot(-1, 1, 1000, polys.toArray(new
      // RealPolynomial[polys.size()]));
    }

  }

  public int                                     bits    = 128;
  public final Real                              α       = new Real().setName("α");

  public final Real                              β       = new Real().setName("β");

  final Context                                  context = new Context(α,
                                                                       β);

  final public RealFunction                      C       = RealFunction.express("C", "2*n+α+β", context, verbose);

  final public Function<Integer, Real>           F       = Function.express(Integer.class,
                                                                            Real.class,
                                                                            "F",
                                                                            "n➔C(n-1)*C(n)",
                                                                            context);

  final public Function<Void, Real>              G       = Function.express(Void.class,
                                                                            Real.class,
                                                                            "G",
                                                                            "α²-β²",
                                                                            context);

  final public Function<Integer, RealPolynomial> A       = Function.express(Integer.class,
                                                                            RealPolynomial.class,
                                                                            "A",
                                                                            "n➔(F(n)*x + G())*(C(n) - 1)/2",
                                                                            context);

  final public RealFunction                      E       = RealFunction.express("E",
                                                                                "n➔n*C(n/2)*C(n-1)",
                                                                                context,
                                                                                verbose);
  final public RealFunction                      B       = RealFunction.express("B",
                                                                                "n➔(n+α-1)*(n+β-1)*C(n)",
                                                                                context,
                                                                                verbose);

  final public Function<Integer, RealPolynomial> P       = Function.express(Integer.class,
                                                                            RealPolynomial.class,
                                                                            "P",
                                                                            "n➔when(n=0,1,n=1,(C(1)*x-β+α)/2,else,(A(n)*P(n-1)-B(n)*P(n-2))/E(n))",
                                                                            context);

  private RealFunction                           orthogonalityMeasure;

  public JacobiPolynomialSequence(Real a, Real b)
  {
    bits = Math.max(128, Math.max(a.bits(), b.bits()));
    this.α.set(a);
    this.β.set(b);

  }

  @Override
  public void close()
  {
    α.close();
    β.close();
    domain.close();
  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return P.evaluate(t, order, bits, res);
  }

  @Override
  public Domain<Real> getDomain()
  {
    return domain;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    if (orthogonalityMeasure == null)
    {
      orthogonalityMeasure = RealFunction.express("w", "x➔(1-x)^α*(1+x)^β", context, verbose);
    }
    return orthogonalityMeasure;
  }

  @Override
  public Iterator<RealPolynomial> iterator()
  {
    return new Iterator<RealPolynomial>()
    {
      int n = 0;

      @Override
      public RealPolynomial next()
      {
        try ( Integer index = new Integer(n++))
        {
          return P.evaluate(index, bits, new RealPolynomial());
        }
      }

      @Override
      public boolean hasNext()
      {
        return true;
      }
    };
  }

}
