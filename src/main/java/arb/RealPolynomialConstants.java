package arb;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class RealPolynomialConstants
{
  public static RealPolynomial zero = new RealPolynomial(0);

  public static RealPolynomial one  = new RealPolynomial(1);

  static
  {
    one.get(0).one();
  }

}
