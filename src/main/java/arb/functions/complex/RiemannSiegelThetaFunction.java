package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.utensils.ShellFunctions;

/**
 * <pre>
 * The Riemann-Siegel ϑ function  defined by 
 * 
 * ϑ(t) = arg(Γ(¼+it/2))-t*log(π)/2
 * 
 * plays a crucial role in the study of the {@link RiemannζFunction} and the definition of 
 * the {@link HardyZFunction}.  The complex exponential of ϑ(t) can be written as
 *  
 *  e^(i⋅ϑ(t)) = cos(ϑ(t)) + i⋅sin(ϑ(t))
 * 
 * by appling Euler's identity. It cancels the phase oscillations of the {@link RiemannζFunction} on
 * the critical line such that the {@link HardyZFunction} 
 * 
 * Z(t)=e^(i⋅ϑ(t))*ζ(½+i⋅t)
 * 
 * is {@link Real}-valued for {@link Real} arguments t.
 *
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiemannSiegelThetaFunction implements
                                        ComplexFunction
{
  
  public static final ComplexFunction θ =
                                        ComplexFunction.express("θ:t->(-ⅈ*(ln⁡Γ(¼+ⅈ*t/2)-lnΓ(¼−ⅈ*t/2))−ln⁡(π)*t)/2");

  public RiemannSiegelThetaFunction()
  {
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    return θ.evaluate(t, order, bits, res);
  }

}
