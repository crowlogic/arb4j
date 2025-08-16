package arb.stochastic;

import arb.FloatConstants;
import arb.FloatInterval;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * Generates and plots a pseudo-randomly generated path and associated spectra
 * of the Gaussian process whose kernel is
 * K(t-s)=sinc(2π(t-s))=sin(2*π*(t-s))/(2*π*(t-s)) the unit band-limited
 * reproducing kernel whose spectral density is the rectangular function
 * rect(t,s)=1/2*(Θ(|t-s|-1)+Θ(|t-s|+1)) which is 1 on the signed unit interval
 * where |t-s|<1 and 0 when |t-s|>=1 *
 * 
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BandLimitedWhiteNoiseSampler extends
                                          StationaryGaussianProcessSampler
{

  @Override
  protected FloatInterval getSpectralSupport()
  {
    return new FloatInterval(FloatConstants.negOne,
                             FloatConstants.one);
  }

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
  public double[] getPowerSpectralDensity(double[] freq)
  {
    double[] psd = new double[freq.length];

    for (int i = 0; i < freq.length; i++)
    {
      psd[i] = Math.abs(freq[i]) <= 1.0 ? 1.0 : 0;
    }
    return psd;
  }

  public static void main(String[] args)
  {
    launch(args);
  }

}
