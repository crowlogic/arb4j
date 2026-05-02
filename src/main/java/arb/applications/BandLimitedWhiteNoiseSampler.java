package arb.applications;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * Generates and plots a pseudo-randomly generated path and associated spectra
 * of the stationary Gaussian process whose kernel is
 * K(t-s)=sinc(2π(t-s))=sin(2*π*(t-s))/(2*π*(t-s)) the unit band-limited
 * reproducing kernel whose spectral density is the rectangular function
 * rect(t,s)=1/2*(Θ(|t-s|-1)+Θ(|t-s|+1)) where Θ is the Heaviside StepFunction,
 * which is 1 on the signed unit interval where |t-s|<1 and 0 when |t-s|>=1 *
 * 
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BandLimitedWhiteNoiseSampler extends
                                          StationaryGaussianProcessSampler
{

  private static final FloatInterval support = new FloatInterval(FloatConstants.negOne,
                                                                 FloatConstants.one);

  @Override
  protected FloatInterval getSpectralSupport()
  {
    return support;
  }

  /**
   * The sinc kernel
   */
  public RealFunction kernel = RealFunction.express("sin(t*2*π)/(t*2*π)");

  @Override
  public RealFunction getKernel()
  {
    return kernel;
  }

  @Override
  public void getKernel(Real times, Real values)
  {
    assert times.size() == values.size();
    int numPoints = times.size();

    for (int i = 0; i < numPoints; i++)
    {
      double t = i * dt;
      times.get(i).set(t);
      values.get(i).set(t == 0 ? 1.0 : kernel.eval(t));
    }
  }

  @Override
  public Real getPowerSpectralDensity(Real freq)
  {
    Real psd = Real.newVector(freq.size());
    for (int i = 0; i < freq.size(); i++)
    {
      double f = freq.get(i).doubleValue();
      psd.get(i).set(Math.abs(f) <= 1.0 ? 1.0 : 0.0);
    }
    return psd;
  }

  public static void main(String[] args)
  {
    launch(args);
  }

}
