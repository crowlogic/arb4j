package arb.functions.polynomials.quasi.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.sequences.ComplexPolynomialSequence;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexHypergeometricQuasiPolynomialTest
                                                      extends
                                                      TestCase
{

  public static void testComplexHypergeometricFactorOfFourierTransformOfType1Chebyshevpolynomials()
  {
    Expression<Integer, ComplexPolynomial, ComplexPolynomialSequence> expression = ComplexPolynomialSequence.parse("F",
                                                                                                                   "n->pFq([1,n,-n],[1/2],ⅈ*y/2)",
                                                                                                                   null);

    var                                                               f          = expression.instantiate();
    var                                                               f0         = f.evaluate(4, 128);
    System.out.println("f0=" + f0);
    Complex f0TwoPointThree = f0.evaluate(new Complex(new Real("2.3",
                                                               128),
                                                      RealConstants.zero),
                                          128,
                                          new Complex());
    System.out.println("f0(2.3)=" + f0TwoPointThree);
  }

}
