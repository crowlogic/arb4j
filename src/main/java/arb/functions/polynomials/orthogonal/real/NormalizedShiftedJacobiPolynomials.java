package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NormalizedShiftedJacobiPolynomials extends
                                                ShiftedJacobiPolynomials
{

  @Override
  public String toString()
  {
    return String.format("NormalizedShiftedJacobiPolynomials[α=%s, β=%s]", α, β);
  }

  public final RealSequence norm =  RealSequence.express(NormalizedJacobiPolynomials.NORM, context);

  Real                      blip = new Real();

  @Override
  public void close()
  {
    blip.close();
    blip = null;
  }
  
  public NormalizedShiftedJacobiPolynomials()
  {
    super();
  }
  
  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return super.evaluate(t, order, bits, res).div(norm.evaluate(t, bits, blip), bits, res);
  }

}
