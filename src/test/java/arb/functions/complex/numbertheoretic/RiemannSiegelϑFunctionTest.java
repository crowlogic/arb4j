package arb.functions.complex.numbertheoretic;

import static arb.ComplexConstants.one;
import static arb.ComplexConstants.ⅈ;

import arb.Complex;
import arb.ComplexConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * TODO: utilize the identities
 * 
 * <pre>
 * arg⁡ z = (log⁡ z − log⁡ z̄) / 2i 
 * 
 * and 
 * 
 * conj(Γ)(z) = Γ(z̄)
 * 
 * to obtain the closed-form expression
 * 
 * θ(t) = ( log⁡ Γ(1/4 + 2it ) − log⁡ Γ(1/4 − 2it) / 2i ) − log⁡ π / 2t 
 *      = −i/2 (ln⁡Γ(1/4 + i*t/2) − lnΓ(1/4 − i*t/2) ) − ln⁡(π) t / 2
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiemannSiegelϑFunctionTest extends
                                        TestCase
{

  public void
         testRiemannSiegelThetaAtOne()
  {
    try ( RiemannSiegelϑFunction ϑ = new RiemannSiegelϑFunction())
    {
      var ϑone = ϑ.evaluate(ComplexConstants.one, 128);
      assertEquals(-1.7675479528122903883, ϑone.re()
                                               .doubleValue());
      assertEquals(0.0, ϑone.im()
                            .doubleValue());
    }
  }

  public void
         testRiemannSiegelThetaAtOnePlusi()
  {
    try ( RiemannSiegelϑFunction ϑ = new RiemannSiegelϑFunction())
    {
      var onePlusⅈ  = one.add(ⅈ, 128, new Complex());
      var ϑonePlusⅈ = ϑ.evaluate(onePlusⅈ, 128);
      assertEquals(-2.0425588058374755726, ϑonePlusⅈ.re()
                                                    .doubleValue());
      assertEquals(-0.86315264537612030287, ϑonePlusⅈ.im()
                                                     .doubleValue());
    }
  }

}
