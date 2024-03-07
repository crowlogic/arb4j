package arb.functions.polynomials.orthogonal;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * The {@link UltrasphericalPolynomial}s are special-cases of the
 * {@link JacobiPolynomial}s where both α and β are equal to the same value
 * α=β=μ
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public abstract class UltrasphericalPolynomialSequence extends
                                                       JacobiPolynomialSequence
{
  @Override
  public void close()
  {
    λ.close();
    scale.close();
  }

  Real                            λ     = new Real().setName("λ");
  Real                            scale = new Real();

  private Function<Integer, Real> normalizationFactor;

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    super.evaluate(t, order, bits, res);
    Real evaluate = normalizationFactor.evaluate(t, order, bits, scale);
    return res.mul(evaluate, bits, res);
  }

  /**
   * 
   * @param λ the value of α=μ and β=μ to pass to the
   *          {@link JacobiPolynomialSequence} constructor
   */
  public UltrasphericalPolynomialSequence(Real λ)
  {
    super(λ,
          λ);
    α.sub(RealConstants.half, bits);
    β.sub(RealConstants.half, bits);
    context.registerVariable(λ.sub(RealConstants.half, bits, this.λ));
    normalizationFactor = Function.express(Integer.class, Real.class, "(λ*2)₍ₙ₎/(λ+½)₍ₙ₎", context);
  }

}
