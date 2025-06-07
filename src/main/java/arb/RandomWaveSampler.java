package arb;

import java.util.Arrays;
import java.util.Random;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.real.Type1ChebyshevPolynomials;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

/**
 * Generates and plots a pseudo-randomly generated path from the Gaussian
 * process whose kernel is K(t-s)=J_0(t-s) (the random Wave model) whose
 * spectral density is the orthogonality measure of the, then calculates its
 * empirical autocorrelation spectrum and compares it with the theoretical then
 * does the same for the power-spectral density. Also plots the white noise that
 * was convolved with the square root of the spectral factor to generate the
 * sample path.
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

  public static class Spectra
  {
    public final double[] path, pathQuad, envelope, t, freq, psd;
    public Complex        whiteNoise;

    public Spectra(double[] path,
                   double[] pathQuad,
                   double[] envelope,
                   double[] t,
                   double[] freq,
                   double[] psd,
                   Complex whiteNoise)
    {
      this.path       = path;
      this.pathQuad   = pathQuad;
      this.envelope   = envelope;
      this.t          = t;
      this.freq       = freq;
      this.psd        = psd;
      this.whiteNoise = whiteNoise;
    }
  }

  private double[] generateFrequencies(int nPoints, double dt)
  {
    double[] freq = new double[nPoints];
    double   df   = 1.0 / (nPoints * dt);
    for (int i = 0; i < nPoints; i++)
    {
      freq[i] = i <= nPoints / 2 ? i * df : (i - nPoints) * df;
    }
    return freq;
  }

  private Spectra generatePathSpectral()
  {
    double[] freq = generateFrequencies(N, STEP_SIZE);
    double   df   = 1.0 / (N * STEP_SIZE);
    double[] psd  = new double[N];

    for (int i = 0; i < N; i++)
    {
      psd[i] = Math.abs(freq[i]) < 1.0 ? 1.0 / (Math.PI * Math.sqrt(1.0 - freq[i] * freq[i])) : 0.0;
    }

    try ( Complex complexSignal = Complex.newVector(N); Complex whiteNoise = Complex.newVector(N);
          Real mag = new Real(); Complex ifft = Complex.newVector(N); Real env = new Real())
    {
      complexSignal.get(0).zero();

      int nyquistIdx = N / 2;

      for (int k = 1; k < nyquistIdx; k++)
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
        whiteNoise.get(nyquistIdx).set(dW);
        complexSignal.get(nyquistIdx).set(Math.sqrt(psd[nyquistIdx] * df) * dW);
      }

      arblib.acb_dft_inverse(ifft, complexSignal, N, bits);

      ifft.mul(N, bits);

      double[] path = new double[N], pathQuad = new double[N], envelope = new double[N];

      for (int i = 0; i < N; i++)
      {
        path[i]     = ifft.get(i).re().doubleValue();
        pathQuad[i] = ifft.get(i).im().doubleValue();
        envelope[i] = ifft.get(i).norm(bits, env).doubleValue();
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

  protected double[] autocorr(double[] x, int maxLagSteps)
  {
    int      n         = x.length;
    double   mean      = Arrays.stream(x).average().getAsDouble();

    double[] xCentered = new double[n];
    for (int i = 0; i < n; i++)
    {
      xCentered[i] = x[i] - mean;
    }

    double var = 0.0;
    for (double val : xCentered)
    {
      var += val * val;
    }
    var /= n;

    if (var < 1e-10)
    {
      return new double[maxLagSteps];
    }

    double[] acorr = new double[maxLagSteps];
    for (int k = 0; k < maxLagSteps; k++)
    {
      if (k == 0)
      {
        acorr[k] = 1.0;
      }
      else if (n - k > 0)
      {
        double cov = 0.0;
        for (int i = 0; i < n - k; i++)
        {
          cov += xCentered[i] * xCentered[i + k];
        }
        acorr[k] = (cov / (n - k)) / var;
      }
    }
    return acorr;
  }

  protected double[] computeEmpiricalPSD(double[] path)
  {
    double mean = Arrays.stream(path).average().getAsDouble();

    try ( Complex complexPath = Complex.newVector(N); Complex fft = Complex.newVector(N);)
    {
      // complexPath.sub(mean,bits);
      for (int i = 0; i < N; i++)
      {
        complexPath.get(i).set(path[i] - mean);
      }

      arblib.acb_dft(fft, complexPath, N, bits);

      double[] periodogram   = new double[N];
      double   scalingFactor = STEP_SIZE / N;
      for (int i = 0; i < N; i++)
      {
        Complex element = fft.get(i);
        double  real    = element.re().doubleValue();
        double  imag    = element.im().doubleValue();
        periodogram[i] = (real * real + imag * imag) * scalingFactor;
      }
      return periodogram;
    }
  }

  private boolean separateWindows = false;

  @Override
  public void start(Stage primaryStage)
  {
    Spectra   result = generatePathSpectral();
    XYChart[] charts =
    { newTimeDomainChart(result), newNoiseChart(result), newAutocorrelationChart(result),
      newPowerSpectralDensityChart(result) };

    separateWindows = getParameters().getUnnamed().contains("--separate-windows");

    if (separateWindows)
    {
      Stage[]  stages =
      { primaryStage, new Stage(), new Stage(), new Stage() };
      String[] titles =
      { "Time Domain Analysis", "Noise Components", "Autocorrelation", "Power Spectral Density" };

      for (int i = 0; i < charts.length; i++)
      {
        configureChart(charts[i]);
        Scene scene = new Scene(charts[i]);
        stages[i].setScene(scene);
        stages[i].setTitle(titles[i]);
        stages[i].setMaximized(true);
        WindowManager.setMoreConduciveStyle(scene);
        if (i > 0)
        {
          stages[i].show();
        }
      }
      primaryStage.show();
    }
    else
    {
      GridPane gridPane = createGridPane(charts);
      Scene    scene    = new Scene(gridPane);
      primaryStage.setScene(scene);
      primaryStage.setMaximized(true);
      primaryStage.show();
      // WindowManager.setMoreConduciveStyle(scene);
    }
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
