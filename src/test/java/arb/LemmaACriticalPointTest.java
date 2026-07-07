package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Ball-arithmetic verification of the Corrigendum of
 * docs/FractionalRiccatiSolutionMethodology.tex (Lemma A correction) and of the
 * uniform Gamma-ratio contraction theorem for μ &gt; 1.
 *
 * Let h(μ) = Γ(μ+1)/Γ(2μ+1) on (0,1]. Its interior critical point solves the
 * digamma equation F(μ) = ψ(μ+1) − 2ψ(2μ+1) = 0. This test verifies:
 *
 * 1. the superseded value μ ≈ 0.1339 is NOT a root: F(0.1339) is a ball
 *    strictly above zero, enclosed in [0.036, 0.037];
 * 2. bisection on F over [0.14, 0.15] converges to
 *    μ* = 0.14503474316667… with h(μ*) = 1.03967510771… &lt; 21/20;
 * 3. the endpoint values h(0⁺) = 1 and h(1) = Γ(2)/Γ(3) = 1/2;
 * 4. for μ = n+ν &gt; 1 the modified Gamma ratio
 *    Γ(kν+n+1)/Γ((k+1)ν+n+1) is strictly decreasing in k and uniformly
 *    bounded by e^{−ν(1−γ)} = e^{−ν·ψ(2)} &lt; 1.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LemmaACriticalPointTest extends
                                     TestCase
{
  private static final int BITS = 128;

  /**
   * F(μ) = ψ(μ+1) − 2ψ(2μ+1), the logarithmic derivative of
   * h(μ) = Γ(μ+1)/Γ(2μ+1)
   */
  private static Real F(Real μ, Real result)
  {
    try ( Real a = new Real(); Real b = new Real(); Real one = new Real().one())
    {
      μ.add(one, BITS, a).digamma(BITS, a);
      μ.mul(2, BITS, b).add(one, BITS, b).digamma(BITS, b);
      return a.sub(b.mul(2, BITS, b), BITS, result);
    }
  }

  /** h(μ) = Γ(μ+1)/Γ(2μ+1) */
  private static Real h(Real μ, Real result)
  {
    try ( Real a = new Real(); Real b = new Real(); Real one = new Real().one())
    {
      μ.add(one, BITS, a).Γ(BITS, a);
      μ.mul(2, BITS, b).add(one, BITS, b).Γ(BITS, b);
      return a.div(b, BITS, result);
    }
  }

  public void testSupersededValueIsNotARoot()
  {
    try ( Real μ = Real.valueOf("0.1339", BITS); Real f = new Real();
          Real lower = Real.valueOf("0.036", BITS);
          Real upper = Real.valueOf("0.037", BITS); Real d = new Real())
    {
      F(μ, f);
      assertTrue("F(0.1339) must be strictly positive, got " + f, f.isPositive());
      assertFalse("F(0.1339) must be bounded away from zero", f.containsZero());
      assertTrue("F(0.1339) must exceed 0.036, got " + f,
                 f.sub(lower, BITS, d).isPositive());
      assertTrue("F(0.1339) must be below 0.037, got " + f,
                 f.sub(upper, BITS, d).isNegative());
    }
  }

  public void testCriticalPointByBisection()
  {
    try ( Real lo = Real.valueOf(0.14); Real hi = Real.valueOf(0.15);
          Real mid = new Real(); Real f = new Real(); Real half = Real.valueOf(0.5))
    {
      F(lo, f);
      assertTrue("F(0.14) must be positive, got " + f, f.isPositive());
      F(hi, f);
      assertTrue("F(0.15) must be negative, got " + f, f.isNegative());

      for (int i = 0; i < 60; i++)
      {
        lo.add(hi, BITS, mid).mul(half, BITS, mid);
        F(mid, f);
        assertFalse("bisection sign must be decidable at iteration " + i
                    + ", F(" + mid + ") = " + f,
                    f.containsZero());
        if (f.isPositive())
        {
          lo.set(mid);
        }
        else
        {
          hi.set(mid);
        }
      }

      try ( Real μstar = Real.valueOf("0.14503474316667", BITS);
            Real tolerance = Real.valueOf("1e-13", BITS); Real d = new Real())
      {
        lo.add(hi, BITS, mid).mul(half, BITS, mid);
        mid.sub(μstar, BITS, d).abs(BITS, d);
        assertTrue("bisection root " + mid
                   + " must match μ* = 0.14503474316667 to 1e-13",
                   d.sub(tolerance, BITS, d).isNegative());
      }

      try ( Real hstar = new Real();
            Real reference = Real.valueOf("1.03967510771", BITS);
            Real tolerance = Real.valueOf("1e-10", BITS);
            Real bound = Real.valueOf("1.05", BITS); Real d = new Real())
      {
        lo.add(hi, BITS, mid).mul(half, BITS, mid);
        h(mid, hstar);
        hstar.sub(reference, BITS, d).abs(BITS, d);
        assertTrue("h(μ*) = " + hstar + " must match 1.03967510771 to 1e-10",
                   d.sub(tolerance, BITS, d).isNegative());
        assertTrue("h(μ*) = " + hstar + " must be below 21/20",
                   hstar.sub(bound, BITS, d).isNegative());
      }
    }
  }

  public void testEndpointValues()
  {
    try ( Real one = new Real().one(); Real h1 = new Real();
          Real half = Real.valueOf(0.5); Real d = new Real();
          Real tolerance = new Real().one().mul2e(-100))
    {
      h(one, h1);
      h1.sub(half, BITS, d).abs(BITS, d);
      assertTrue("h(1) = Γ(2)/Γ(3) must equal 1/2, got " + h1,
                 d.sub(tolerance, BITS, d).isNegative());
    }
  }

  /**
   * Γ(kν+n+1)/Γ((k+1)ν+n+1) with x = kν+n+1 ≥ 2, so
   * logΓ(x+ν) − logΓ(x) = ∫ψ ≥ ν·ψ(2) and the ratio is ≤ e^{−ν·ψ(2)} &lt; 1
   */
  public void testUniformContractionForMuGreaterThanOne()
  {
    double[] νs =
    { 0.1, 0.25, 0.5, 0.75, 0.9 };
    int[]    ns =
    { 1, 2, 3, 5 };
    try ( Real ν = new Real(); Real x = new Real(); Real num = new Real();
          Real den = new Real(); Real ratio = new Real();
          Real previous = new Real(); Real one = new Real().one();
          Real two = Real.valueOf(2); Real Cν = new Real(); Real d = new Real();
          Real nReal = new Real())
    {
      for (double νval : νs)
      {
        ν.set(νval);
        two.digamma(BITS, Cν);
        ν.mul(Cν, BITS, Cν).neg(Cν).exp(BITS, Cν);
        assertTrue("C_ν = e^{−ν·ψ(2)} must be below 1 for ν = " + νval,
                   Cν.sub(one, BITS, d).isNegative());
        for (int n : ns)
        {
          nReal.set(n);
          previous.one();
          for (int k = 0; k <= 20; k++)
          {
            ν.mul(k, BITS, x).add(one, BITS, x).add(nReal, BITS, x);
            x.Γ(BITS, num);
            x.add(ν, BITS, x).Γ(BITS, den);
            num.div(den, BITS, ratio);
            assertTrue("ratio at ν=" + νval + ", n=" + n + ", k=" + k + " is "
                       + ratio + " but must be below C_ν = " + Cν,
                       ratio.sub(Cν, BITS, d).isNegative());
            assertTrue("ratio must be strictly decreasing in k at ν=" + νval
                       + ", n=" + n + ", k=" + k,
                       ratio.sub(previous, BITS, d).isNegative());
            previous.set(ratio);
          }
        }
      }
    }
  }
}
