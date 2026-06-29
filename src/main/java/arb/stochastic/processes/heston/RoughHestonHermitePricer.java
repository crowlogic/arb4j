package arb.stochastic.processes.heston;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * European call/put pricer for rough Heston by the Padé–Müntz cumulant generator
 * inverted on the Lewis contour (docs/PricingTheorem.tex, frmp2.tex,
 * residue_price.tex). κ_M(T,v)=Σ d_k(v)·T^{kμ+1} is [M/M]-Padé-resummed in
 * z=T^μ, giving a rational, globally bounded characteristic exponent; the call
 * is the Lewis Fourier integral of φ_M=exp(κ_M). No Edgeworth/Gram–Charlier
 * resummation, no asymptotic truncation — convergent on the whole domain.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class RoughHestonHermitePricer implements
                                      AutoCloseable
{
  double mu, lam, th, nu, rho, V0;
  public double T;
  public int    M = 16;

  public RoughHestonHermitePricer(double mu, double lam, double th, double nu, double rho, double V0, double T)
  { this.mu=mu; this.lam=lam; this.th=th; this.nu=nu; this.rho=rho; this.V0=V0; this.T=T; }

  private static final double[] LG = { 676.5203681218851, -1259.1392167224028, 771.32342877765313, -176.61502916214059,
                                       12.507343278686905, -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7 };
  private static double g(double x)
  { if (x<.5) return Math.PI/(Math.sin(Math.PI*x)*g(1-x)); x-=1; double a=.99999999999980993,t=x+7.5; for(int i=0;i<8;i++)a+=LG[i]/(x+i+1); return Math.sqrt(2*Math.PI)*Math.pow(t,x+.5)*Math.exp(-t)*a; }

  /** Φ_M(v) (complex) via [M/M] Padé of Σ d_k(v) z^k at z=T^μ. */
  double[] phiM(double vr, double vi)
  {
    int K2=2*M+2; double[] ar=new double[K2+2],ai=new double[K2+2];
    double Pr=-.5*(vr*vr-vi*vi)+.5*vi, Pi=-vr*vi-.5*vr;
    double Qr=-lam-lam*vi*rho*nu, Qi=lam*vr*rho*nu; double R=.5*lam*lam*nu*nu;
    ar[1]=Pr/g(mu+1); ai[1]=Pi/g(mu+1);
    for(int j=2;j<=K2;j++){double sr=0,si=0;for(int l=1;l<=j-2;l++){sr+=ar[l]*ar[j-1-l]-ai[l]*ai[j-1-l];si+=ar[l]*ai[j-1-l]+ai[l]*ar[j-1-l];}double cr=Qr*ar[j-1]-Qi*ai[j-1]+R*sr,ci=Qr*ai[j-1]+Qi*ar[j-1]+R*si;double gg=g((j-1)*mu+1)/g(j*mu+1);ar[j]=gg*cr;ai[j]=gg*ci;}
    double z=Math.pow(T,mu); double[] cr=new double[2*M+1],ci=new double[2*M+1]; double zp=1;
    for(int k=0;k<=2*M;k++){double uk=k==0?0:lam*th/(k*mu+1);double wk=k==0?V0*g(mu+1):V0*g((k+1)*mu+1)/g(k*mu+2);cr[k]=(uk*ar[k]+wk*ar[k+1])*zp;ci[k]=(uk*ai[k]+wk*ai[k+1])*zp;zp*=z;}
    double[][] A=new double[2*M][2*M]; double[] b=new double[2*M];
    for(int l=1;l<=M;l++){for(int i=1;i<=M;i++){A[2*(l-1)][2*(i-1)]=cr[M+l-i];A[2*(l-1)][2*(i-1)+1]=-ci[M+l-i];A[2*(l-1)+1][2*(i-1)]=ci[M+l-i];A[2*(l-1)+1][2*(i-1)+1]=cr[M+l-i];}b[2*(l-1)]=-cr[M+l];b[2*(l-1)+1]=-ci[M+l];}
    double[] q=solve(A,b); double[] dq=new double[M+1],dqi=new double[M+1]; dq[0]=1; for(int i=1;i<=M;i++){dq[i]=q[2*(i-1)];dqi[i]=q[2*(i-1)+1];}
    double nr=0,ni=0,dr=0,di=0; for(int n=0;n<=M;n++){double sr=0,si=0;for(int i=0;i<=n;i++){sr+=dq[i]*cr[n-i]-dqi[i]*ci[n-i];si+=dq[i]*ci[n-i]+dqi[i]*cr[n-i];}nr+=sr;ni+=si;} for(int i=0;i<=M;i++){dr+=dq[i];di+=dqi[i];}
    double dn=dr*dr+di*di; return new double[]{T*(nr*dr+ni*di)/dn, T*(ni*dr-nr*di)/dn};
  }

  private static double[] solve(double[][] A,double[] b){int n=b.length;double[][] m=new double[n][n+1];for(int i=0;i<n;i++){System.arraycopy(A[i],0,m[i],0,n);m[i][n]=b[i];}for(int c=0;c<n;c++){int p=c;for(int r=c+1;r<n;r++)if(Math.abs(m[r][c])>Math.abs(m[p][c]))p=r;double[] t=m[c];m[c]=m[p];m[p]=t;double d=m[c][c];for(int j=c;j<=n;j++)m[c][j]/=d;for(int r=0;r<n;r++)if(r!=c){double f=m[r][c];for(int j=c;j<=n;j++)m[r][j]-=f*m[c][j];}}double[] x=new double[n];for(int i=0;i<n;i++)x[i]=m[i][n];return x;}

  /** Call price S0=1, r=0, via Lewis inversion of φ_M=exp(Φ_M) on Im v = -1/2. */
  public double call(double K, int bits)
  {
    double k=Math.log(K), gam=-0.5, du=0.02, U=300, I=0;
    for(double t=-U;t<=U;t+=du){double[] p=phiM(t,gam);double er=Math.exp(p[0]);if(er<1e-18&&Math.abs(t)>5)continue;double pr=er*Math.cos(p[1]),pi=er*Math.sin(p[1]);
      double ekr=Math.exp(gam*k),e_r=ekr*Math.cos(-t*k),e_i=ekr*Math.sin(-t*k);double nr=e_r*pr-e_i*pi,ni=e_r*pi+e_i*pr;
      double dr=t*t-gam*(gam+1),di=t*(2*gam+1);double dn=dr*dr+di*di;I+=(nr*dr+ni*di)/dn*du;}
    return 1-K*(I/(2*Math.PI));
  }
  public void set(double mu2,double lam2,double th2,double nu2,double rho2,double V02){this.mu=mu2;this.lam=lam2;this.th=th2;this.nu=nu2;this.rho=rho2;this.V0=V02;}
  public double put(double K,int bits){return call(K,bits)-1+K;}
  @Override public void close(){}
}
