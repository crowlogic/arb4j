package arb.stochastic.processes.heston;

import java.util.List;

import arb.ComplexConstants;
import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * A Levenberg–Marquardt calibration of the rough-Heston model to a set of
 * European option quotes spanning multiple maturities, strikes, and sides
 * (call/put), in arbitrary-precision {@link Real}/{@link RealMatrix}
 * arithmetic throughout — no double-precision anywhere.
 *
 * <p>
 * The six parameters are indexed {@link #LAMBDA}=λ, {@link #THETA}=θ,
 * {@link #NU}=ν, {@link #V0}=V₀, {@link #RHO}=ρ, {@link #MU}=μ; any subset is
 * free and the rest fixed. A SINGLE {@link RoughHestonEdgeworthCallPrice} is
 * compiled once and repriced for every quote by mutating its parameter handles
 * and its maturity {@code φ.T}, then calling
 * {@link RoughHestonEdgeworthCallPrice#invalidate()} — the pricing machinery
 * is compiled exactly once for the whole calibration, never per option. The
 * quotes are priced strictly sequentially (each result is read out before the
 * next is priced), so one price instance's mutable variable state suffices.
 * Puts are priced from calls by parity (S₀=1, r=0: P = C − 1 + K).
 *
 * <p>
 * The damped Gauss–Newton step solves {@code (JᵀJ + μ·diag(JᵀJ)) δ = −Jᵀr} via
 * {@link RealMatrix#solve}; the damping μ rises on a rejected step and falls
 * on an accepted one. The Jacobian {@code J_ij = ∂(price_i)/∂(param_j)} is the
 * central difference quotient of the compiled price at working precision: with
 * step h = 2^(−bits/3) the quotient's truncation error is O(h²) = O(2^(−2·bits/3))
 * and its rounding error O(2^(−2·bits/3)) — both far below every digit the
 * calibration is asked to deliver, because the arithmetic carries no fixed
 * machine epsilon. No parameter is ever clamped: a step into an inadmissible
 * region simply fails to price and is rejected, so the damping shrinks the
 * step instead. Iteration is hard-bounded and every step is traced.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RoughHestonCalibration implements
                                          AutoCloseable
{
  public static final int      LAMBDA = 0, THETA = 1, NU = 2, V0 = 3, RHO = 4, MU = 5;
  public static final String[] NAMES  =
  { "λ", "θ", "ν", "V0", "ρ", "μ" };

  /**
   * A market quote: maturity T, strike K, call/put, observed price, fit weight
   * (all Real).
   */
  public static final class Quote
  {
    public final Real    T, K, price, weight;
    public final boolean call;

    public Quote(Real T, Real K, boolean call, Real price, Real weight)
    {
      this.T      = T;
      this.K      = K;
      this.call   = call;
      this.price  = price;
      this.weight = weight;
    }
  }

  /**
   * Calibration outcome: fitted full 6-vector, residual ½‖r‖², iterations, and
   * convergence flag.
   */
  public static final class Result
  {
    public final Real    params;    // dim-6 Real vector
    public final Real    objective; // ½‖r‖²
    public final int     iterations;
    public final boolean converged;

    Result(Real params, Real objective, int iterations, boolean converged)
    {
      this.params     = params;
      this.objective  = objective;
      this.iterations = iterations;
      this.converged  = converged;
    }
  }

  final int                                  bits;
  final List<Quote>                          quotes;
  final int[]                                free;
  final Real                                 p;     // dim-6 working parameters
  final Real                                 λ, θ, ν, v0, ρ, μ, T, S0, rr, strike;
  final RoughHestonEdgeworthCallPrice        price; // compiled once; repriced by mutating handles

  public int                                 maxIter = 40;
  int                                        maxDamping = 40;

  /** Where each per-iteration trace line goes; default is the console. */
  public java.util.function.Consumer<String> trace   = System.out::println;

  public RoughHestonCalibration(List<Quote> quotes, int[] freeParams, Real initialParams, int bits)
  {
    this.bits   = bits;
    this.quotes = quotes;
    this.free   = freeParams.clone();
    this.p      = Real.newVector(6);
    for (int k = 0; k < 6; k++)
      this.p.get(k).set(initialParams.get(k));

    this.λ      = named("λ", initialParams.get(LAMBDA));
    this.θ      = named("θ", initialParams.get(THETA));
    this.ν      = named("ν", initialParams.get(NU));
    this.v0     = named("V0", initialParams.get(V0));
    this.ρ      = named("ρ", initialParams.get(RHO));
    this.μ      = named("μ", initialParams.get(MU));
    this.T      = named("T", quotes.isEmpty() ? initialParams.get(MU) : quotes.get(0).T);
    this.S0     = named("S0", null).one();
    this.rr     = named("rr", null).zero();
    this.strike = new Real("1",
                           bits);

    Context ctx = new Context(λ,
                              θ,
                              ν,
                              v0,
                              ρ,
                              μ,
                              T);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);
    // Compile the pricing machinery exactly ONCE. Every quote is priced
    // through this single instance by mutating its parameter handles and its
    // maturity T before each (sequential) call — see priceAll.
    this.price = new RoughHestonEdgeworthCallPrice(ctx,
                                                   strike,
                                                   ComplexConstants.zero);
  }

  private Real named(String nm, Real val)
  {
    Real r = new Real(bits);
    if (val != null)
      r.set(val);
    r.setName(nm);
    return r;
  }

  /**
   * Price the whole quote set at full parameters {@code p6}; write model
   * prices into the m×1 {@code model}. The parameter handles are mutated and
   * the caches invalidated once per parameter set / maturity, then each strike
   * is priced through the single compiled instance.
   */
  public void priceAll(Real p6, RealMatrix model)
  {
    λ.set(p6.get(LAMBDA));
    θ.set(p6.get(THETA));
    ν.set(p6.get(NU));
    v0.set(p6.get(V0));
    ρ.set(p6.get(RHO));
    μ.set(p6.get(MU));
    try ( Real value = new Real(); Real tmp = new Real())
    {
      Real currentT = null;
      for (int i = 0; i < quotes.size(); i++)
      {
        Quote q = quotes.get(i);
        if (currentT == null || !currentT.equals(q.T))
        {
          T.set(q.T);
          price.invalidate();
          currentT = q.T;
        }
        price.call(q.K, bits, value);
        if (q.call)
          model.get(i, 0).set(value);
        else                                  // put–call parity, S₀=1, r=0
        {
          value.sub(1, bits, tmp);
          tmp.add(q.K, bits, tmp);
          model.get(i, 0).set(tmp);
        }
      }
    }
  }

  /** Price the set; return true iff every price is finite. */
  boolean priceAllFinite(Real p6, RealMatrix model)
  {
    priceAll(p6, model);
    for (int i = 0; i < quotes.size(); i++)
      if (!model.get(i, 0).isFinite())
        return false;
    return true;
  }

  public Result calibrate()
  {
    final int  m     = quotes.size();
    final int  n     = free.length;
    RealMatrix model = RealMatrix.newMatrix(m, 1);
    RealMatrix r     = RealMatrix.newMatrix(m, 1);
    RealMatrix J     = RealMatrix.newMatrix(m, n);
    RealMatrix Jt    = RealMatrix.newMatrix(n, m);
    RealMatrix JtJ   = RealMatrix.newMatrix(n, n);
    RealMatrix A     = RealMatrix.newMatrix(n, n);
    RealMatrix g     = RealMatrix.newMatrix(n, 1);
    RealMatrix negg  = RealMatrix.newMatrix(n, 1);
    RealMatrix δ     = RealMatrix.newMatrix(n, 1);
    RealMatrix x     = RealMatrix.newMatrix(n, 1);
    RealMatrix xnew  = RealMatrix.newMatrix(n, 1);

    for (int j = 0; j < n; j++)
      x.get(j, 0).set(p.get(free[j]));

    try ( Real F = new Real(); Real Fnew = new Real(); Real damping = new Real(); Real tmp = new Real();
          Real gnorm = new Real(); Real dxnorm = new Real(); Real fac = new Real("3",
                                                                                 bits);
          Real gtol = new Real("1e-30",
                               bits);
          // Quadratic contraction: a step of size h leaves O(h²) error behind,
          // so ‖Δx‖∞ < 1e-7 already certifies fourteen digits — no further
          // iteration is spent verifying a zero step.
          Real xtol = new Real("1e-7",
                               bits))
    {
      priceAllFinite(withFree(x), model);
      objective(model, r, F);
      trace.accept("CALIB start: F=" + F + "  x=" + vec(x));

      boolean started = false, converged = false;
      int     iter    = 0;
      for (iter = 0; iter < maxIter; iter++)
      {
        jacobian(x, J);
        J.transpose(Jt);
        Jt.mul(J, bits, JtJ);
        Jt.mul(r, bits, g);

        maxAbsCol(g, gnorm);
        if (gnorm.compareTo(gtol) < 0)
        {
          trace.accept("CALIB iter " + iter + ": converged ‖g‖∞=" + gnorm);
          converged = true;
          break;
        }
        if (!started)                          // start at (essentially) pure Gauss–Newton:
        {                                      // zero-residual fits contract quadratically from
          maxAbsDiag(JtJ, damping);            // the first full step, and a rejected step still
          if (!damping.isFinite() || damping.sign() <= 0)
            damping.one();                     // raises the damping below
          damping.mul2e(-64, damping);
          started = true;
        }

        boolean stepped = false;
        for (int d = 0; d < maxDamping; d++)
        {
          for (int a = 0; a < n; a++)
          {
            for (int b = 0; b < n; b++)
              A.get(a, b).set(JtJ.get(a, b));
            JtJ.get(a, a).mul(damping, bits, tmp);   // Marquardt scaling: + damping·diag
            A.get(a, a).add(tmp, bits, A.get(a, a));
            g.get(a, 0).neg(negg.get(a, 0));
          }
          if (A.solve(negg, bits, δ) == null)
          {
            damping.mul(fac, bits, damping);
            continue;
          }

          for (int j = 0; j < n; j++)
            x.get(j, 0).add(δ.get(j, 0), bits, xnew.get(j, 0));

          boolean ok = priceAllFinite(withFree(xnew), model);
          if (ok)
            objective(model, r, Fnew);
          if (ok && Fnew.compareTo(F) < 0)
          {
            damping.div(fac, bits, damping);
            stepped = true;
            break;
          }
          damping.mul(fac, bits, damping);
        }

        maxAbsDiff(xnew, x, dxnorm);
        for (int j = 0; j < n; j++)
        {
          x.get(j, 0).set(xnew.get(j, 0));
          p.get(free[j]).set(xnew.get(j, 0));
        }
        if (stepped)
          F.set(Fnew);
        trace.accept("CALIB iter " + iter + ": F=" + F + "  ‖g‖∞=" + gnorm + "  damping=" + damping + "  ‖Δx‖∞="
                     + dxnorm + "  x=" + vec(x));
        if (!stepped)
        {
          trace.accept("CALIB: damping exhausted, stopping");
          break;
        }
        if (dxnorm.compareTo(xtol) < 0)
        {
          iter++;
          converged = true;
          break;
        }
      }

      priceAllFinite(withFree(x), model);
      objective(model, r, F);
      trace.accept("CALIB done: iters=" + iter + "  F=" + F + "  converged=" + converged + "  x=" + vec(x));

      Real paramsOut = Real.newVector(6);
      for (int k = 0; k < 6; k++)
        paramsOut.get(k).set(p.get(k));
      Real Fout = new Real();
      Fout.set(F);
      return new Result(paramsOut,
                        Fout,
                        iter,
                        converged);
    }
  }

  /** r_i = w_i (model_i − market_i);  F ← ½‖r‖². */
  private void objective(RealMatrix model, RealMatrix r, Real F)
  {
    try ( Real d = new Real(); Real sq = new Real())
    {
      F.zero();
      for (int i = 0; i < quotes.size(); i++)
      {
        Quote q = quotes.get(i);
        model.get(i, 0).sub(q.price, bits, d);
        d.mul(q.weight, bits, r.get(i, 0));
        r.get(i, 0).mul(r.get(i, 0), bits, sq);
        F.add(sq, bits, F);
      }
      F.mul2e(-1, F);
    }
  }

  /**
   * Weighted Jacobian J(i,j) = wᵢ·∂(model price of quote i)/∂(free parameter
   * j) — the central difference quotient of the compiled price at working
   * precision: step h = 2^(−bits/3), truncation error O(2^(−2·bits/3)), no
   * fixed machine epsilon anywhere. For a put, model = C − S0 + K·e^{−rT}
   * (S0=1, r=0), whose parameter derivative is ∂C/∂param since the parity
   * terms are parameter-independent; so both sides use the same call
   * derivative.
   */
  private void jacobian(RealMatrix x, RealMatrix J)
  {
    final int  m     = quotes.size();
    RealMatrix plus  = RealMatrix.newMatrix(m, 1);
    RealMatrix minus = RealMatrix.newMatrix(m, 1);
    try ( Real h = new Real(); Real twoH = new Real(); Real p6 = new Real())
    {
      h.one().mul2e(-bits / 3);
      h.mul2e(1, twoH);
      Real base = withFree(x);
      for (int j = 0; j < free.length; j++)
      {
        Real bumped = Real.newVector(6);
        for (int k = 0; k < 6; k++)
          bumped.get(k).set(base.get(k));
        bumped.get(free[j]).add(h, bits, bumped.get(free[j]));
        priceAll(bumped, plus);
        for (int k = 0; k < 6; k++)
          bumped.get(k).set(base.get(k));
        bumped.get(free[j]).sub(h, bits, bumped.get(free[j]));
        priceAll(bumped, minus);
        for (int i = 0; i < m; i++)
        {
          plus.get(i, 0).sub(minus.get(i, 0), bits, J.get(i, j));
          J.get(i, j).div(twoH, bits, J.get(i, j));
          J.get(i, j).mul(quotes.get(i).weight, bits, J.get(i, j));
        }
      }
    }
  }

  /**
   * Build the full 6-vector from the current fixed params and the free values
   * in {@code x} (no clamping). A parameter is a POINT at which the model is
   * priced, not a ball: every component's radius is zeroed so the step's
   * uncertainty estimate never feeds the expansion.
   */
  private Real withFree(RealMatrix x)
  {
    Real p6 = Real.newVector(6);
    for (int k = 0; k < 6; k++)
      p6.get(k).set(p.get(k));
    for (int j = 0; j < free.length; j++)
      p6.get(free[j]).set(x.get(j, 0));
    for (int k = 0; k < 6; k++)
      p6.get(k).getRad().zero();
    return p6;
  }

  private static void maxAbsCol(RealMatrix col, Real out)
  {
    try ( Real a = new Real())
    {
      out.zero();
      for (int i = 0; i < col.getNumRows(); i++)
      {
        col.get(i, 0).abs(0, a);
        if (a.compareTo(out) > 0)
          out.set(a);
      }
    }
  }

  private static void maxAbsDiag(RealMatrix M, Real out)
  {
    try ( Real a = new Real())
    {
      out.zero();
      for (int i = 0; i < M.getNumRows(); i++)
      {
        M.get(i, i).abs(0, a);
        if (a.compareTo(out) > 0)
          out.set(a);
      }
    }
  }

  private static void maxAbsDiff(RealMatrix u, RealMatrix v, Real out)
  {
    try ( Real a = new Real())
    {
      out.zero();
      for (int i = 0; i < u.getNumRows(); i++)
      {
        u.get(i, 0).sub(v.get(i, 0), 128, a);
        a.abs();
        if (a.compareTo(out) > 0)
          out.set(a);
      }
    }
  }

  private static String vec(RealMatrix x)
  {
    StringBuilder sb = new StringBuilder("[");
    for (int i = 0; i < x.getNumRows(); i++)
      sb.append(i == 0 ? "" : ", ").append(x.get(i, 0).toString());
    return sb.append("]").toString();
  }

  @Override
  public void close()
  {
    price.close();
    arb.utensils.Utensils.close(λ, θ, ν, v0, ρ, μ, T, S0, rr, strike, p);
  }
}
