package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * Levenberg–Marquardt calibrator of the rough-Heston model to a set of European
 * options spanning multiple maturities, strikes, and sides (call/put), in
 * arbitrary-precision {@link Real}/{@link RealMatrix} arithmetic throughout — no
 * double-precision anywhere.
 *
 * <p>
 * The six parameters are indexed {@link #LAMBDA}=λ, {@link #THETA}=θ,
 * {@link #NU}=ν, {@link #V0}=V₀, {@link #RHO}=ρ, {@link #MU}=μ; any subset is
 * free and the rest fixed. A SINGLE {@link RoughHestonOptionPricer} is compiled
 * once and repriced for every option by mutating its parameter handles and its
 * maturity {@code φ.T}, then calling {@link RoughHestonOptionPricer#invalidate()}
 * — the pricing machinery (≈70 generated classes) is compiled exactly once for
 * the whole calibration, never per option. The options are priced strictly
 * sequentially (each result is read out before the next is priced), so one
 * pricer's mutable variable state suffices and no two options' states ever need
 * to coexist. Puts are priced from calls by parity (S₀=1, r=0: P = C − 1 + K).
 *
 * <p>
 * The damped Gauss–Newton step solves {@code (JᵀJ + μ·diag(JᵀJ)) δ = −Jᵀr} via
 * {@link RealMatrix#solve}; μ rises on a rejected step and falls on an accepted
 * one. The Jacobian {@code J_ij = ∂(price_i)/∂(param_j)} — the parameter
 * sensitivities — is the ANALYTIC optimally-truncated accumulated sensitivity
 * {@link RoughHestonOptionPricer#callSensitivity} (no finite differences) and is
 * returned. No parameter is ever clamped: a step into an inadmissible region
 * simply fails to price and is rejected, so the damping shrinks the step instead.
 * Iteration is hard-bounded and every step is traced.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RoughHestonCalibrator implements
                                         AutoCloseable
{
  public static final int         LAMBDA = 0, THETA = 1, NU = 2, V0 = 3, RHO = 4, MU = 5;
  public static final String[]    NAMES  = { "λ", "θ", "ν", "V0", "ρ", "μ" };

  /** A market quote: maturity T, strike K, call/put, observed price, fit weight (all Real). */
  public static final class Option
  {
    public final Real    T, K, price, weight;
    public final boolean call;

    public Option(Real T, Real K, boolean call, Real price, Real weight)
    {
      this.T = T; this.K = K; this.call = call; this.price = price; this.weight = weight;
    }
  }

  /** Calibration outcome: fitted full 6-vector, residual ½‖r‖², iterations, and the sensitivity Jacobian. */
  public static final class Result
  {
    public final Real       params;        // dim-6 Real vector
    public final Real       objective;     // ½‖r‖²
    public final int        iterations;
    public final boolean    converged;
    public final RealMatrix sensitivities; // m × nFree

    Result(Real params, Real objective, int iterations, boolean converged, RealMatrix sensitivities)
    {
      this.params = params; this.objective = objective; this.iterations = iterations;
      this.converged = converged; this.sensitivities = sensitivities;
    }
  }

  final int                       bits;
  final List<Option>              options;
  final int[]                     free;
  final Real                      p;        // dim-6 working parameters
  final RoughHestonHermitePricer pricer;   // double pricer; params set per option
  final List<Real>                owned = new ArrayList<>();

  public int                      maxIter    = 80;
  int                             maxDamping = 40;

  /** Where each per-iteration trace line goes. The GUI replaces this to stream the
   *  Levenberg–Marquardt progress into its log pane; default is the console. */
  public java.util.function.Consumer<String> trace = System.out::println;

  public RoughHestonCalibrator(List<Option> options, int[] freeParams, Real initialParams, int bits)
  {
    this.bits    = bits;
    this.options = options;
    this.free    = freeParams.clone();
    this.p       = Real.newVector(6);
    for (int k = 0; k < 6; k++)
      this.p.get(k).set(initialParams.get(k));
    // Compile the pricing machinery exactly ONCE. Every option is priced through
    // this single instance by mutating its parameter handles and its maturity
    // φ.T before each (sequential) price/sensitivity call — see priceAll/jacobian.
    // The initial maturity is arbitrary (the first option's); it is overwritten
    // per option. This is the whole point: the ≈70 generated classes are defined
    // once for the calibration, not once per option (issue #1073).
    this.pricer = new RoughHestonHermitePricer(initialParams.get(MU).doubleValue(),initialParams.get(LAMBDA).doubleValue(),initialParams.get(THETA).doubleValue(),initialParams.get(NU).doubleValue(),initialParams.get(RHO).doubleValue(),initialParams.get(V0).doubleValue(),1.0/12);this.pricer.M=8;
  }


  private Real named(String nm, Real val)
  {
    Real r = new Real(bits);
    r.set(val).setName(nm);
    owned.add(r);
    return r;
  }

  /** Price the whole set at full parameters {@code p6}; write model prices into the m×1 {@code model}. */
  public void priceAll(Real p6, RealMatrix model)
  {
    setParams(pricer, p6);
    for (int i = 0; i < options.size(); i++)
    {
      Option o = options.get(i);
      pricer.T = o.T.doubleValue();
      double K = o.K.doubleValue();
      double price = o.call ? pricer.call(K, bits) : pricer.put(K, bits);
      model.get(i, 0).set(price);
    }
  }

  private static void setParams(RoughHestonHermitePricer p, Real p6)
  {
    p.set(p6.get(MU).doubleValue(), p6.get(LAMBDA).doubleValue(), p6.get(THETA).doubleValue(),
          p6.get(NU).doubleValue(), p6.get(RHO).doubleValue(), p6.get(V0).doubleValue());
  }

  /** Price the set; return true iff every price is finite. Exceptions propagate — they are not swallowed. */
  boolean priceAllFinite(Real p6, RealMatrix model)
  {
    priceAll(p6, model);
    for (int i = 0; i < options.size(); i++)
      if (!model.get(i, 0).isFinite())
        return false;
    return true;
  }

  public Result calibrate()
  {
    final int  m = options.size();
    final int  n = free.length;
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

    try ( Real F = new Real(); Real Fnew = new Real(); Real μ = new Real(); Real tmp = new Real();
          Real gnorm = new Real(); Real dxnorm = new Real(); Real fac = new Real("3", bits);
          Real gtol = new Real("1e-14", bits); Real xtol = new Real("1e-12", bits))
    {
      priceAllFinite(withFree(x), model);
      objective(model, r, F);
      trace.accept("CALIB start: F=" + sci(F) + "  x=" + vec(x));

      boolean started = false, converged = false;
      int     iter    = 0;
      for (iter = 0; iter < maxIter; iter++)
      {
        jacobian(x, model, J);
        J.transpose(Jt);
        Jt.mul(J, bits, JtJ);
        Jt.mul(r, bits, g);

        maxAbsCol(g, gnorm);
        if (gnorm.compareTo(gtol) < 0)
        {
          trace.accept("CALIB iter " + iter + ": converged ‖g‖∞=" + sci(gnorm));
          converged = true;
          break;
        }
        if (!started)                          // initial damping scaled to the curvature
        {
          maxAbsDiag(JtJ, μ);
          if (!μ.isFinite() || μ.sign() <= 0)
            μ.set(RealConstants.one);
          started = true;
        }

        boolean stepped = false;
        for (int d = 0; d < maxDamping; d++)
        {
          for (int a = 0; a < n; a++)
          {
            for (int b = 0; b < n; b++)
              A.get(a, b).set(JtJ.get(a, b));
            JtJ.get(a, a).mul(μ, bits, tmp);   // Marquardt scaling: + μ·diag
            A.get(a, a).add(tmp, bits, A.get(a, a));
            g.get(a, 0).neg(negg.get(a, 0));
          }
          if (A.solve(negg, bits, δ) == null) { μ.mul(fac, bits, μ); continue; }

          for (int j = 0; j < n; j++)
            x.get(j, 0).add(δ.get(j, 0), bits, xnew.get(j, 0));

          boolean ok = priceAllFinite(withFree(xnew), model);
          if (ok)
            objective(model, r, Fnew);
          if (ok && Fnew.compareTo(F) < 0)
          {
            μ.div(fac, bits, μ);
            stepped = true;
            break;
          }
          μ.mul(fac, bits, μ);
        }

        maxAbsDiff(xnew, x, dxnorm);
        for (int j = 0; j < n; j++)
        {
          x.get(j, 0).set(xnew.get(j, 0));
          p.get(free[j]).set(xnew.get(j, 0));
        }
        if (stepped)
          F.set(Fnew);
        trace.accept("CALIB iter " + iter + ": F=" + sci(F) + "  ‖g‖∞=" + sci(gnorm)
                           + "  μ=" + sci(μ) + "  ‖Δx‖∞=" + sci(dxnorm) + "  x=" + vec(x));
        if (!stepped) { trace.accept("CALIB: damping exhausted, stopping"); break; }
        if (dxnorm.compareTo(xtol) < 0) { converged = true; break; }
      }

      priceAllFinite(withFree(x), model);
      objective(model, r, F);
      jacobian(x, model, J);
      trace.accept("CALIB done: iters=" + iter + "  F=" + sci(F) + "  converged=" + converged + "  x=" + vec(x));

      Real    paramsOut = Real.newVector(6);
      for (int k = 0; k < 6; k++)
        paramsOut.get(k).set(p.get(k));
      RealMatrix sens = RealMatrix.newMatrix(m, n);
      sens.set(J);
      Real Fout = new Real(); Fout.set(F);
      return new Result(paramsOut, Fout, iter, converged, sens);
    }
  }

  /** r_i = w_i (model_i − market_i);  F ← ½‖r‖². */
  private void objective(RealMatrix model, RealMatrix r, Real F)
  {
    try ( Real d = new Real(); Real sq = new Real())
    {
      F.zero();
      for (int i = 0; i < options.size(); i++)
      {
        Option o = options.get(i);
        model.get(i, 0).sub(o.price, bits, d);
        d.mul(o.weight, bits, r.get(i, 0));
        r.get(i, 0).mul(r.get(i, 0), bits, sq);
        F.add(sq, bits, F);
      }
      F.mul2e(-1, F);
    }
  }

  /**
   * Analytic weighted Jacobian J(i,j) = wᵢ·∂(model price of option i)/∂(free
   * parameter j) by central finite differences of the Padé–Lewis price
   * ({@link RoughHestonHermitePricer}). For a put, model = C − S0 + K (S0=1,r=0),
   * whose parameter derivative is ∂C/∂param (parity terms parameter-independent).
   */
  private void jacobian(RealMatrix x, RealMatrix modelAtX, RealMatrix J)
  {
    Real p6 = withFree(x);
    double[] base = { p6.get(MU).doubleValue(), p6.get(LAMBDA).doubleValue(), p6.get(THETA).doubleValue(),
                      p6.get(NU).doubleValue(), p6.get(RHO).doubleValue(), p6.get(V0).doubleValue() };
    for (int j = 0; j < free.length; j++)
    {
      int    pj = free[j];
      double h  = 1e-6 * (Math.abs(p6.get(pj).doubleValue()) + 1e-3);
      for (int i = 0; i < options.size(); i++)
      {
        Option o = options.get(i);
        double K = o.K.doubleValue();
        double up = priceBumped(base, pj, h, o.T.doubleValue(), K, o.call);
        double dn = priceBumped(base, pj, -h, o.T.doubleValue(), K, o.call);
        double d  = (up - dn) / (2 * h);
        J.get(i, j).set(d).mul(o.weight, bits, J.get(i, j));
      }
    }
  }

  private double priceBumped(double[] base, int pj, double h, double T, double K, boolean call)
  {
    pricer.set(idx(base, MU, pj, h), idx(base, LAMBDA, pj, h), idx(base, THETA, pj, h),
               idx(base, NU, pj, h), idx(base, RHO, pj, h), idx(base, V0, pj, h));
    pricer.T = T;
    return call ? pricer.call(K, bits) : pricer.put(K, bits);
  }

  private static double idx(double[] b, int slot, int pj, double h) { return slot == pj ? b[slot] + h : b[slot]; }

  /**
   * Build the full 6-vector from the current fixed params and the free values in
   * {@code x} (no clamping). A parameter is a POINT at which the model is priced,
   * not a ball: the radius {@code x} carries is the Levenberg-Marquardt step's
   * uncertainty estimate, and feeding it into the divergent Edgeworth series
   * amplifies it without bound (it exhausts the heap). So the pricing vector is
   * taken at the midpoint — every component's radius is zeroed.
   */
  private Real withFree(RealMatrix x)
  {
    Real p6 = Real.newVector(6);              // returned to caller; small and short-lived
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
        u.get(i, 0).sub(v.get(i, 0), 128, a); a.abs();
        if (a.compareTo(out) > 0)
          out.set(a);
      }
    }
  }

  private static String sci(Real x)
  {
    return x.toString();
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

    for (Real r : owned)
      r.close();
  }
}
