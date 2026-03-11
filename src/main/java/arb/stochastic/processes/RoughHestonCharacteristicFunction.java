package arb.stochastic.processes;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.utensils.Utensils;

/**
 * Rough Heston characteristic function φ(u,t) = exp(Φ_N(u,t)) via the truncated
 * Puiseux series of the fractional Riccati–Volterra equation
 *
 * <pre>
 *   D^μ h(t) = c₀(u) + c₁(u)·h(t) + c₂·h(t)²,   h(0)=0,   μ = H + ½ ∈ (½,1)
 * </pre>
 *
 * Puiseux coefficients aₖ(u), k = 1…N:
 *
 * <pre>
 *   a₁     = c₀ / Γ(μ+1)
 *   a_{k+1} = Γ(kμ+1)/Γ((k+1)μ+1) · ( c₁·aₖ + c₂·Σ_{j=1}^{k-1} aⱼ·a_{k-j} )
 * </pre>
 *
 * Log-characteristic-function exponent:
 *
 * <pre>
 *   Φ_N(u,t) = Σ_{k=1}^N aₖ(u) · [ θλ·t^{kμ+1}/(kμ+1)
 *                                    + V0·Γ(kμ+1)/Γ((k-1)μ+2)·t^{(k-1)μ+1} ]
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonCharacteristicFunction implements
                                               ComplexFunction,
                                               AutoCloseable
{
  public final Real                    λ;
  public final Real                    θ;
  public final Real                    ν;
  public final Real                    V0;
  public final Real                    ρ;
  public final Real                    μ;
  public final Integer                 N;
  public final int                     prec;

  public final Complex                 u;
  public final Real                    t;
  public final Complex                 a;
  public final Integer                 k;
  public final Integer                 j;
  public final Complex                 c0;
  public final Complex                 c1;
  public final Complex                 c2;
  public final Complex                 ak;
  public final Complex                 aj;
  public final Complex                 akj;
  public final Complex                 convAcc;
  public final Complex                 convTerm;
  public final Complex                 gammaRatio;
  public final Complex                 phiGammaRatio;
  public final Complex                 phiTerm;
  public final Complex                 PhiN;

  private final ComplexNullaryFunction c0Func;
  private final ComplexNullaryFunction c1Func;
  private final ComplexNullaryFunction c2Func;
  private final ComplexNullaryFunction gammaRatioFunc;
  private final ComplexNullaryFunction phiGammaRatioFunc;
  private final ComplexNullaryFunction convTermFunc;
  private final ComplexNullaryFunction phiTermFunc;
  private final ComplexNullaryFunction expPhiNFunc;

  /**
   * @param λ    mean-reversion speed
   * @param θ    long-run variance
   * @param ν    vol-of-vol
   * @param V0   initial variance
   * @param ρ    correlation
   * @param μ    H + ½
   * @param N    truncation order ≥ 1
   * @param prec bit-precision ≥ 32
   */
  @SuppressWarnings("resource")
  public RoughHestonCharacteristicFunction(Real λ, Real θ, Real ν, Real V0, Real ρ, Real μ, int N, int prec)
  {
    if (N < 1)
      throw new IllegalArgumentException("N must be ≥ 1");
    if (prec < 32)
      throw new IllegalArgumentException("prec must be ≥ 32");

    this.prec     = prec;
    this.λ        = λ.setName("λ");
    this.θ        = θ.setName("θ");
    this.ν        = ν.setName("ν");
    this.V0       = V0.setName("V0");
    this.ρ        = ρ.setName("ρ");
    this.μ        = μ.setName("μ");
    this.N        = new Integer(N,
                                "N");
    this.k        = new Integer(1,
                                "k");
    this.j        = new Integer(1,
                                "j");

    u             = new Complex().setName("u");
    t             = new Real().setName("t");
    a             = Complex.newVector(N).setName("a");
    c0            = new Complex().setName("c0");
    c1            = new Complex().setName("c1");
    c2            = new Complex().setName("c2");
    ak            = new Complex().setName("ak");
    aj            = new Complex().setName("aj");
    akj           = new Complex().setName("akj");
    convAcc       = new Complex().setName("convAcc");
    convTerm      = new Complex().setName("convTerm");
    gammaRatio    = new Complex().setName("gammaRatio");
    phiGammaRatio = new Complex().setName("phiGammaRatio");
    phiTerm       = new Complex().setName("phiTerm");
    PhiN          = new Complex().setName("PhiN");

    Context ctx = new Context(this.λ,
                              this.θ,
                              this.ν,
                              this.V0,
                              this.ρ,
                              this.μ,
                              this.N,
                              this.k,
                              this.j,
                              u,
                              t,
                              a,
                              c0,
                              c1,
                              c2,
                              ak,
                              aj,
                              akj,
                              convAcc,
                              convTerm,
                              gammaRatio,
                              phiGammaRatio,
                              phiTerm,
                              PhiN);

    c0Func            = ComplexNullaryFunction.express("c0Func:½⋅(-u²-ⅈ⋅u)", ctx);
    c1Func            = ComplexNullaryFunction.express("c1Func:λ⋅(ⅈ⋅u⋅ρ⋅ν-1)", ctx);
    c2Func            = ComplexNullaryFunction.express("c2Func:½⋅ν²", ctx);
    gammaRatioFunc    = ComplexNullaryFunction.express("gammaRatioFunc:Γ(k⋅μ+1)/Γ((k+1)⋅μ+1)", ctx);
    phiGammaRatioFunc = ComplexNullaryFunction.express("phiGammaRatioFunc:Γ(k⋅μ+1)/Γ((k-1)⋅μ+2)", ctx);
    convTermFunc      = ComplexNullaryFunction.express("convTermFunc:c2⋅aj⋅akj", ctx);
    phiTermFunc       = ComplexNullaryFunction.express("phiTermFunc:ak⋅(θ⋅λ⋅t^(k⋅μ+1)/(k⋅μ+1)+V0⋅phiGammaRatio⋅t^((k-1)⋅μ+1))", ctx);
    expPhiNFunc       = ComplexNullaryFunction.express("expPhiNFunc:exp(PhiN)", ctx);
  }

  @Override
  public Complex evaluate(Complex uVal, int order, int bits, Complex res)
  {
    u.set(uVal);

    c0Func.evaluate(null, order, bits, c0);
    c1Func.evaluate(null, order, bits, c1);
    c2Func.evaluate(null, order, bits, c2);

    int Nval = N.getSignedValue();

    k.set(1);
    try ( Complex gmu1 = new Complex())
    {
      μ.add(1, bits, gmu1.re());
      gmu1.im().zero();
      gmu1.re().Γ(bits, gmu1.re());
      c0.div(gmu1, bits, a.get(0));
    }

    for (int ki = 2; ki <= Nval; ki++)
    {
      k.set(ki);
      gammaRatioFunc.evaluate(null, order, bits, gammaRatio);

      convAcc.zero();
      for (int ji = 1; ji <= ki - 1; ji++)
      {
        j.set(ji);
        aj.set(a.get(ji - 1));
        akj.set(a.get(ki - ji - 1));
        convTermFunc.evaluate(null, order, bits, convTerm);
        convAcc.add(convTerm, bits, convAcc);
      }

      c1.mul(a.get(ki - 2), bits, ak);
      ak.add(convAcc, bits, ak);
      gammaRatio.mul(ak, bits, a.get(ki - 1));
    }

    PhiN.zero();
    for (int ki = 1; ki <= Nval; ki++)
    {
      k.set(ki);
      ak.set(a.get(ki - 1));
      phiGammaRatioFunc.evaluate(null, order, bits, phiGammaRatio);
      phiTermFunc.evaluate(null, order, bits, phiTerm);
      PhiN.add(phiTerm, bits, PhiN);
    }

    return expPhiNFunc.evaluate(null, order, bits, res);
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
    Utensils.close(N);
    Utensils.close(k);
    Utensils.close(j);
    Utensils.close(u);
    Utensils.close(t);
    Utensils.close(a);
    Utensils.close(c0);
    Utensils.close(c1);
    Utensils.close(c2);
    Utensils.close(ak);
    Utensils.close(aj);
    Utensils.close(akj);
    Utensils.close(convAcc);
    Utensils.close(convTerm);
    Utensils.close(gammaRatio);
    Utensils.close(phiGammaRatio);
    Utensils.close(phiTerm);
    Utensils.close(PhiN);
  }
}
