package arb.functions.polynomials.orthogonal;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Context;
import arb.functions.Function;

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
 */
public abstract class UltrasphericalPolynomialSequence implements
                                                       OrthogonalPolynomialSequence
{
  @Override
  public void close()
  {
    λ.close();
  }

  JacobiPolynomialSequence          P;

  Real                              λ       = new Real();

  Function<Integer, RealPolynomial> scaledJacobiPolynomial;

  Context                           context = new Context(λ.setName("λ"));
  {
  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return scaledJacobiPolynomial.evaluate(t, order, bits, res);
  }

  /**
   * 
   * @param μ the value of α=μ and β=μ to pass to the
   *          {@link JacobiPolynomialSequence} constructor
   */
  public UltrasphericalPolynomialSequence(Real μ)
  {
    P = new JacobiPolynomialSequence(λ,
                                     λ);
    this.λ.set(μ);
    context.registerFunctionMapping("P", P.P, Integer.class, RealPolynomial.class);
    scaledJacobiPolynomial = Function.express(Integer.class,
                                              RealPolynomial.class,
                                              "(λ*2.0)₍ₙ₎/(λ+½)₍ₙ₎",
                                              context);
  }

}
