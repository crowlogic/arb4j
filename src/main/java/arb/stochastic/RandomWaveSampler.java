package arb.stochastic;

import static java.lang.Math.PI;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

import arb.FloatInterval;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.nodes.unary.BesselFunctionNodeOfTheFirstKind;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;
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
 * {@link Type1ChebyshevPolynomials}
 * 
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RandomWaveSampler extends
                               StationaryGaussianProcessSampler
{

  /**
   * Sample the {@link BesselFunctionNodeOfTheFirstKind} of order 0, here used as
   * {@link Real#J0(int, Real)}
   * 
   * FIXME: Use {@link FloatInterval} and
   * {@link RealFunction#quantize(FloatInterval, int, int, boolean)}
   * 
   * @param values
   * @param times
   */
  public void getKernel(double[] times, double[] values)
  {
    assert times.length == values.length;
    int numPoints = times.length;

    try ( Real val = new Real())
    {
      for (int i = 0; i < numPoints; i++)
      {
        times[i]  = i * dt;
        values[i] = val.set(2 * Math.PI * times[i]).J0(128, val).doubleValue();
      }
    }
  }

  /**
   * The Fourier transform of J_0(x) over -inf to inf is 1/sqrt(1-lambda^2) when
   * |lambda|<1 and 0 when |lambda|>=1 which happens to be the
   * {@link OrthogonalPolynomialSequence#orthogonalityMeasure()} of the
   * {@link Type1ChebyshevPolynomials}
   */
  @Override
  public double[] getPowerSpectralDensity(double[] freq)
  {
    double[] psd = new double[freq.length];

    for (int i = 0; i < freq.length; i++)
    {
      psd[i] = Math.abs(freq[i]) < 1.0 ? 1.0 / (PI * sqrt(1 - pow(freq[i], 2))) : 0;
    }
    return psd;
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
