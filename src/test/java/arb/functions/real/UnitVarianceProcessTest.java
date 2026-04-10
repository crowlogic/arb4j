package arb.functions.real;

import arb.Complex;
import arb.Real;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.HardyThetaInversion;
import junit.framework.TestCase;

/**
 * Tests the unit-variance process X(τ) from the theorem:
 *
 * <pre>
 * Y(τ) = ζ(1/2 + iσ(τ)) / √(ϑ′(σ(τ)))
 * W(τ) = ∫₀ᵗ |Y(s)|² ds
 * X(τ) = Y(τ) · √(τ / W(τ))
 * </pre>
 *
 * where σ = ϑ⁻¹ is the inverse of the Riemann-Siegel theta function.
 *
 * The theorem states: lim_{τ₀→∞} (1/τ₀) ∫₀^{τ₀} |X(τ)|² dτ = 1
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne
 */
public class UnitVarianceProcessTest extends TestCase
{
  static final int BITS = 128;

  /**
   * Computes X(τ) samples and verifies the unit variance property and structure
   * function.
   */
  public void testUnitVarianceProcess()
  {
    int    numSamples = 2000;
    double tauStart   = 10.0;
    double tauEnd     = 500.0;
    double dTau       = (tauEnd - tauStart) / (numSamples - 1);

    // ϑ(t) via expression compiler
    RealFunction thetaFunc = RealFunction.express("ϑ(t)");

    // ζ(1/2+it) via expression compiler
    RealToComplexFunction zetaCritLine = RealToComplexFunction.express("ζ(½+I*t)");

    // ϑ′(t) via expression compiler (derivative of theta)
    RealFunction thetaPrime = RealFunction.express("diff(ϑ(t),t)");

    // σ(τ) = ϑ⁻¹(τ) via HardyThetaInversion centered at t=50
    // This inverts the theta function using Taylor series reversal
    Real         centerPoint = Real.valueOf(50);
    HardyThetaInversion sigma      = new HardyThetaInversion(thetaFunc,
                                                             centerPoint,
                                                             20,
                                                             BITS);

    // Storage for Y values and intermediate results
    double[] tauValues   = new double[numSamples];
    double[] yModSquared = new double[numSamples]; // |Y(τ)|²
    double[] wValues     = new double[numSamples]; // W(τ) cumulative integral
    double[] xValues     = new double[numSamples]; // X(τ) values

    Real    tauReal   = new Real();
    Real    sigmaVal  = new Real();
    Complex zetaVal   = new Complex();
    Real    thetaPVal = new Real();
    Real    normVal   = new Real();

    System.out.println("Computing Y(τ) samples...");

    for (int i = 0; i < numSamples; i++)
    {
      double tau = tauStart + i * dTau;
      tauValues[i] = tau;

      // Compute σ(τ) = ϑ⁻¹(τ)
      tauReal.set(tau);
      sigma.evaluate(tauReal, 1, BITS, sigmaVal);
      double sigmaD = sigmaVal.doubleValue();

      // Compute ζ(1/2 + iσ(τ))
      zetaCritLine.evaluate(sigmaVal, 1, BITS, zetaVal);

      // Compute |ζ(1/2 + iσ(τ))|²
      zetaVal.norm(BITS, normVal);
      double zetaNorm  = normVal.doubleValue();
      double zetaNorm2 = zetaNorm * zetaNorm;

      // Compute ϑ′(σ(τ))
      thetaPrime.evaluate(sigmaVal, 1, BITS, thetaPVal);
      double thetaPrimeD = thetaPVal.doubleValue();

      // |Y(τ)|² = |ζ(1/2 + iσ(τ))|² / ϑ′(σ(τ))
      yModSquared[i] = zetaNorm2 / thetaPrimeD;
    }

    // Compute W(τ) by cumulative trapezoidal integration
    System.out.println("Computing W(τ) by trapezoidal integration...");
    wValues[0] = 0.0;
    for (int i = 1; i < numSamples; i++)
    {
      wValues[i] = wValues[i - 1] + 0.5 * (yModSquared[i - 1] + yModSquared[i]) * dTau;
    }

    // Compute X(τ) = Y(τ) · √(τ / W(τ))
    // Since |X(τ)|² = |Y(τ)|² · τ / W(τ), we store |X(τ)|² for the variance check
    // and the signed X values for the structure function
    System.out.println("Computing X(τ) samples...");
    Real xSamples = Real.newVector(numSamples, "X");
    for (int i = 0; i < numSamples; i++)
    {
      if (wValues[i] > 0)
      {
        // X(τ) = sign(Re(Y)) · |Y| · √(τ / W(τ))
        // For structure function, we use the real-valued version
        double yAbs    = Math.sqrt(yModSquared[i]);
        double scaling = Math.sqrt(tauValues[i] / wValues[i]);
        xValues[i] = yAbs * scaling;
        xSamples.get(i).set(xValues[i]);
      }
      else
      {
        xValues[i] = 0.0;
        xSamples.get(i).set(0.0);
      }
    }

    // Verify unit variance property: (1/τ₀) ∫₀^{τ₀} |X(τ)|² dτ ≈ 1
    System.out.println("\n=== Unit Variance Verification ===");
    System.out.println("τ window    |  (1/τ₀)∫|X|²dτ");
    System.out.println("------------|----------------");

    double cumulativeIntegral = 0.0;
    int    checkpoints[]      =
    { numSamples / 4, numSamples / 2, 3 * numSamples / 4, numSamples - 1 };

    for (int i = 1; i < numSamples; i++)
    {
      double xSq1 = yModSquared[i - 1] * tauValues[i - 1] / Math.max(wValues[i - 1], 1e-30);
      double xSq2 = yModSquared[i] * tauValues[i] / Math.max(wValues[i], 1e-30);
      cumulativeIntegral += 0.5 * (xSq1 + xSq2) * dTau;

      for (int cp : checkpoints)
      {
        if (i == cp)
        {
          double tauWindow = tauValues[i] - tauStart;
          double average   = cumulativeIntegral / tauWindow;
          System.out.printf("[%.1f, %.1f] |  %.6f%n", tauStart, tauValues[i], average);
        }
      }
    }

    double finalTauWindow = tauValues[numSamples - 1] - tauStart;
    double finalAverage   = cumulativeIntegral / finalTauWindow;
    System.out.printf("%nFinal running average of |X|²: %.6f (should approach 1.0)%n", finalAverage);

    // The average should be close to 1.0 (within tolerance for finite samples)
    assertEquals("Unit variance property: (1/τ₀)∫|X|²dτ ≈ 1", 1.0, finalAverage, 0.3);

    // Compute and display structure function γ(n) = ⟨|X(i+n) - X(i)|²⟩
    System.out.println("\n=== Variance Structure Function γ(n) ===");
    int maxLag = Math.min(numSamples / 4, 100);

    try (Real structureResult = xSamples.structure(maxLag, BITS))
    {
      System.out.println("n  |  γ(n)");
      System.out.println("---|--------");
      for (int n = 0; n < Math.min(maxLag, 20); n++)
      {
        System.out.printf("%2d | %.6f%n", n, structureResult.get(n).doubleValue());
      }

      // γ(0) should be 0 by definition
      assertEquals("γ(0) = 0", 0.0, structureResult.get(0).doubleValue(), 1e-10);

      // γ(n) should be positive and generally increasing for small n
      for (int n = 1; n < Math.min(maxLag, 10); n++)
      {
        assertTrue("γ(" + n + ") should be positive", structureResult.get(n).doubleValue() > 0);
      }
    }

    System.out.println("\nTest completed successfully.");

    centerPoint.close();
    sigma.close();
    tauReal.close();
    sigmaVal.close();
    zetaVal.close();
    thetaPVal.close();
    normVal.close();
    xSamples.close();
  }
}
