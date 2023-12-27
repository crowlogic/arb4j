package arb.functions.polynomials.orthogonal;

/**
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
 * 
 * @param <J> the type of {@link UltrasphericalPolynomial}
 * @param <K> the type of {@link UltrasphericalPolynomialSequence}
 */
public class UltrasphericalPolynomial<J extends UltrasphericalPolynomial<? extends J, ? extends K>, K extends UltrasphericalPolynomialSequence<? extends J>>
                                     extends
                                     JacobiPolynomial<J>
{

  public UltrasphericalPolynomial(K sequence, int n)
  {
    super(sequence,
          n);
  }

}
