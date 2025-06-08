package arb.stochastic;

import java.util.Random;

import arb.arblib;
import arb.Complex;
import arb.Real;

public abstract class GaussianProcessSampler extends
                                             AbstractGaussianProcessSampler
{

  protected final Random random = new Random();

  public Spectra generate()
  {
    double[] freq = generateFrequencies(N, STEP_SIZE);
    double[] psd  = getPowerSpectralDensity(freq);

    try ( Complex complexSignal = Complex.newVector(N); Complex whiteNoise = Complex.newVector(N);
          Real mag = new Real(); Complex ifft = Complex.newVector(N); Real env = new Real())
    {
      complexSignal.get(0).zero();

      int    nyquistIndex = N / 2;
      double df           = 1.0 / (N * STEP_SIZE);

      for (int k = 1; k < nyquistIndex; k++)
      {
        mag.set(psd[k] * df).sqrt(bits);
        var element = whiteNoise.get(k);
        element.re().set(random.nextGaussian());
        element.im().set(random.nextGaussian());
        complexSignal.get(k).set(element).mul(mag, bits);
      }

      if (N % 2 == 0)
      {
        double dW = random.nextGaussian();
        whiteNoise.get(nyquistIndex).set(dW);
        complexSignal.get(nyquistIndex).set(Math.sqrt(psd[nyquistIndex] * df) * dW);
      }

      arblib.acb_dft_inverse(ifft, complexSignal, N, bits);

      ifft.mul(N, bits);

      double[] path = new double[N], pathQuad = new double[N], envelope = new double[N];

      for (int i = 0; i < N; i++)
      {
        Complex element = ifft.get(i);
        path[i]     = element.re().doubleValue();
        pathQuad[i] = element.im().doubleValue();
        envelope[i] = element.norm(bits, env).doubleValue();
      }

      double[] t = new double[N];
      for (int i = 0; i < N; i++)
      {
        t[i] = i * STEP_SIZE;
      }

      return new Spectra(path,
                         pathQuad,
                         envelope,
                         t,
                         freq,
                         psd,
                         whiteNoise);

    }
  }

  public abstract double[] getPowerSpectralDensity(double[] freq);

}