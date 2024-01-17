package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.negHalf;

/**
 * The Chebyshev polynomials of the first kind are an instance of the Jacobi
 * Polynomial Pₙ with α=β=−½ such that <br>
 * <br>
 * 
 * Tₙ(x) = Pₙ(−½,−½,x) * π​*Γ(n+1)/Γ(n+½)
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
 */
public class Type1ChebyshevPolynomialSequence extends
                                              UltrasphericalPolynomialSequence<Type1ChebyshevPolynomial>

{

  public Type1ChebyshevPolynomialSequence()
  {
    super(negHalf);
  }

}
