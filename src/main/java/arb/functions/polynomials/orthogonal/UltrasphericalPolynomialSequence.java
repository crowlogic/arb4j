package arb.functions.polynomials.orthogonal;

import arb.Real;

/**
 * The {@link UltrasphericalPolynomial}s are special-cases of the
 * {@link JacobiPolynomial}s where both α and β are equal to the same value
 * α=β=μ
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2024 Stephen Crowley
 * @param <J>the type of{
 * @link UltrasphericalPolynomial}s that this sequence*generates
 */
public class UltrasphericalPolynomialSequence<J extends UltrasphericalPolynomial<?, ?>> extends
                                             JacobiPolynomialSequence<J>
{

  /**
   * 
   * @param μ the value of α=μ and β=μ to pass to the
   *          {@link JacobiPolynomialSequence} constructor
   */
  public UltrasphericalPolynomialSequence(Real μ, int N)
  {
    super(μ,
          μ,
          N);
  }

}
