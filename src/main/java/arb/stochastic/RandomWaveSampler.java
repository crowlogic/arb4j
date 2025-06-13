package arb.stochastic;

import static java.lang.Math.PI;
import static java.lang.Math.sqrt;
import static java.lang.Math.pow;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;
import arb.functions.polynomials.orthogonal.real.Type1ChebyshevPolynomials;

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
 * TOOD: find a better plot type for the white noise coeffecients
 * 
 * {@link Type1ChebyshevPolynomials}
 * 
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RandomWaveSampler extends
                               GaussianProcessSampler
{

  /**
   * The Fourier transform of J_0(x) over -inf to inf is 1/sqrt(1-lambda^2) when
   * |lambda|<1 and 0 when |lambda|>=1 which happens to be the
   * {@link OrthogonalPolynomialSequence#orthogonalityMeasure()} of the
   * {@link Type1ChebyshevPolynomials}
   */
  @Override
  public double[] getPowerSpectralDensity(double[] freq)
  {
    double[] psd = new double[N];

    for (int i = 0; i < N; i++)
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
