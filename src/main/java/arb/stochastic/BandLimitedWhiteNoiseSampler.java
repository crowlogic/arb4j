package arb.stochastic;

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

  public void getKernel(double[] times, double[] values)
  {
    assert times.length == values.length;
    int numPoints = times.length;

    try ( Real val = new Real())
    {
      for (int i = 0; i < numPoints; i++)
      {
        var t = times[i] = i * dt;
        values[i] = t == 0 ? 1 : kernel.eval(t);
      }
    }
  }

  @Override
  public Real getPowerSpectralDensity(Real freq, Real psd)
  {
    assert psd.size() == freq.size() : String.format("psd.size = %d != freq.size = %d",
                                                     psd.size(),
                                                     freq.size());

    for (int i = 0; i < freq.size(); i++)
    {
      double fi = freq.get(i).doubleValue();
      psd.get(i).set(Math.abs(freq.get(i).doubleValue()) <= 1.0 ? 1.0 : 0);
    }
    return psd;
  }

  public static void main(String[] args)
  {
    launch(args);
  }

}
