package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.negHalf;
import static java.lang.System.out;
import static java.util.stream.Collectors.toList;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 * The Chebyshev polynomials of the first kind are an instance of the Jacobi
 * Polynomial Pₙ with α=β=−½ such that <br>
 * <br>
 * 
 * Tₙ(x) = Pₙ(−½,−½,x) * π​*Γ(n+1)/Γ(n+½)
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 */
public class Type1ChebyshevPolynomialSequence extends
                                              UltrasphericalPolynomialSequence

{
  public static void main(String args[])
  {
    Type1ChebyshevPolynomialSequence P = new Type1ChebyshevPolynomialSequence();

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

  public static Real          domain  = new Real("0+/-1",
                                                 128);

  private RealFunction orthogonalityMeasure;
  public Type1ChebyshevPolynomialSequence()
  {
    super(negHalf);
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
      orthogonalityMeasure = RealFunction.express("w", "x➔(1-x)^α*(1+x)^β", context);
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
          return P.evaluate(index, 128, new RealPolynomial());
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
