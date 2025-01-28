package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealSequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NormalizedJacobiPolynomials extends
                                         JacobiPolynomials
{
  public static final String NORM = "when(n=0,1,else,2^(α+β+1)*Γ(n+α+1)*Γ(n+β+1)/(2*n+α+β+1)/Γ(n+α+β+1)/n!)";

  Real                       blip = new Real();

  public final RealSequence  norm;

  public NormalizedJacobiPolynomials(Real a, Real b)
  {
    super(a,
          b);
    norm = RealSequence.express(NORM, context);
  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return super.evaluate(t, order, bits, res).div(norm.evaluate(t, bits, blip), bits, res);
  }

  @Override
  public void close()
  {
    blip.close();
    blip = null;
  }

}
