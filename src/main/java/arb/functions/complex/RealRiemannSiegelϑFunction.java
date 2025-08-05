package arb.functions.complex;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.RealLine;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * The Riemann-Siegel ϑ function  defined by 
 * 
 * ϑ(t) = arg(Γ(¼ + it/2)) - t*log(π)/2
 * 
 * plays a crucial role in the study of the {@link RiemannζFunction}. The almost-periodic 
 * behavior after t~=20 and the crossing near the first Riemann zero  are noteworthy. The 
 * real part of e^{iϑ(t)} (which involves the cosine  component of the complex 
 * exponential) can be written as:
 *  
 *  Re(e^{iϑ(t)}) = cos(ϑ(t))
 * 
 * When cos(ϑ(t))=0, ϑ(t) crosses the axis of the {@link RealLine}. These crossings are 
 * interesting because they align closely with the non-trivial zeros of the Riemann zeta 
 * function, which are critical to the Riemann Hypothesis.
 *
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRiemannSiegelϑFunction implements
                                    RealFunction
{
   
  public static final RealFunction ϑ = RealFunction.express("ϑ:t->im(lnΓ(1/4+I*t/2))-(log(π)/2)*t");

  public RealRiemannSiegelϑFunction()
  {
  }

  @Override
  public Real
         evaluate(Real t,
                  int order,
                  int bits,
                  Real res)
  {
    return ϑ.evaluate(t, order, bits, res);
  }

}
