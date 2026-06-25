package bonanzai.options.vix;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import arb.Real;
import arb.applications.options.RoughHestonCharacteristicFunction;

import org.junit.Test;

/**
 * Smoke test for {@link RoughHestonCharacteristicFunction#call} via the
 * Schwinger–Hermite closed form (Theorem 12 eq:CM).
 *
 * Verifies that at default configuration, the outer Aitken-Δ² M-sequence
 * converges to a finite, positive price for an ATM call.
 */
public class RoughHestonSchwingerCallSmokeTest
{
  @Test
  public void atmCallAtDefaults()
  {
    int bits = 128;
    try (RoughHestonCharacteristicFunction cf = new RoughHestonCharacteristicFunction();
         Real S0     = new Real("1.0", bits);
         Real strike = new Real("1.0", bits);
         Real rr     = new Real("0.0", bits);
         Real price  = new Real())
    {
      cf.call(S0, strike, rr, bits, price);
      assertNotNull(price);
      System.out.println("ATM call price = " + price);
      assertFalse("price must be finite", price.isInfinite());
      assertTrue("ATM call price must be > 0", price.isPositive());
      assertTrue("ATM call price must be < S0 (= 1.0)", price.compareTo(S0) < 0);
    }
  }
}
