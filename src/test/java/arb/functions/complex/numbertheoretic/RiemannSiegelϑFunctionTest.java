package arb.functions.complex.numbertheoretic;

import static arb.ComplexConstants.one;
import static arb.ComplexConstants.ⅈ;

import arb.Complex;
import arb.ComplexConstants;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexRiemannSiegelThetaFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealRiemannSiegelThetaFunction;
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

  public static void testRealRSThetaFunction()
  {
    try ( var θ = RealFunction.express("arg(Γ(1/4+(ⅈ*t)/2))-(log(π)/2*t)"))
    {
      assertEquals(-1.7675479528122903883, θ.eval(1));
    }
  }

  public void testRiemannSiegelThetaAtOne()
  {
    try ( ComplexRiemannSiegelThetaFunction θ = new ComplexRiemannSiegelThetaFunction();
          RealRiemannSiegelThetaFunction θreal = new RealRiemannSiegelThetaFunction())
    {
      var θone     = θ.evaluate(ComplexConstants.one, 128);
      var θonereal = θreal.evaluate(RealConstants.one, 128);

      assertEquals(-1.7675479528122903883, θone.re().doubleValue());
      assertEquals(-1.7675479528122903883, θonereal.doubleValue());
      assertEquals(0.0, θone.im().doubleValue());
    }
  }

  public void testRiemannSiegelThetaAtOnePlusi()
  {
    try ( ComplexRiemannSiegelThetaFunction θ = new ComplexRiemannSiegelThetaFunction())
    {
      var onePlusⅈ  = one.add(ⅈ, 128, new Complex());
      var θonePlusⅈ = θ.evaluate(onePlusⅈ, 128);
      assertEquals(-2.0425588058374755726, θonePlusⅈ.re().doubleValue());
      assertEquals(-0.86315264537612030287, θonePlusⅈ.im().doubleValue());
    }
  }

}
