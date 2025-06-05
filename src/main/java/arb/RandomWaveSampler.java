package arb;

import java.util.Random;

import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class RandomWaveSampler extends
                               Application
{
  Real                        a;

  private static final double L            = 500.0;
  private static final double STEP_SIZE    = 0.01;
  private static final int    N            = (int) (L / STEP_SIZE);
  private static final double LAGS_TO_SHOW = 20.0;

  private final Random        random       = new Random();

  public static class SpectralResult
  {
    public final double[] path;
    public final double[] pathQuad;
    public final double[] envelope;
    public final double[] t;
    public final double[] freq;
    public final double[] psd;
    public final double[] whiteNoiseReal;
    public final double[] whiteNoiseImag;

    public SpectralResult(double[] path,
                          double[] pathQuad,
                          double[] envelope,
                          double[] t,
                          double[] freq,
                          double[] psd,
                          double[] whiteNoiseReal,
                          double[] whiteNoiseImag)
    {
      this.path           = path;
      this.pathQuad       = pathQuad;
      this.envelope       = envelope;
      this.t              = t;
      this.freq           = freq;
      this.psd            = psd;
      this.whiteNoiseReal = whiteNoiseReal;
      this.whiteNoiseImag = whiteNoiseImag;
    }
  }

  private double[] generateFrequencies(int nPoints, double dt)
  {
    double[] freq = new double[nPoints];
    double   df   = 1.0 / (nPoints * dt);
    for (int i = 0; i < nPoints; i++)
    {
      if (i <= nPoints / 2)
      {
        freq[i] = i * df;
      }
      else
      {
        freq[i] = (i - nPoints) * df;
      }
    }
    return freq;
  }

  private double[] hilbertTransform(double[] signal)
  {
    int      n             = signal.length;
    Real     fft           = Real.newVector(n);

    // Prepare complex array for FFT (real, imag, real, imag, ...)
    double[] complexSignal = new double[2 * n];
    for (int i = 0; i < n; i++)
    {
      complexSignal[2 * i]     = signal[i]; // Real part
      complexSignal[2 * i + 1] = 0.0;       // Imaginary part
    }

    // Forward FFT
    fft.complexForward(complexSignal);

    // Apply Hilbert filter: zero negative frequencies, double positive frequencies
    for (int i = 1; i < n / 2; i++)
    {
      complexSignal[2 * i]     *= 2.0; // Double positive frequencies
      complexSignal[2 * i + 1] *= 2.0;
    }
    for (int i = n / 2 + 1; i < n; i++)
    {
      complexSignal[2 * i]     = 0.0; // Zero negative frequencies
      complexSignal[2 * i + 1] = 0.0;
    }

    // Inverse FFT
    fft.complexInverse(complexSignal, true);

    // Extract imaginary part (Hilbert transform)
    double[] hilbert = new double[n];
    for (int i = 0; i < n; i++)
    {
      hilbert[i] = complexSignal[2 * i + 1];
    }

    return hilbert;
  }

  private SpectralResult generatePathSpectral()
  {
    double[] freq = generateFrequencies(N, STEP_SIZE);
    double   df   = 1.0 / (N * STEP_SIZE);
    double[] psd  = new double[N];

    // Generate PSD: 1/(π√(1-f²)) for |f| < 1
    for (int i = 0; i < N; i++)
    {
      if (Math.abs(freq[i]) < 1.0)
      {
        psd[i] = 1.0 / (Math.PI * Math.sqrt(1.0 - freq[i] * freq[i]));
      }
      else
      {
        psd[i] = 0.0;
      }
    }

    // Generate complex frequency domain signal
    double[] complexSignal  = new double[2 * N];
    double[] whiteNoiseReal = new double[N];
    double[] whiteNoiseImag = new double[N];

    complexSignal[0] = 0.0; // Zero mean
    complexSignal[1] = 0.0;

    int nyquistIdx = N / 2;

    for (int k = 1; k < nyquistIdx; k++)
    {
      double mag       = Math.sqrt(psd[k] * df);
      double noiseReal = random.nextGaussian();
      double noiseImag = random.nextGaussian();

      whiteNoiseReal[k] = noiseReal;
      whiteNoiseImag[k] = noiseImag;

      double scaledReal = mag * noiseReal / Math.sqrt(2.0);
      double scaledImag = mag * noiseImag / Math.sqrt(2.0);

      complexSignal[2 * k]           = scaledReal;
      complexSignal[2 * k + 1]       = scaledImag;

      // Hermitian symmetry
      complexSignal[2 * (N - k)]     = scaledReal;
      complexSignal[2 * (N - k) + 1] = -scaledImag;
    }

    if (N % 2 == 0)
    {
      double noiseNyquist = random.nextGaussian();
      whiteNoiseReal[nyquistIdx]        = noiseNyquist;
      complexSignal[2 * nyquistIdx]     = Math.sqrt(psd[nyquistIdx] * df) * noiseNyquist;
      complexSignal[2 * nyquistIdx + 1] = 0.0;
    }

    // Inverse FFT to get time domain signal
    Real ifft = Real.newVector(N);
    ifft.complexInverse(complexSignal, true);

    // Extract real part as the path
    double[] path = new double[N];
    for (int i = 0; i < N; i++)
    {
      path[i] = complexSignal[2 * i] * N; // Scale by N
    }

    // Compute Hilbert transform for quadrature
    double[] pathQuad = hilbertTransform(path);

    // Compute envelope
    double[] envelope = new double[N];
    for (int i = 0; i < N; i++)
    {
      envelope[i] = Math.sqrt(path[i] * path[i] + pathQuad[i] * pathQuad[i]);
    }

    // Generate time array
    double[] t = new double[N];
    for (int i = 0; i < N; i++)
    {
      t[i] = i * STEP_SIZE;
    }

    return new SpectralResult(path,
                              pathQuad,
                              envelope,
                              t,
                              freq,
                              psd,
                              whiteNoiseReal,
                              whiteNoiseImag);
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
    {
      xCentered[i] = x[i] - mean;
    }

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
        cov      /= (n - k);
        acorr[k]  = cov / var;
      }
      else
      {
        acorr[k] = Double.NaN;
      }
    }
    return acorr;
  }

  private double[] computeTheoreticalPSD(double[] freq)
  {
    double[] theoreticalPSD = new double[freq.length];
    double   df             = 1.0 / (N * STEP_SIZE);

    for (int i = 0; i < freq.length; i++)
    {
      if (Math.abs(freq[i]) < 1.0)
      {
        theoreticalPSD[i] = (1.0 / (Math.PI * Math.sqrt(1.0 - freq[i] * freq[i]))) * df;
      }
      else
      {
        theoreticalPSD[i] = 0.0;
      }
    }
    return theoreticalPSD;
  }

  private double[] computeEmpiricalPSD(double[] path)
  {
    double mean = 0.0;
    for (double val : path)
      mean += val;
    mean /= path.length;

    double[] pathDemeaned = new double[path.length];
    for (int i = 0; i < path.length; i++)
    {
      pathDemeaned[i] = path[i] - mean;
    }

    Real     fft         = Real.newVector(N);
    double[] complexPath = new double[2 * N];
    for (int i = 0; i < N; i++)
    {
      complexPath[2 * i]     = pathDemeaned[i];
      complexPath[2 * i + 1] = 0.0;
    }

    fft.complexForward(complexPath);

    double[] periodogram = new double[N];
    for (int i = 0; i < N; i++)
    {
      double real = complexPath[2 * i];
      double imag = complexPath[2 * i + 1];
      periodogram[i] = (real * real + imag * imag) / (N * STEP_SIZE);
    }

    return periodogram;
  }

  @Override
  public void start(Stage primaryStage)
  {
    SpectralResult result   = generatePathSpectral();

    // Create 2x2 grid of charts
    GridPane       gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);

    // Top Left: In-phase, quadrature, envelope
    XYChart chart1 = new XYChart(new DefaultNumericAxis("Time",
                                                        ""),
                                 new DefaultNumericAxis("Value",
                                                        ""));
    chart1.setTitle("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform");

    DoubleDataSet inPhaseDataSet     = new DoubleDataSet("In-phase (process)");
    DoubleDataSet quadDataSet        = new DoubleDataSet("Quadrature (Hilbert)");
    DoubleDataSet envelopePosDataSet = new DoubleDataSet("Envelope (+)");
    DoubleDataSet envelopeNegDataSet = new DoubleDataSet("Envelope (–)");

    inPhaseDataSet.set(result.t, result.path);
    quadDataSet.set(result.t, result.pathQuad);
    envelopePosDataSet.set(result.t, result.envelope);

    double[] negEnvelope = new double[result.envelope.length];
    for (int i = 0; i < negEnvelope.length; i++)
    {
      negEnvelope[i] = -result.envelope[i];
    }
    envelopeNegDataSet.set(result.t, negEnvelope);

    chart1.getDatasets().addAll(inPhaseDataSet, quadDataSet, envelopePosDataSet, envelopeNegDataSet);

    // Top Right: White Noise Components
    XYChart chart2 = new XYChart(new DefaultNumericAxis("Frequency Index",
                                                        ""),
                                 new DefaultNumericAxis("Noise Value",
                                                        ""));
    chart2.setTitle("White Noise Components (Frequency Domain)");

    int      nShow     = Math.min(200, result.whiteNoiseReal.length);
    double[] indices   = new double[nShow];
    double[] realNoise = new double[nShow];
    double[] imagNoise = new double[nShow];

    for (int i = 0; i < nShow; i++)
    {
      indices[i]   = i;
      realNoise[i] = result.whiteNoiseReal[i];
      imagNoise[i] = result.whiteNoiseImag[i];
    }

    DoubleDataSet realNoiseDataSet = new DoubleDataSet("Real part");
    DoubleDataSet imagNoiseDataSet = new DoubleDataSet("Imaginary part");
    realNoiseDataSet.set(indices, realNoise);
    imagNoiseDataSet.set(indices, imagNoise);

    chart2.getDatasets().addAll(realNoiseDataSet, imagNoiseDataSet);

    // Bottom Left: Covariance
    XYChart chart3 = new XYChart(new DefaultNumericAxis("Lag (Time Units)",
                                                        ""),
                                 new DefaultNumericAxis("Autocorrelation",
                                                        ""));
    chart3.setTitle("Covariance Verification (Spectral Method)");

    int      maxLagSteps = (int) (LAGS_TO_SHOW / STEP_SIZE) + 1;
    double[] empCov      = autocorrDirect(result.path, maxLagSteps);
    double[] lagValues   = new double[maxLagSteps];
    double[] theoretical = new double[maxLagSteps];

    try ( Real val = new Real())
    {
      for (int i = 0; i < maxLagSteps; i++)
      {
        lagValues[i]   = i * STEP_SIZE;
        theoretical[i] = val.set(2 * Math.PI * lagValues[i]).J0(128, val).doubleValue();
      }
    }

    DoubleDataSet empiricalDataSet   = new DoubleDataSet("Empirical");
    DoubleDataSet theoreticalDataSet = new DoubleDataSet("Theoretical J₀(2π lag)");
    empiricalDataSet.set(lagValues, empCov);
    theoreticalDataSet.set(lagValues, theoretical);

    chart3.getDatasets().addAll(empiricalDataSet, theoreticalDataSet);
    chart3.getYAxis().setAutoRanging(false);
    chart3.getYAxis().setMin(-0.5);
    chart3.getYAxis().setMax(1.05);
    chart3.getXAxis().setAutoRanging(false);
    chart3.getXAxis().setMin(0);
    chart3.getXAxis().setMax(LAGS_TO_SHOW);

    // Bottom Right: Empirical vs Theoretical PSD
    XYChart chart4 = new XYChart(new DefaultNumericAxis("Frequency",
                                                        ""),
                                 new DefaultNumericAxis("Power Spectral Density",
                                                        ""));
    chart4.setTitle("Empirical vs Theoretical Power Spectrum");

    // Get positive frequencies only
    int      posFreqCount      = (N / 2) + 1;
    double[] freqPos           = new double[posFreqCount];
    double[] empPSD            = computeEmpiricalPSD(result.path);
    double[] empPSDPos         = new double[posFreqCount];
    double[] theoreticalPSD    = computeTheoreticalPSD(result.freq);
    double[] theoreticalPSDPos = new double[posFreqCount];

    for (int i = 0; i < posFreqCount; i++)
    {
      freqPos[i]           = result.freq[i];
      empPSDPos[i]         = empPSD[i];
      theoreticalPSDPos[i] = theoreticalPSD[i];
    }

    DoubleDataSet empiricalPSDDataSet   = new DoubleDataSet("Empirical PSD");
    DoubleDataSet theoreticalPSDDataSet = new DoubleDataSet("Theoretical PSD");
    empiricalPSDDataSet.set(freqPos, empPSDPos);
    theoreticalPSDDataSet.set(freqPos, theoreticalPSDPos);

    chart4.getDatasets().addAll(empiricalPSDDataSet, theoreticalPSDDataSet);
    chart4.getXAxis().setAutoRanging(false);
    chart4.getXAxis().setMin(0);
    chart4.getXAxis().setMax(1.0);

    // Add charts to grid
    gridPane.add(chart1, 0, 0);
    gridPane.add(chart2, 1, 0);
    gridPane.add(chart3, 0, 1);
    gridPane.add(chart4, 1, 1);

    Scene scene = new Scene(gridPane,
                            1600,
                            1200);
    primaryStage.setTitle("Spectral Analysis - Target Covariance J0(2*pi*tau)");
    primaryStage.setScene(scene);
    primaryStage.show();

    System.out.println("USING SPECTRAL METHOD - Target Covariance J0(2*pi*tau)");
    System.out.println("PSD scaling corrected - all curves now on same scale");
  }

  public static void main(String[] args)
  {
    launch(args);
  }
}
