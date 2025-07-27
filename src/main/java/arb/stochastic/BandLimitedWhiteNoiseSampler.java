package arb.stochastic;

import arb.Real;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.Type1ChebyshevPolynomials;
import arb.functions.real.RealFunction;

/**
 * Generates and plots a pseudo-randomly generated path from the Gaussian
 * process whose kernel is K(t-s)=J_0(t-s) (the random Wave model) whose
 * spectral density is the orthogonality measure of the
 * {@link Type1ChebyshevPolynomials}, then calculates its empirical
 * autocorrelation spectrum and compares it with the theoretical then does the
 * same for the power-spectral density. Also plots the white noise that was
 * convolved with the square root of the spectral factor to generate the sample
 * path.
 * 
 * 
 * 
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BandLimitedWhiteNoiseSampler extends
                                          StationaryGaussianProcessSampler 
{

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
