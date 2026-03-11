package arb.stochastic.processes;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.utensils.Utensils;

/**
 * Rough Heston characteristic function φ(u,t) = exp(Φ_N(u,t)) via the truncated
 * Puiseux series of the fractional Riccati–Volterra equation
 *
 * <pre>
 *   D^μ h(t) = c₀(u) + c₁(u)·h(t) + c₂·h(t)²,   h(0)=0,   μ = H + ½ ∈ (½,1)
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unused")
public class RoughHestonCharacteristicFunction implements
                                               ComplexFunction,
                                               AutoCloseable
{
  public final Real                     λ;
  public final Real                     θ;
  public final Real                     ν;
  public final Real                     V0;
  public final Real                     ρ;
  public final Real                     μ;
  public final int                      N;
  public final int                      prec;

  private final ComplexFunction         c0;
  private final ComplexFunction         c1;
  private final ComplexFunction         c2;
  private final ComplexFunctionSequence a;
  private final ComplexFunctionSequence Φ;
  private final ComplexFunction         φ;

  @SuppressWarnings("resource")
  public RoughHestonCharacteristicFunction(Real λ, Real θ, Real ν, Real V0, Real ρ, Real μ, int N, int prec)
  {
    if (N < 1)
      throw new IllegalArgumentException("N must be ≥ 1");
    if (prec < 32)
      throw new IllegalArgumentException("prec must be ≥ 32");

    this.prec = prec;
    this.N    = N;
    this.λ    = λ.setName("λ");
    this.θ    = θ.setName("θ");
    this.ν    = ν.setName("ν");
    this.V0   = V0.setName("V0");
    this.ρ    = ρ.setName("ρ");
    this.μ    = μ.setName("μ");

    Integer NInt    = new Integer(N,
                                  "N");

    Context context = new Context(this.λ,
                                  this.θ,
                                  this.ν,
                                  this.V0,
                                  this.ρ,
                                  this.μ,
                                  NInt);

    c0 = ComplexFunction.express("c0:u➔½⋅(-u²-ⅈ⋅u)", context);
    c1 = ComplexFunction.express("c1:u➔λ⋅(ⅈ⋅u⋅ρ⋅ν-1)", context);
    c2 = ComplexFunction.express("c2:u➔½⋅ν²", context);

    // declare a prototype since recursion is busted for multivar functions
    // presently (but not for long)
    ComplexFunctionSequence.express("a:k->u->0", context);

    a =
      ComplexFunctionSequence.express("a:k➔u➔when(k=1,c0(u)/Γ(μ+1),else,Γ((k-1)⋅μ+1)/Γ(k⋅μ+1)⋅(c1(u)⋅a(k-1)(u)+c2(u)⋅Σa(j)(u)⋅a(k-1-j)(u){j=1…k-2}))", context);
    Φ = ComplexFunctionSequence.express("Φ:k➔u➔a(k)(u)⋅(θ⋅λ⋅u^(k⋅μ+1)/(k⋅μ+1)+V0⋅Γ(k⋅μ+1)/Γ((k-1)⋅μ+2)⋅u^((k-1)⋅μ+1))", context);
    φ = ComplexFunction.express("φ:u➔exp(ΣΦ(k)(u){k=1…N})", context);
  }

  @Override
  public Complex evaluate(Complex uVal, int order, int bits, Complex res)
  {
    return φ.evaluate(uVal, order, bits, res);
  }

  @Override
  public void close()
  {
    Utensils.close(λ);
    Utensils.close(θ);
    Utensils.close(ν);
    Utensils.close(V0);
    Utensils.close(ρ);
    Utensils.close(μ);
  }
}
