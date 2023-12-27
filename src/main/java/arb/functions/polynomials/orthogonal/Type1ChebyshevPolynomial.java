package arb.functions.polynomials.orthogonal;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.functions.real.RealFunction;

/**
 * multiply the n-th Jacobi polynomial with <br><br>
 * (α,β)=(-1/2,-1/2) by √π*Γ(n + 1)/Γ(n + ½)<br>
 * <br>
 * to produce the Type-1 Chebyshev polynomials
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
 * 
 * @param <J>
 * @see Type1ChebyshevPolynomialSequence
 */
public class Type1ChebyshevPolynomial extends
                                      UltrasphericalPolynomial<Type1ChebyshevPolynomial, Type1ChebyshevPolynomialSequence>
{

  @Override
  public void close()
  {
    super.close();
    norm.close();
  }

  public final RealFunction scaling = express("√(π)*Γ(n + 1)/Γ(n + ½)");

  public final Real         norm    = new Real();

  public int                bits    = 256;

  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    return super.evaluate(z, order, prec, w).mul(norm, prec);
  }

  public Type1ChebyshevPolynomial(Type1ChebyshevPolynomialSequence sequence, int n)
  {
    super(sequence,
          n);
    scaling.evaluate(norm, bits, norm);
  }

}
