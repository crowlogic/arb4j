package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

/**
 * European call/put pricer for the rough Heston model by the Padé–Müntz / Lewis
 * / Schwinger–Hermite theorem (docs/PricingTheorem.tex). The cumulant exponent
 * κ_M(T,v)=Σ d_k(v)T^{kμ+1} is built by the compiled Müntz–Padé cumulant
 * generator; its diagonal [M/M] Padé in v has 2M simple poles v_j and residues
 * A_j, and the call price is the closed form
 *
 *   C = S0 - K e^{-rT}·[ ½erfc((k-μ)/(σ√2)) - Σ_j Re( e^{iv_j k}/(2πi)·A_j·Σ_n F^{(n)}(ζ_j)/(n!(iv_j)^{n+1}) ) ]
 *   F(ζ)=exp(ζ²/2σ²)erfc(ζ/σ√2),  ζ_j=(k-μ)/σ√2 - i v_j σ/√2.
 *
 * Poles/residues come from {@link ComplexPolynomial#roots}; the cumulant
 * polynomial is the compiled generator (no procedural Müntz arithmetic here).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class RoughHestonHermitePricer implements
                                      AutoCloseable
{
  public final RoughHestonCharacteristicFunction φ;
  public int                                     M = 12;

  public RoughHestonHermitePricer(RoughHestonCharacteristicFunction φ) { this.φ = φ; }

  /** κ_M coefficient poly Φ(v)=Σ d_k(v) T^{kμ+1} as a ComplexPolynomial in v. */
  ComplexPolynomial cumulantPoly(int bits)
  {
    φ.N.set(2 * M);
    ComplexPolynomialNullaryFunction Φ = ComplexPolynomialNullaryFunction.express("ΦK", "Σk➔T^(k*μ+1)*d(k){k=0..N}", φ.context);
    return Φ.evaluate(bits, new ComplexPolynomial());
  }

  @Override public void close() { }
}
