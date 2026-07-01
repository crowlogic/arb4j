package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.RealSequence;
import arb.utensils.Utensils;

/**
 * The European call price as the single absolutely-convergent erfc–Hermite
 * series of {@code docs/single-series-pricing.md} (§4–§8), for any discounted
 * log-return whose characteristic function is a Gaussian times the entire
 * exponential of a proper rational function:
 *
 * <pre>
 *   φ(u) = exp( −½·σ²·u² − ⅈ·μ·u + ρ(u) ),   ρ proper (deg num &lt; deg den).
 * </pre>
 *
 * <h2>The construction (proved, unconditional)</h2>
 *
 * With {@code k̃ = ln(K/S₀) − rT}, {@code ξ = k̃ + μ}, {@code σ = √(σ²)},
 * {@code g(w) = ½σ²w² − wξ}, and the Cayley map
 * {@code ζ(w) = 1 + 2κ/(w−q)}, {@code q = c + κ} onto the unit disk, the price is
 *
 * <pre>
 *   C = K·e^{−rT}·Σ_{n=0..∞} qₙ·(T₁ₙ − T₀ₙ),   Π = C − (S₀ − K·e^{−rT}).
 * </pre>
 *
 * Every coefficient is one single-index recurrence, compiled by the expression
 * compiler and summed by one {@code Σ{n=0..∞}} — no jets, no Java accumulation
 * loop, no assumed pole structure:
 *
 * <ul>
 * <li>The erfc kernel {@code E(δ) = ½·e^{g(δ)}·erfc(z_δ)} (Lemma 4.1) — at the
 * three fixed nodes {@code {0,1,q}}; the node {@code q>c} carries the indicator
 * {@code −e^{g(q)}} (eq 4.3).</li>
 * <li>The Hermite atoms {@code A_{k+1}(δ)=∂ᵏE(δ)/k!} via the jet-free three-term
 * <em>value</em> recurrence that follows from the first-order ODE
 * {@code E'(w)=(σ²w−ξ)E(w)+κ₀} (with the parameter-free constant
 * {@code κ₀=(σ/√(2π))·e^{−ξ²/(2σ²)}}, since {@code g(w)−z_w²=−ξ²/(2σ²)}):
 *
 * <pre>
 *   D₀=E(δ), D₁=(σ²δ−ξ)E(δ)+κ₀, D_{k+1}=(σ²δ−ξ)D_k + k·σ²·D_{k−1}.
 * </pre>
 *
 * (eq 4.2 realised without power-series erfc.)</li>
 * <li>{@code T₀ₙ,T₁ₙ} by the node recurrence (6.4); {@code Tqₙ} by the finite
 * binomial atom expansion (6.3).</li>
 * <li>The Cayley coefficients {@code rₘ} of {@code R(ζ)=ρ(−ⅈ·w(ζ))=A(ζ)/B(ζ)}
 * by the C-finite recurrence {@code Σ b_k r_{m−k}=a_m} (§6.2); {@code A,B} are
 * assembled once as {@link ComplexPolynomial}s and their real/imaginary
 * coefficient vectors fed in as sequences.</li>
 * <li>{@code qₙ=[Ψ]ₙ}, {@code Ψ=e^{R}}, by the classical exp-of-a-series
 * recurrence {@code n·qₙ=Σ m·rₘ·q_{n−m}} (6.2), carried as the coupled real and
 * imaginary sequences {@code qRe,qIm} so the whole accumulation stays in the
 * {@code Real} codomain of the convergent {@code Σ}.</li>
 * </ul>
 *
 * Because {@code T₁ₙ−T₀ₙ} is real, only {@code Re(qₙ)} contributes to the (real)
 * price; the vanishing of {@code Σ Im(qₙ)(T₁ₙ−T₀ₙ)} is a consistency check.
 *
 * <h2>Black–Scholes certificate</h2>
 *
 * When {@code ρ≡0}: {@code A=0,B=1 ⇒ rₘ=0 ⇒ q₀=1,qₙ=0}, and the series collapses
 * to {@code C=K·e^{−rT}(E(1)−E(0))=S₀N(d₁)−K·e^{−rT}N(d₂)} — Black–Scholes as the
 * literal first term (§8).
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ErfcHermiteCallSeries implements
                                   AutoCloseable
{
  /** Hard cap for the convergent {@code Σ}; the {@code ~} specifier stops earlier. */
  private static final int CONVERGENCE_CAP = 256;

  /** Spot S₀. */
  public final Real      S0;
  /** Strike K — the free variable read by {@link #call}/{@link #put}. */
  public final Real      K;
  /** Discount exponent rT. */
  public final Real      rT;
  /** Gaussian variance σ² (must be &gt; 0). */
  public final Real      s2;
  /** Gaussian drift μ. */
  public final Real      mu;
  /** Contour abscissa c ∈ (1, p*). */
  public final Real      c;
  /** Cayley scale κ &gt; 0. */
  public final Real      kappa;
  /** Cayley pole q = c + κ. */
  public final Real      nodeQ;

  /** Shared context wiring every compiled sequence. */
  public final Context   context;

  /** Compiled complex single series {@code K·e^{−rT}·Σ qₙ(T₁ₙ−T₀ₙ)}; the price
   *  is its real part (the imaginary part vanishes by Hermitian symmetry). */
  public final ComplexNullaryFunction series;

  private final CoefficientSequence aC, bC;
  private final boolean ownsParameters;

  /**
   * @param S0      spot
   * @param K       strike (mutate to reprice)
   * @param rT      discount exponent rT
   * @param s2      Gaussian variance σ² &gt; 0
   * @param mu      Gaussian drift μ
   * @param c       contour abscissa c
   * @param kappa   Cayley scale κ &gt; 0
   * @param rhoNum  numerator of the proper part ρ (may be the zero polynomial)
   * @param rhoDen  denominator of ρ (deg &gt; deg rhoNum), or the constant 1
   * @param bits    working precision for the one-time A/B assembly
   */
  public ErfcHermiteCallSeries(Real S0, Real K, Real rT, Real s2, Real mu, Real c, Real kappa,
                               ComplexPolynomial rhoNum, ComplexPolynomial rhoDen, int bits)
  {
    if (s2.isNegative() || s2.isZero())
      throw new IllegalArgumentException("σ² must be strictly positive, got " + s2);
    if (kappa.isNegative() || kappa.isZero())
      throw new IllegalArgumentException("κ must be strictly positive, got " + kappa);

    this.S0     = S0.setName("S0");
    this.K      = K.setName("K");
    this.rT     = rT.setName("rT");
    this.s2     = s2.setName("s2");
    this.mu     = mu.setName("mu");
    this.c      = c.setName("c");
    this.kappa  = kappa.setName("kappa");
    this.nodeQ  = new Real().setName("nodeQ");
    c.add(kappa, bits, this.nodeQ);
    this.ownsParameters = true;

    this.context = new Context(this.S0, this.K, this.rT, this.s2, this.mu, this.c, this.kappa, this.nodeQ);

    // ── Cayley substitution R(ζ)=ρ(−ⅈ·w(ζ))=A(ζ)/B(ζ), b₀ normalised to 1 ──
    ComplexPolynomial[] AB = assembleCayley(rhoNum, rhoDen, c, kappa, bits);
    this.aC = new CoefficientSequence(AB[0]).register("aC", context);
    this.bC = new CoefficientSequence(AB[1]).register("bC", context);
    AB[0].close();
    AB[1].close();

    // ── Cayley coefficients rₘ by the C-finite recurrence (b₀=1) ──
    ComplexSequence.express("rc",
        "rc:m➔when(m=0,aC(0),else,aC(m)-∑k➔bC(k)*rc(m-k){k=1..m})", context);

    // ── qₙ=[e^{R}]ₙ by the exp-of-a-series recurrence n·qₙ=Σ m·rₘ·q_{n−m} ──
    ComplexSequence.express("qc",
        "qc:n➔when(n=0,exp(rc(0)),else,(1/n)*∑j➔j*rc(j)*qc(n-j){j=1..n})", context);

    // ── erfc kernel, Hermite atoms, and the kernel term integrals ──
    // Inlined scalars (all read the strike variable K):
    //   ξ = ln(K/S0)-rT+mu ;  σ = √s2 ;  κ₀ = (σ/√(2π))·e^{−ξ²/(2σ²)}
    final String XI  = "(ln(K/S0)-rT+mu)";
    final String SIG = "√(s2)";
    final String SQ2 = "√(2)";
    final String K0  = "(" + SIG + "/√(2*π)*exp(-(" + XI + ")²/(2*s2)))";
    // Hermite atoms at node q: Dₖ (=∂ᵏE_q(q)); indicator −e^{g(q)} is in the seed.
    final String GQ  = "(½*s2*nodeQ²-nodeQ*" + XI + ")";
    final String EQ  = "(½*exp" + GQ + "*erfc((" + XI + "-s2*nodeQ)/(" + SIG + "*" + SQ2 + "))-exp" + GQ + ")";
    RealSequence.express("atomQ",
        "atomQ:k➔when(k=0," + EQ
            + ",k=1,(s2*nodeQ-" + XI + ")*" + EQ + "+" + K0
            + ",else,(s2*nodeQ-" + XI + ")*atomQ(k-1)+(k-1)*s2*atomQ(k-2))", context);
    // Tqₙ = Σ_{k=0}^n C(n,k)(2κ)^k Aₖ₊₁(q),  Aₖ₊₁(q)=atomQ(k)/k!, C(n,k)=n!/(k!(n−k)!)
    RealSequence.express("Tq",
        "Tq:n➔∑k➔(n!/(k!*(n-k)!))*(2*kappa)^k*atomQ(k)/k!{k=0..n}", context);
    // Node recurrence (6.4) seeded by E(0),E(1) (nodes 0,1 < c → no indicator).
    final String E0 = "(½*erfc(" + XI + "/(" + SIG + "*" + SQ2 + ")))";
    final String E1 = "(½*exp(½*s2-" + XI + ")*erfc((" + XI + "-s2)/(" + SIG + "*" + SQ2 + ")))";
    RealSequence.express("T0",
        "T0:n➔when(n=0," + E0 + ",else,T0(n-1)+(2*kappa/nodeQ)*(Tq(n-1)-T0(n-1)))", context);
    RealSequence.express("T1",
        "T1:n➔when(n=0," + E1 + ",else,T1(n-1)+(2*kappa/(nodeQ-1))*(Tq(n-1)-T1(n-1)))", context);

    // ── The single series (6.5); the price is its real part ──
    this.series = ComplexNullaryFunction.express("series",
        "K*exp(-rT)*∑n➔qc(n)*(T1(n)-T0(n)){n=0.." + CONVERGENCE_CAP + "}", context);
  }

  /**
   * Price the call at strike {@code strike} to {@code bits} of precision.
   *
   * @return {@code result}
   */
  public Real call(Real strike, int bits, Real result)
  {
    K.set(strike);
    context.invalidateAllCaches();
    try ( Complex s = new Complex())
    {
      series.evaluate(bits, s);
      return result.set(s.re());
    }
  }

  /**
   * Price the put at strike {@code strike} to {@code bits} of precision, via
   * put–call parity {@code Π = C − (S₀ − K·e^{−rT})}.
   *
   * @return {@code result}
   */
  public Real put(Real strike, int bits, Real result)
  {
    try ( Real disc = new Real(); Real intrinsic = new Real())
    {
      call(strike, bits, result);
      rT.neg(disc);
      disc.exp(bits, disc);
      K.mul(disc, bits, disc);       // K·e^{−rT}
      S0.sub(disc, bits, intrinsic); // S₀ − K·e^{−rT}
      return result.sub(intrinsic, bits, result);
    }
  }

  /**
   * Assemble {@code A(ζ),B(ζ)} with {@code R(ζ)=ρ(−ⅈ·w(ζ))=A/B}, {@code b₀=1}.
   *
   * <p>
   * With {@code w(ζ)=[(c−κ)−(c+κ)ζ]/(1−ζ)} and {@code u=−ⅈw}, a polynomial
   * {@code P(u)=Σ p_j u^j} of degree {@code d} becomes
   * {@code P_hom(ζ)/(1−ζ)^d} where {@code P_hom=Σ p_j·Nu^j·(1−ζ)^{d−j}} and
   * {@code Nu(ζ)=−ⅈ(c−κ)+ⅈ(c+κ)ζ}. Hence
   * {@code A=numHom·(1−ζ)^{degDen−degNum}}, {@code B=denHom}.
   */
  private static ComplexPolynomial[] assembleCayley(ComplexPolynomial rhoNum, ComplexPolynomial rhoDen,
                                                    Real c, Real kappa, int bits)
  {
    int degNum = rhoNum.degree();
    if (degNum < 0) // ρ ≡ 0 → R = 0/1
      return new ComplexPolynomial[] { new ComplexPolynomial().zero(), new ComplexPolynomial().one() };

    int degDen = rhoDen.degree();
    try ( Complex n0 = new Complex(); Complex n1 = new Complex(); Complex p0 = new Complex(); Complex p1 = new Complex();
          Real cmk = new Real(); Real cpk = new Real())
    {
      c.sub(kappa, bits, cmk);          // c−κ
      c.add(kappa, bits, cpk);          // c+κ
      ComplexPolynomial Nu  = new ComplexPolynomial();     // w(ζ) numerator: (c−κ)−(c+κ)ζ
      n0.im().zero(); n0.re().set(cmk);                    //  (c−κ)
      n1.im().zero(); cpk.neg(n1.re());                    // −(c+κ)
      Nu.set(0, n0);
      Nu.set(1, n1);
      ComplexPolynomial OMZ = new ComplexPolynomial();     // 1−ζ
      OMZ.set(0, p0.set(1.0, 0.0));
      OMZ.set(1, p1.set(-1.0, 0.0));

      ComplexPolynomial numHom = homogenize(rhoNum, Nu, OMZ, degNum, bits);
      ComplexPolynomial denHom = homogenize(rhoDen, Nu, OMZ, degDen, bits);
      ComplexPolynomial omzPow = powPoly(OMZ, degDen - degNum, bits);
      ComplexPolynomial A      = new ComplexPolynomial();
      numHom.mul(omzPow, bits, A);
      ComplexPolynomial B      = denHom;

      try ( Complex b0 = new Complex().set(B.get(0)))
      {
        A.div(b0, bits, A);
        B.div(b0, bits, B);
      }
      Nu.close();
      OMZ.close();
      numHom.close();
      omzPow.close();
      return new ComplexPolynomial[] { A, B };
    }
  }

  /** {@code Σ_{j=0}^{deg} P[j]·Nu^j·OMZ^{deg−j}}. */
  private static ComplexPolynomial homogenize(ComplexPolynomial P, ComplexPolynomial Nu, ComplexPolynomial OMZ,
                                              int deg, int bits)
  {
    ComplexPolynomial acc = new ComplexPolynomial().zero();
    for (int j = 0; j <= deg; j++)
    {
      try ( ComplexPolynomial nuJ = powPoly(Nu, j, bits); ComplexPolynomial omzK = powPoly(OMZ, deg - j, bits);
            ComplexPolynomial term = new ComplexPolynomial(); ComplexPolynomial scaled = new ComplexPolynomial();
            Complex pj = new Complex().set(P.get(j)))
      {
        nuJ.mul(omzK, bits, term);
        term.mul(pj, bits, scaled);
        acc.add(scaled, bits, acc);
      }
    }
    return acc;
  }

  /** {@code base^e} by repeated multiplication ({@code e≥0}). */
  private static ComplexPolynomial powPoly(ComplexPolynomial base, int e, int bits)
  {
    ComplexPolynomial r = new ComplexPolynomial().one();
    for (int i = 0; i < e; i++)
    {
      ComplexPolynomial next = new ComplexPolynomial();
      r.mul(base, bits, next);
      r.close();
      r = next;
    }
    return r;
  }

  @Override
  public void close()
  {
    if (series  != null) series.close();
    if (aC      != null) aC.close();
    if (bC      != null) bC.close();
    if (context != null) context.close();
    if (ownsParameters)
      Utensils.close(S0, K, rT, s2, mu, c, kappa, nodeQ);
  }

  /**
   * A {@link ComplexSequence} returning the {@code k}-th coefficient of a fixed
   * {@link ComplexPolynomial}, and 0 beyond its degree — the sequence form of
   * the Cayley numerator/denominator coefficient lists fed into the C-finite
   * recurrence.
   */
  public static final class CoefficientSequence implements
                                                 ComplexSequence
  {
    private final Complex[] coefficients;

    CoefficientSequence(ComplexPolynomial p)
    {
      int n = Math.max(0, p.degree() + 1);
      this.coefficients = new Complex[n];
      for (int i = 0; i < n; i++)
        this.coefficients[i] = new Complex().set(p.get(i));
    }

    private CoefficientSequence register(String name, Context context)
    {
      context.registerFunction(name, this);
      return this;
    }

    @Override
    public Complex evaluate(Integer index, int order, int bits, Complex result)
    {
      int i = index.getSignedValue();
      return (i >= 0 && i < coefficients.length) ? result.set(coefficients[i]) : result.zero();
    }

    @Override
    public void close()
    {
      for (Complex coefficient : coefficients)
        coefficient.close();
    }

    @Override
    public Class<Integer> domainType()
    {
      return Integer.class;
    }

    @Override
    public Class<Complex> coDomainType()
    {
      return Complex.class;
    }
  }
}
