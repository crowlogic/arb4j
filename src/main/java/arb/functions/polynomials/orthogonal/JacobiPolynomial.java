package arb.functions.polynomials.orthogonal;

import arb.RealPolynomial;

/**
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
public class JacobiPolynomial<J extends JacobiPolynomial<?>> extends
                             RealPolynomial
{

  public JacobiPolynomial(JacobiPolynomialSequence<? extends J> sequence, int n)
  {
    this.sequence = sequence;
    this.n        = n;
    init(n + 1);
    assert getLength() == n + 1;
    // assert false : "TODO: evaluate 3-term recurrence and initialize polynomial
    // coeffecients";
  }

  final public JacobiPolynomialSequence<? extends J> sequence;

  final public int                                   n;

}
