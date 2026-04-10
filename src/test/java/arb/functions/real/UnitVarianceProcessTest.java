package arb.functions.real;

import arb.Real;
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
 * Since |Z(t)|² = |ζ(1/2+it)|², and Z(t) is real-valued, we use:
 *   |Y(τ)|² = Z(σ(τ))² / ϑ′(σ(τ))
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
    int    numSamples = 200;
    double tauStart   = 10.0;
    double tauEnd     = 200.0;
    double dTau       = (tauEnd - tauStart) / (numSamples - 1);

    // ϑ(t) and Z(t) via expression compiler
    RealFunction thetaFunc  = RealFunction.express("ϑ(t)");
    RealFunction hardyZ     = RealFunction.express("Z(t)");

    // σ(τ) = ϑ⁻¹(τ) via HardyThetaInversion
    try ( Real centerPoint = Real.valueOf(50))
    {
      HardyThetaInversion sigma = new HardyThetaInversion(thetaFunc,
                                                           centerPoint,
                                                           20,
                                                           BITS);

      double[] tauValues   = new double[numSamples];
      double[] yModSquared = new double[numSamples]; // |Y(τ)|²
      double[] wValues     = new double[numSamples]; // W(τ) cumulative integral

      try ( Real tauReal = new Real();
            Real sigmaVal = new Real();
            Real zVal = new Real();
            Real thetaDerivs = Real.newVector(2))
      {
        System.out.println("Computing Y(τ) samples...");

        for (int i = 0; i < numSamples; i++)
        {
          double tau = tauStart + i * dTau;
          tauValues[i] = tau;

          // σ(τ) = ϑ⁻¹(τ)
          tauReal.set(tau);
          sigma.evaluate(tauReal, 1, BITS, sigmaVal);

          // Z(σ(τ)) — Hardy Z function is real, |Z(t)|² = |ζ(1/2+it)|²
          hardyZ.evaluate(sigmaVal, 1, BITS, zVal);
          double z = zVal.doubleValue();

          // ϑ′(σ(τ)) — evaluate theta to order 2 to get derivative
          thetaFunc.evaluate(sigmaVal, 2, BITS, thetaDerivs);
          double thetaPrime = thetaDerivs.get(1).doubleValue();

          // |Y(τ)|² = Z(σ(τ))² / ϑ′(σ(τ))
          yModSquared[i] = (z * z) / thetaPrime;

          if (i < 5)
          {
            System.out.printf("  τ=%.2f σ=%.4f Z=%.6f ϑ′=%.6f |Y|²=%.6f%n",
                              tau, sigmaVal.doubleValue(), z, thetaPrime, yModSquared[i]);
          }
        }

        // W(τ) by cumulative trapezoidal integration
        System.out.println("Computing W(τ)...");
        wValues[0] = 0.0;
        for (int i = 1; i < numSamples; i++)
        {
          wValues[i] = wValues[i - 1] + 0.5 * (yModSquared[i - 1] + yModSquared[i]) * dTau;
        }

        // Compute |X(τ)|² = |Y(τ)|² · τ / W(τ) and running average
        System.out.println("\n=== Unit Variance Verification ===");
        System.out.println("τ window     |  (1/τ₀)∫|X|²dτ");
        System.out.println("-------------|----------------");

        Real xSamples = Real.newVector(numSamples, "X");
        double cumulativeIntegral = 0.0;

        for (int i = 0; i < numSamples; i++)
        {
          double xSq;
          if (wValues[i] > 0)
          {
            xSq = yModSquared[i] * tauValues[i] / wValues[i];
            xSamples.get(i).set(Math.sqrt(yModSquared[i]) * Math.sqrt(tauValues[i] / wValues[i]));
          }
          else
          {
            xSq = 0.0;
            xSamples.get(i).set(0.0);
          }

          if (i > 0)
          {
            double prevXSq = (wValues[i-1] > 0) ? yModSquared[i-1] * tauValues[i-1] / wValues[i-1] : 0;
            cumulativeIntegral += 0.5 * (prevXSq + xSq) * dTau;
          }

          // Print at checkpoints
          if (i == numSamples/4 || i == numSamples/2 || i == 3*numSamples/4 || i == numSamples-1)
          {
            double tauWindow = tauValues[i] - tauStart;
            if (tauWindow > 0)
            {
              System.out.printf("[%.1f, %.1f] |  %.6f%n", tauStart, tauValues[i], cumulativeIntegral / tauWindow);
            }
          }
        }

        double finalTauWindow = tauValues[numSamples - 1] - tauStart;
        double finalAverage   = cumulativeIntegral / finalTauWindow;
        System.out.printf("%nFinal running average of |X|²: %.6f (should approach 1.0)%n", finalAverage);

        assertEquals("Unit variance property: (1/τ₀)∫|X|²dτ ≈ 1", 1.0, finalAverage, 0.3);

        // Structure function γ(n) = ⟨|X(i+n) - X(i)|²⟩
        System.out.println("\n=== Variance Structure Function γ(n) ===");
        int maxLag = Math.min(numSamples / 4, 50);

        try (Real structureResult = xSamples.structure(maxLag, BITS))
        {
          System.out.println("n  |  γ(n)");
          System.out.println("---|--------");
          for (int n = 0; n < Math.min(maxLag, 20); n++)
          {
            System.out.printf("%2d | %.6f%n", n, structureResult.get(n).doubleValue());
          }

          assertEquals("γ(0) = 0", 0.0, structureResult.get(0).doubleValue(), 1e-10);

          for (int n = 1; n < Math.min(maxLag, 10); n++)
          {
            assertTrue("γ(" + n + ") should be positive", structureResult.get(n).doubleValue() > 0);
          }
        }

        System.out.println("\nTest completed successfully.");
        xSamples.close();
      }

      sigma.close();
    }
  }
}
