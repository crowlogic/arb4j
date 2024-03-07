package arb.functions.polynomials.orthogonal;

import static java.lang.System.out;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 * 
 * TODO: unit tests <br>
 * 
 * The Chebyshev polynomials of the first kind are an instance of the Jacobi
 * Polynomial Pₙ with α=β=−½ such that <br>
 * <br>
 * 
 * <br>
 * 
 * <a href="https://github.com/crowlogic/arb4j/wiki/ChebyshevPolynomial">Tₙ(x) = Pₙ(−½,−½,x) / Γ(n + 1/2)/(√(π)*Γ(n + 1))</a>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Type1ChebyshevPolynomialSequence extends
                                              JacobiPolynomialSequence
{
  @Override
  public void close()
  {
    norm.close();
  }

  Real norm = new Real();

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial res)
  {
    return super.evaluate(n, order, bits, res).div(normalizationFactor.evaluate(n, bits, norm), bits);
  }

  int                     bits                = 128;

  Function<Integer, Real> normalizationFactor = Function.express(Integer.class,
                                                                 Real.class,
                                                                 "Γ(n + 1/2)/(√(π)*Γ(n + 1))");

  public static void main(String args[])
  {
    Type1ChebyshevPolynomialSequence T = new Type1ChebyshevPolynomialSequence();

    try ( Integer index = new Integer())
    {
      IntStream.range(0, 10).forEach(n ->
      {
        RealPolynomial poly = T.evaluate(index.set(n), 1, 128, new RealPolynomial());
        
        out.format("T(%d,x)=%s\n", n, poly);
      });

      // ShellFunctions.plot(-1, 1, 1000, polys.toArray(new
      // RealPolynomial[polys.size()]));
    }

  }

  public static Real   domain = new Real("0+/-1",
                                         128);

  private RealFunction orthogonalityMeasure;

  public Type1ChebyshevPolynomialSequence()
  {
    super(RealConstants.negHalf,
          RealConstants.negHalf);
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
      orthogonalityMeasure = RealFunction.express("w", "x➔1/√((1-x)²)", context);
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
