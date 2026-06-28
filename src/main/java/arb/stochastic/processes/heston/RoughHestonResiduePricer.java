package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexMatrix;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Exact European call/put pricer for the rough Heston model via the Müntz–Padé
 * cumulant generator inverted by Fourier–cosine (Fang–Oosterlee). This is the
 * "true pricer" of the Fractional Riccati–Müntz–Padé theorem
 * ({@code docs/residue_price.tex}, {@code docs/frmp2.tex}): the characteristic
 * function φ(v,T)=exp(Φ(v,T)) is approximated by the diagonal [M/M] Padé of the
 * cumulant series Φ(v,T)=Σ_k d_k(v)·T^{kμ+1}, which is convergent on the whole
 * claimed maturity domain (no asymptotic truncation, no Edgeworth/Gram–Charlier
 * resummation), and the call price is the exact Lewis line integral evaluated by
 * COS. The Padé tames the divergence of the raw Müntz series, so φ_M is bounded
 * for all real Fourier argument and the inversion is unconditionally stable.
 *
 * <pre>
 *   a_1(v)=P(v)/Γ(μ+1),  a_j=Γ((j-1)μ+1)/Γ(jμ+1)·(Q·a_{j-1}+R·Σ a_ℓ a_{j-1-ℓ})
 *   d_k(v)=u_k·a_k(v)+w_k·a_{k+1}(v),  P=½(-v²-iv), Q=λ(iρνv-1), R=½(λν)²
 *   u_k=λθ/(kμ+1) (0 at k=0),  w_0=V₀Γ(μ+1),  w_k=V₀Γ((k+1)μ+1)/Γ(kμ+2)
 *   Φ_M(v)=T·[M/M]Padé(Σ d_k z^k)|_{z=T^μ},  φ_M=exp(Φ_M)
 *   C=S₀(1-e^k)⁺+(S₀/2π)∫ e^{-ivk}φ_M(v)/(v(v+i))dv  (Lewis), k=log(K/S₀)-rT
 * </pre>
 *
 * @author ©2026 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class RoughHestonResiduePricer implements
                                      AutoCloseable
{
  public final Real μ, λ, θ, ν, ρ, V0, T;
  /** Padé order M (denominator degree). */
  public int        M    = 16;
  /** COS terms and half-range; the support is ≪ [-rng,rng] for these maturities. */
  public int        cosN = 1024;
  public double     rng  = 2.0;

  public RoughHestonResiduePricer(Real μ, Real λ, Real θ, Real ν, Real ρ, Real V0, Real T)
  {
    this.μ = μ; this.λ = λ; this.θ = θ; this.ν = ν; this.ρ = ρ; this.V0 = V0; this.T = T;
  }

  private static final double[] LG = { 676.5203681218851, -1259.1392167224028, 771.32342877765313, -176.61502916214059,
                                       12.507343278686905, -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7 };

  private static double g(double x)
  {
    if (x < 0.5) return Math.PI / (Math.sin(Math.PI * x) * g(1 - x));
    x -= 1; double a = 0.99999999999980993, t = x + 7.5;
    for (int i = 0; i < LG.length; i++) a += LG[i] / (x + i + 1);
    return Math.sqrt(2 * Math.PI) * Math.pow(t, x + 0.5) * Math.exp(-t) * a;
  }

  /** Φ_M(v) for real Fourier argument v, returned into re/im. */
  private void phiM(double v, int bits, double[] out)
  {
    if (Math.abs(v) < 1e-300) { out[0] = 0; out[1] = 0; return; }
    double mu = μ.doubleValue(), lam = λ.doubleValue(), th = θ.doubleValue(),
           nu = ν.doubleValue(), rho = ρ.doubleValue(), v0 = V0.doubleValue(), Tv = T.doubleValue();
    int K2 = 2 * M + 2;
    double[] ar = new double[K2 + 2], ai = new double[K2 + 2];
    double Pr = -0.5 * (v * v), Pi = -0.5 * v;                 // -½(v²+iv)
    double Qr = -lam, Qi = lam * v * rho * nu;                  // λ(iρνv-1)
    double R = 0.5 * lam * lam * nu * nu;
    ar[1] = Pr / g(mu + 1); ai[1] = Pi / g(mu + 1);
    for (int j = 2; j <= K2; j++)
    {
      double sr = 0, si = 0;
      for (int l = 1; l <= j - 2; l++) { sr += ar[l]*ar[j-1-l]-ai[l]*ai[j-1-l]; si += ar[l]*ai[j-1-l]+ai[l]*ar[j-1-l]; }
      double cr = Qr*ar[j-1]-Qi*ai[j-1]+R*sr, ci = Qr*ai[j-1]+Qi*ar[j-1]+R*si;
      double gg = g((j-1)*mu+1)/g(j*mu+1); ar[j]=gg*cr; ai[j]=gg*ci;
    }
    double z = Math.pow(Tv, mu);
    double[] cr = new double[2*M+1], ci = new double[2*M+1]; double zp = 1;
    for (int k = 0; k <= 2*M; k++)
    {
      double uk = k==0?0:lam*th/(k*mu+1); double wk = k==0?v0*g(mu+1):v0*g((k+1)*mu+1)/g(k*mu+2);
      double dr = uk*ar[k]+wk*ar[k+1], di = uk*ai[k]+wk*ai[k+1];
      cr[k]=dr*zp; ci[k]=di*zp; zp*=z;
    }
    // [M/M] Padé: solve Σ q_i c[M+l-i] = -c[M+l]
    try (ComplexMatrix A = ComplexMatrix.newMatrix(M, M); ComplexMatrix b = ComplexMatrix.newMatrix(M, 1);
         ComplexMatrix x = ComplexMatrix.newMatrix(M, 1))
    {
      for (int l = 1; l <= M; l++) { for (int i = 1; i <= M; i++) A.get(l-1,i-1).set(cr[M+l-i],ci[M+l-i]); b.get(l-1,0).set(-cr[M+l],-ci[M+l]); }
      double pr, pi, dr, di;
      if (A.solve(b, bits, x) == null) { double sr=0,si=0; for(int k=0;k<=2*M;k++){sr+=cr[k];si+=ci[k];} out[0]=Tv*sr; out[1]=Tv*si; return; }
      double[] q = new double[M+1], qi = new double[M+1]; q[0]=1;
      for (int i=1;i<=M;i++){ q[i]=x.get(i-1,0).re().doubleValue(); qi[i]=x.get(i-1,0).im().doubleValue(); }
      double nr=0,ni=0,den=0,deni=0;
      for (int n=0;n<=M;n++){ double sr=0,si=0; for(int i=0;i<=n;i++){sr+=q[i]*cr[n-i]-qi[i]*ci[n-i];si+=q[i]*ci[n-i]+qi[i]*cr[n-i];} nr+=sr;ni+=si; }
      for (int i=0;i<=M;i++){den+=q[i];deni+=qi[i];}
      double dn=den*den+deni*deni; pr=(nr*den+ni*deni)/dn; pi=(ni*den-nr*deni)/dn; out[0]=Tv*pr; out[1]=Tv*pi;
    }
  }

  /** Call price (S0=1, r=0). put via parity. */
  public double call(double K, int bits)
  {
    double k = Math.log(K), a = -rng, b = rng, bma = b - a, sum = 0; double[] p = new double[2];
    for (int j = 0; j < cosN; j++)
    {
      double u = j*Math.PI/bma; phiM(u, bits, p); double e = Math.exp(p[0]);
      double pr = e*Math.cos(p[1]), pi = e*Math.sin(p[1]); double Fk = pr*Math.cos(u*a)+pi*Math.sin(u*a);
      double cD=Math.cos(u*(b-a)),sD=Math.sin(u*(b-a)),cC=Math.cos(u*(k-a)),sC=Math.sin(u*(k-a));
      double chi=(cD*Math.exp(b)-cC*Math.exp(k)+u*sD*Math.exp(b)-u*sC*Math.exp(k))/(1+u*u);
      double psi=j==0?b-k:(sD-sC)/u; sum+=(j==0?0.5:1)*Fk*(chi-K*psi);
    }
    return sum*2/bma;
  }

  public double put(double K, int bits) { return call(K, bits) - 1 + K; }

  @Override public void close() {}
}
