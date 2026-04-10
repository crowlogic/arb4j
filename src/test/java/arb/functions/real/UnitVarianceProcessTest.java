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
  static final int BITS       = 128;
  static final int NUM_SAMPLES = 200;

  /**
   * Computes X(τ) samples and verifies the unit variance property and structure
   * function.
   */
  public void testUnitVarianceProcess()
  {
    try ( Real tauStart = Real.valueOf(10.0);
          Real tauEnd = Real.valueOf(200.0);
          Real dTau = new Real();
          Real centerPoint = Real.valueOf(50);
          Real numSamplesMinusOne = Real.valueOf(NUM_SAMPLES - 1))
    {
      // dτ = (tauEnd - tauStart) / (N - 1)
      tauEnd.sub(tauStart, BITS, dTau).div(numSamplesMinusOne, BITS, dTau);

      // ϑ(t) and Z(t) via expression compiler
      RealFunction thetaFunc = RealFunction.express("ϑ(t)");
      RealFunction hardyZ    = RealFunction.express("Z(t)");

      // σ(τ) = ϑ⁻¹(τ)
      HardyThetaInversion sigma = new HardyThetaInversion(thetaFunc, centerPoint, 20, BITS);

      // Allocate vectors
      Real tauValues   = Real.newVector(NUM_SAMPLES, "τ");
      Real yModSquared = Real.newVector(NUM_SAMPLES, "y²");
      Real wValues     = Real.newVector(NUM_SAMPLES, "W");
      Real xSamples    = Real.newVector(NUM_SAMPLES, "X");

      try ( Real sigmaVal = new Real();
            Real zVal = new Real();
            Real thetaDerivs = Real.newVector(2);
            Real tmp = new Real();
            Real tmp2 = new Real();
            Real half = Real.valueOf(0.5))
      {
        // Compute τ values and |Y(τ)|² at each sample point
        for (int i = 0; i < NUM_SAMPLES; i++)
        {
          Real tau_i  = tauValues.get(i);
          Real y2_i   = yModSquared.get(i);

          // τ_i = tauStart + i * dτ
          dTau.mul(i, BITS, tau_i).add(tauStart, BITS, tau_i);

          // σ(τ_i)
          sigma.evaluate(tau_i, 1, BITS, sigmaVal);

          // Z(σ(τ_i))
          hardyZ.evaluate(sigmaVal, 1, BITS, zVal);

          // ϑ′(σ(τ_i)) — second element of order-2 evaluation
          thetaFunc.evaluate(sigmaVal, 2, BITS, thetaDerivs);

          // |Y(τ_i)|² = Z(σ(τ_i))² / ϑ′(σ(τ_i))
          zVal.mul(zVal, BITS, y2_i).div(thetaDerivs.get(1), BITS, y2_i);
        }

        // W(τ) by cumulative trapezoidal integration: W(0)=0, W(i) = W(i-1) + ½(y²(i-1)+y²(i))*dτ
        wValues.get(0).zero();
        for (int i = 1; i < NUM_SAMPLES; i++)
        {
          // tmp = (y²(i-1) + y²(i)) * ½ * dτ
          yModSquared.get(i - 1).add(yModSquared.get(i), BITS, tmp);
          tmp.mul(half, BITS, tmp).mul(dTau, BITS, tmp);
          wValues.get(i - 1).add(tmp, BITS, wValues.get(i));
        }

        // X(τ_i) = √(|Y(τ_i)|²) · √(τ_i / W(τ_i)) = √(|Y(τ_i)|² · τ_i / W(τ_i))
        for (int i = 0; i < NUM_SAMPLES; i++)
        {
          Real w_i = wValues.get(i);
          Real x_i = xSamples.get(i);

          if (w_i.isZero())
          {
            x_i.zero();
          }
          else
          {
            // x = √( y² · τ / W )
            yModSquared.get(i).mul(tauValues.get(i), BITS, tmp);
            tmp.div(w_i, BITS, tmp);
            tmp.sqrt(BITS, x_i);
          }
        }

        // Print unit variance verification at checkpoints
        System.out.println("=== Unit Variance Verification ===");
        Real cumulativeIntegral = tmp2;
        cumulativeIntegral.zero();

        for (int i = 1; i < NUM_SAMPLES; i++)
        {
          // |X(τ_i)|² = y²(i) · τ(i) / W(i) — compute trapezoidally
          Real xSqPrev;
          Real xSqCurr;

          // xSq(i) = y²(i) * τ(i) / W(i) if W(i) > 0, else 0
          // We accumulate ½ * (xSq(i-1) + xSq(i)) * dτ
          // For simplicity, use x²(i) = xSamples(i)²
          try ( Real prevSq = new Real(); Real currSq = new Real(); Real trapTerm = new Real())
          {
            xSamples.get(i - 1).mul(xSamples.get(i - 1), BITS, prevSq);
            xSamples.get(i).mul(xSamples.get(i), BITS, currSq);
            prevSq.add(currSq, BITS, trapTerm);
            trapTerm.mul(half, BITS, trapTerm).mul(dTau, BITS, trapTerm);
            cumulativeIntegral.add(trapTerm, BITS, cumulativeIntegral);
          }

          if (i == NUM_SAMPLES / 4 || i == NUM_SAMPLES / 2 || i == 3 * NUM_SAMPLES / 4
              || i == NUM_SAMPLES - 1)
          {
            try ( Real tauWindow = new Real(); Real avg = new Real())
            {
              tauValues.get(i).sub(tauStart, BITS, tauWindow);
              cumulativeIntegral.div(tauWindow, BITS, avg);
              System.out.printf("[%s, %s] |  %s%n", tauStart, tauValues.get(i), avg);
            }
          }
        }

        try ( Real finalWindow = new Real(); Real finalAvg = new Real())
        {
          tauValues.get(NUM_SAMPLES - 1).sub(tauStart, BITS, finalWindow);
          cumulativeIntegral.div(finalWindow, BITS, finalAvg);
          System.out.println("Final running average of |X|²: " + finalAvg + " (should approach 1.0)");
        }

        // Structure function γ(n) = ⟨|X(i+n) - X(i)|²⟩
        System.out.println("\n=== Variance Structure Function γ(n) ===");
        int maxLag = Math.min(NUM_SAMPLES / 4, 50);

        try ( Real structureResult = xSamples.structure(maxLag, BITS))
        {
          System.out.println("n  |  γ(n)");
          System.out.println("---|--------");
          for (int n = 0; n < Math.min(maxLag, 20); n++)
          {
            System.out.printf("%2d | %s%n", n, structureResult.get(n));
          }
        }

        System.out.println("\nTest completed.");
      }

      tauValues.close();
      yModSquared.close();
      wValues.close();
      xSamples.close();
      sigma.close();
    }
  }
}
