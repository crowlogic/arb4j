package arb.functions.polynomials.orthogonal;

import static arb.RealConstants.half;
import static java.lang.System.out;

import junit.framework.TestCase;

public class JacobiPolynomialTest extends
                                  TestCase
{
  public static void testP1()
  {
    JacobiPolynomials seq = new JacobiPolynomials(half,
                                                  half);
    try ( JacobiPolynomial p1 = new JacobiPolynomial(seq,
                                                     1
                                                     ))
    {
      out.println("p1=" + p1);
    }
  }
}
