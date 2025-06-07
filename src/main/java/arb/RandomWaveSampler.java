package arb;

import java.util.Random;

import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.ColormapSelector;
import io.fair_acc.chartfx.plugins.DataPointTooltip;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.Screenshot;
import io.fair_acc.chartfx.plugins.TableViewer;
import io.fair_acc.chartfx.plugins.Zoomer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

/**
 * FIXME: empirical PSD is far too large
 */
public class RandomWaveSampler extends
                               Application
{
  private static final double L            = 500.0;
  private static final double STEP_SIZE    = 0.01;
  private static final int    N            = (int) (L / STEP_SIZE);
  private static final double LAGS_TO_SHOW = 20.0;
  private final Random        random       = new Random();
  static final int            bits         = 128;

  public static class SpectralResult
  {
    public final double[] path, pathQuad, envelope, t, freq, psd;
    public Complex        whiteNoise;

    public SpectralResult(double[] path,
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

  private SpectralResult generatePathSpectral()
  {
    double[] freq = generateFrequencies(N, STEP_SIZE);
    double   df   = 1.0 / (N * STEP_SIZE);
    double[] psd  = new double[N];

    for (int i = 0; i < N; i++)
    {
      psd[i] = Math.abs(freq[i]) < 1.0 ? 1.0 / (Math.PI * Math.sqrt(1.0 - freq[i] * freq[i])) : 0.0;
    }

    Complex complexSignal = Complex.newVector(N);
    Complex whiteNoise    = Complex.newVector(N);

    // double[] whiteNoiseReal = new double[N], whiteNoiseImag = new double[N];
    complexSignal.get(0).zero();

    int nyquistIdx = N / 2;
    for (int k = 1; k < nyquistIdx; k++)
    {
      double mag       = Math.sqrt(psd[k] * df);
      double noiseReal = random.nextGaussian();
      double noiseImag = random.nextGaussian();
      var    element   = whiteNoise.get(k);
      element.re().set(noiseReal);
      element.im().set(noiseImag);

      Complex scaled = complexSignal.get(k);
      scaled.getReal().set(mag * noiseReal / Math.sqrt(2.0));
      scaled.getImag().set(mag * noiseImag / Math.sqrt(2.0));

      Complex scaledConjugate = complexSignal.get(N - k);
      scaledConjugate.getReal().set(scaled.getReal().doubleValue());
      scaledConjugate.getImag().set(-scaled.getImag().doubleValue());
    }

    if (N % 2 == 0)
    {
      double dW      = random.nextGaussian();
      var    element = whiteNoise.get(nyquistIdx);
      element.re().set(dW);
      element.im().zero();

      Complex scaled = complexSignal.get(nyquistIdx);
      scaled.getReal().set(Math.sqrt(psd[nyquistIdx] * df) * dW);
      scaled.getImag().zero();
    }

    Complex ifft = Complex.newVector(N);
    arblib.acb_dft_inverse(ifft, complexSignal, N, bits);

    // Apply scaling using proper Complex multiplication
    try ( Real scaleFactor = Real.valueOf(N))
    {
      ifft.mul(scaleFactor, bits);    
    }

    double[] path = new double[N], pathQuad = new double[N], envelope = new double[N];
    for (int i = 0; i < N; i++)
    {
      path[i]     = ifft.get(i).getReal().doubleValue();
      pathQuad[i] = ifft.get(i).getImag().doubleValue();
      envelope[i] = Math.sqrt(path[i] * path[i] + pathQuad[i] * pathQuad[i]);
    }

    double[] t = new double[N];
    for (int i = 0; i < N; i++)
      t[i] = i * STEP_SIZE;

    return new SpectralResult(path,
                              pathQuad,
                              envelope,
                              t,
                              freq,
                              psd,
                              whiteNoise);
  }

  private double[] autocorrDirect(double[] x, int maxLagSteps)
  {
    int    n    = x.length;
    double mean = 0.0;
    for (double val : x)
      mean += val;
    mean /= n;

    double[] xCentered = new double[n];
    for (int i = 0; i < n; i++)
      xCentered[i] = x[i] - mean;

    double var = 0.0;
    for (double val : xCentered)
      var += val * val;
    var /= n;

    if (var < 1e-10)
      return new double[maxLagSteps];

    double[] acorr = new double[maxLagSteps];
    for (int k = 0; k < maxLagSteps; k++)
    {
      if (k == 0)
        acorr[k] = 1.0;
      else if (n - k > 0)
      {
        double cov = 0.0;
        for (int i = 0; i < n - k; i++)
          cov += xCentered[i] * xCentered[i + k];
        acorr[k] = (cov / (n - k)) / var;
      }
    }
    return acorr;
  }

  private double[] computeEmpiricalPSD(double[] path)
  {
    double mean = 0.0;
    for (double val : path)
      mean += val;
    mean /= path.length;

    Complex complexPath = Complex.newVector(N);
    for (int i = 0; i < N; i++)
    {
      complexPath.get(i).getReal().set(path[i] - mean);
      complexPath.get(i).getImag().zero();
    }

    Complex fft = Complex.newVector(N);
    arblib.acb_dft(fft, complexPath, N, bits);

    double[] periodogram = new double[N];
    for (int i = 0; i < N; i++)
    {
      double real = fft.get(i).getReal().doubleValue();
      double imag = fft.get(i).getImag().doubleValue();
      periodogram[i] = (real * real + imag * imag) / (STEP_SIZE);
    }
    return periodogram;
  }

  @Override
  public void start(Stage primaryStage)
  {
    SpectralResult result   = generatePathSpectral();
    GridPane       gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);

    // Chart 1: Time domain
    XYChart chart1 = new XYChart(new DefaultNumericAxis("Time",
                                                        ""),
                                 new DefaultNumericAxis("Value",
                                                        ""));

    chart1.setTitle("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform");

    DoubleDataSet inPhase = new DoubleDataSet("In-phase").set(result.t, result.path);
    DoubleDataSet quad    = new DoubleDataSet("Quadrature").set(result.t, result.pathQuad);
    DoubleDataSet envPos  = new DoubleDataSet("Envelope (+)").set(result.t, result.envelope);
    double[]      negEnv  = new double[N];
    for (int i = 0; i < N; i++)
      negEnv[i] = -result.envelope[i];
    DoubleDataSet envNeg = new DoubleDataSet("Envelope (–)").set(result.t, negEnv);
    chart1.getDatasets().addAll(inPhase, quad, envPos, envNeg);

    // Chart 2: Noise components
    XYChart chart2 = new XYChart(new DefaultNumericAxis("Index",
                                                        ""),
                                 new DefaultNumericAxis("Value",
                                                        ""));
    chart2.setTitle("White Noise Components");
    int      nShow   = Math.min(200, N);
    double[] indices = new double[nShow];
    for (int i = 0; i < nShow; i++)
      indices[i] = i;
    chart2.getDatasets()
          .addAll(new DoubleDataSet("Real").set(indices,
                                                java.util.Arrays.copyOf(result.whiteNoise.re().doubleValues(), nShow)),
                  new DoubleDataSet("Imag").set(indices,
                                                java.util.Arrays.copyOf(result.whiteNoise.im().doubleValues(), nShow)));

    // Chart 3: Autocorrelation
    XYChart chart3 = new XYChart(new DefaultNumericAxis("Lag",
                                                        ""),
                                 new DefaultNumericAxis("Correlation",
                                                        ""));
    chart3.setTitle("Covariance Verification");
    int      maxLag = (int) (LAGS_TO_SHOW / STEP_SIZE) + 1;
    double[] lags   = new double[maxLag];
    double[] theory = new double[maxLag];
    try ( Real val = new Real())
    {
      for (int i = 0; i < maxLag; i++)
      {
        lags[i]   = i * STEP_SIZE;
        theory[i] = val.set(2 * Math.PI * lags[i]).J0(128, val).doubleValue();
      }
    }
    chart3.getDatasets()
          .addAll(new DoubleDataSet("Empirical").set(lags, autocorrDirect(result.path, maxLag)),
                  new DoubleDataSet("Theory").set(lags, theory));
    chart3.getYAxis().setAutoRanging(false);
    chart3.getYAxis().setMin(-0.5);
    chart3.getYAxis().setMax(1.05);
    chart3.getXAxis().setAutoRanging(false);
    chart3.getXAxis().setMin(0);
    chart3.getXAxis().setMax(LAGS_TO_SHOW);

    // Chart 4: PSD
    XYChart chart4 = new XYChart(new DefaultNumericAxis("Frequency",
                                                        ""),
                                 new DefaultNumericAxis("PSD",
                                                        ""));
    chart4.setTitle("PSD Comparison");
    int      posFreqCount = N / 2 + 1;
    double[] freqPos      = new double[posFreqCount];
    double[] empPSD       = computeEmpiricalPSD(result.path);
    double[] theoryPSD    = new double[posFreqCount];
    double   df           = 1.0 / (N * STEP_SIZE);

    for (int i = 0; i < posFreqCount; i++)
    {
      freqPos[i]   = result.freq[i];
      theoryPSD[i] = result.psd[i];
    }

    chart4.getDatasets()
          .addAll(new DoubleDataSet("Empirical").set(freqPos, java.util.Arrays.copyOf(empPSD, posFreqCount)),
                  new DoubleDataSet("Theory").set(freqPos, theoryPSD));
    chart4.getXAxis().setAutoRanging(false);
    chart4.getXAxis().setMin(-1.0);
    chart4.getXAxis().setMax(1.0);

    configureChart(chart1);
    configureChart(chart2);
    configureChart(chart3);
    configureChart(chart4);

    gridPane.add(chart1, 0, 0);
    gridPane.add(chart2, 1, 0);
    gridPane.add(chart3, 0, 1);
    gridPane.add(chart4, 1, 1);

    primaryStage.setScene(new Scene(gridPane,
                                    1600,
                                    1200));
    primaryStage.show();

    WindowManager.setMoreConduciveStyle(primaryStage.getScene());

  }

  public static void main(String[] args)
  {
    launch(args);
  }

  private void configureChart(XYChart chart)
  {
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new DataPointTooltip(),
                 new Zoomer(),
                 new TableViewer(),
                 new ColormapSelector(),
                 new Screenshot());

  }
}
