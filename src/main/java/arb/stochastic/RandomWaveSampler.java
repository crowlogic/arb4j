package arb.stochastic;

import static java.lang.Math.PI;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.Type1ChebyshevPolynomials;

/**
 * Random wave model implementation - now focuses only on process-specific
 * logic. Inherits orthogonal process functionality from base classes.
 * 
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne terms of the
 *      {@link TheArb4jLibrary}
 */
public class RandomWaveSampler extends
                               StationaryGaussianProcessSampler
{

  /**
   * Process-specific power spectral density implementation. The Fourier transform
   * of J_0(x) over -inf to inf is 1/sqrt(1-lambda^2) when |lambda|<1 and 0 when
   * |lambda|>=1 which happens to be the orthogonality measure of the
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

  @Override
  public void getKernel(int maxLag, double[] lags, double[] theory)
  {
    try ( Real val = new Real())
    {
      for (int i = 0; i < maxLag; i++)
      {
        lags[i]   = i * STEP_SIZE;
        theory[i] = val.set(2 * Math.PI * lags[i]).J0(128, val).doubleValue();
      }
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}