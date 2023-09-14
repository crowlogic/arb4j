package arb.functions.polynomials.orthogonal;

import arb.Real;

/**
 * a_n = \int_{-1}^{1} 2 T_{2n}(x) dx - a_{n-1} = \frac{4}{1-4n^2} - a_{n-1}
 */
public class ChebyshevPolynomialRecurrenceOfTheFirstKind implements
                                                         Recurrence
{

  @Override
  public Real generate(int k)
  {
    assert false : "todo";
    return null;
  }

}
