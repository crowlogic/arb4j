package arb.functions.integer;

import arb.RealConstants;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.real.*;
import junit.framework.TestCase;

public class RealPolynomialSequenceTest extends
                                        TestCase
{
  public static void testIntegral()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(RealConstants.negHalf,
                                                                      RealConstants.negHalf))
    {
      IntegralSequence intSeq = seq.integral();

      RealPolynomial   intP3  = intSeq.apply(3);
      assertEquals("0.3125*x⁴ - 0.46875*x²", intP3.toString());
    }
  }

  public static void testDerivative()
  {
    try ( JacobiPolynomialSequence seq = new JacobiPolynomialSequence(RealConstants.negHalf,
                                                                      RealConstants.negHalf);)
    {
      DerivativeSequence diffSeq = seq.derivative();
      RealPolynomial     diffP3  = diffSeq.apply(3);
      assertEquals("3.75*x² - 0.9375", diffP3.toString());
    }

  }

}
