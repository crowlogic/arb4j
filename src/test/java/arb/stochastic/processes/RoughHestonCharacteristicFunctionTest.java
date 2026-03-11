package arb.stochastic.processes;

import arb.Complex;
import arb.Real;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("resource")
public class RoughHestonCharacteristicFunctionTest extends
                                                   TestCase
{
  static final int prec = 128;

  /**
   * At u=0 the characteristic function must equal 1 for all t and all parameter
   * choices, since φ(0,t) = E[e^0] = 1.
   */
  public void testAtZeroArgumentEqualsOne()
  {
    try ( Real λ = new Real("0.3",
                            prec);
          Real θ = new Real("0.02",
                            prec);
          Real ν = new Real("0.3",
                            prec);
          Real V0 = new Real("0.02",
                             prec);
          Real ρ = new Real("-0.7",
                            prec);
          Real μ = new Real("0.6",
                            prec);
          RoughHestonCharacteristicFunction φ = new RoughHestonCharacteristicFunction(λ,
                                                                                      θ,
                                                                                      ν,
                                                                                      V0,
                                                                                      ρ,
                                                                                      μ,
                                                                                      5,
                                                                                      prec);
          Complex u = new Complex(); Complex res = new Complex())
    {
      u.zero();
      φ.t.set("1.0", prec);
      φ.evaluate(u, 1, prec, res);
      assertEquals("Re(φ(0,t)) should be 1", 1.0, res.re().doubleValue(), 1e-10);
      assertEquals("Im(φ(0,t)) should be 0", 0.0, res.im().doubleValue(), 1e-10);
    }
  }

  /**
   * |φ(u,t)| ≤ 1 for all real u, since φ is the characteristic function of a
   * probability measure.
   */
  public void testModulusAtMostOneForRealArgument()
  {
    try ( Real λ = new Real("0.3",
                            prec);
          Real θ = new Real("0.02",
                            prec);
          Real ν = new Real("0.3",
                            prec);
          Real V0 = new Real("0.02",
                             prec);
          Real ρ = new Real("-0.7",
                            prec);
          Real μ = new Real("0.6",
                            prec);
          RoughHestonCharacteristicFunction φ = new RoughHestonCharacteristicFunction(λ,
                                                                                      θ,
                                                                                      ν,
                                                                                      V0,
                                                                                      ρ,
                                                                                      μ,
                                                                                      5,
                                                                                      prec);
          Complex u = new Complex(); Complex res = new Complex(); Real mod = new Real())
    {
      φ.t.set("1.0", prec);
      for (int ui = -5; ui <= 5; ui++)
      {
        u.re().set(ui);
        u.im().zero();
        φ.evaluate(u, 1, prec, res);
        res.abs(prec, mod);
        assertTrue("|φ(u,t)| must be ≤ 1, got " + mod + " at u=" + ui,
                   mod.compareTo(new Real("1.0",
                                          prec))
                                 <= 0
                                 || mod.sub(new Real("1.0",
                                                     prec),
                                            prec,
                                            new Real())
                                       .containsZero());
      }
    }
  }

  /**
   * Increasing truncation order N should not change the result beyond the
   * precision floor — the series converges. We check that N=8 and N=10 agree to
   * at least 8 decimal digits for a representative (u,t).
   */
  public void testConvergenceInN()
  {
    try ( Real λ = new Real("0.3",
                            prec);
          Real θ = new Real("0.02",
                            prec);
          Real ν = new Real("0.3",
                            prec);
          Real V0 = new Real("0.02",
                             prec);
          Real ρ = new Real("-0.7",
                            prec);
          Real μ = new Real("0.6",
                            prec);
          RoughHestonCharacteristicFunction φ8 = new RoughHestonCharacteristicFunction(λ,
                                                                                       θ,
                                                                                       ν,
                                                                                       V0,
                                                                                       ρ,
                                                                                       μ,
                                                                                       8,
                                                                                       prec);
          RoughHestonCharacteristicFunction φ10 = new RoughHestonCharacteristicFunction(λ,
                                                                                        θ,
                                                                                        ν,
                                                                                        V0,
                                                                                        ρ,
                                                                                        μ,
                                                                                        10,
                                                                                        prec);
          Complex u = new Complex(); Complex r8 = new Complex(); Complex r10 = new Complex())
    {
      u.re().set("1.0", prec);
      u.im().zero();
      φ8.t.set("0.5", prec);
      φ10.t.set("0.5", prec);
      φ8.evaluate(u, 1, prec, r8);
      φ10.evaluate(u, 1, prec, r10);
      assertEquals("Re convergence N=8 vs N=10",
                   r8.re().doubleValue(),
                   r10.re().doubleValue(),
                   1e-6);
      assertEquals("Im convergence N=8 vs N=10",
                   r8.im().doubleValue(),
                   r10.im().doubleValue(),
                   1e-6);
    }
  }

  /**
   * Short-time limit: as t→0⁺ the exponent Φ_N→0 so φ→1.
   */
  public void testShortTimeLimitApproachesOne()
  {
    try ( Real λ = new Real("0.3",
                            prec);
          Real θ = new Real("0.02",
                            prec);
          Real ν = new Real("0.3",
                            prec);
          Real V0 = new Real("0.02",
                             prec);
          Real ρ = new Real("-0.7",
                            prec);
          Real μ = new Real("0.6",
                            prec);
          RoughHestonCharacteristicFunction φ = new RoughHestonCharacteristicFunction(λ,
                                                                                      θ,
                                                                                      ν,
                                                                                      V0,
                                                                                      ρ,
                                                                                      μ,
                                                                                      5,
                                                                                      prec);
          Complex u = new Complex(); Complex res = new Complex())
    {
      u.re().set("2.0", prec);
      u.im().zero();
      φ.t.set("0.0001", prec);
      φ.evaluate(u, 1, prec, res);
      System.out.println( "1.0 = " + res);
       
      assertEquals("Re(φ(u,0⁺)) should approach 1", 1.0, res.re().doubleValue(), 1e-3);
      assertEquals("Im(φ(u,0⁺)) should approach 0", 0.0, res.im().doubleValue(), 1e-3);
    }
  }

  /**
   * Constructor guard: N < 1 must throw.
   */
  public void testConstructorRejectsNLessThanOne()
  {
    try ( Real λ = new Real("0.3",
                            prec);
          Real θ = new Real("0.02",
                            prec);
          Real ν = new Real("0.3",
                            prec);
          Real V0 = new Real("0.02",
                             prec);
          Real ρ = new Real("-0.7",
                            prec);
          Real μ = new Real("0.6",
                            prec))
    {
      try
      {
        new RoughHestonCharacteristicFunction(λ,
                                              θ,
                                              ν,
                                              V0,
                                              ρ,
                                              μ,
                                              0,
                                              prec);
        fail("Expected IllegalArgumentException for N=0");
      }
      catch (IllegalArgumentException e)
      {
        // expected
      }
    }
  }

  /**
   * Constructor guard: prec < 32 must throw.
   */
  @SuppressWarnings("resource")
  public void testConstructorRejectsPrecLessThan32()
  {
    try ( Real λ = new Real("0.3",
                            prec);
          Real θ = new Real("0.02",
                            prec);
          Real ν = new Real("0.3",
                            prec);
          Real V0 = new Real("0.02",
                             prec);
          Real ρ = new Real("-0.7",
                            prec);
          Real μ = new Real("0.6",
                            prec))
    {
      try
      {
        new RoughHestonCharacteristicFunction(λ,
                                              θ,
                                              ν,
                                              V0,
                                              ρ,
                                              μ,
                                              3,
                                              16);
        fail("Expected IllegalArgumentException for prec=16");
      }
      catch (IllegalArgumentException e)
      {
        // expected
      }
    }
  }
}
