package arb.stochastic.processes.heston;
import junit.framework.TestCase;
/** Strict correctness of the Padé–Müntz/Lewis pricer vs published SINH-CB Table 1
 * (arxiv:2508.15080, T=1/252) — every strike to 1e-7 absolute. */
public class RoughHestonHermitePricerTest extends TestCase{
 public void testReproducesPublishedTable1(){
  RoughHestonHermitePricer p=new RoughHestonHermitePricer(.62,.1,.3156,.331,-.681,.0392,1.0/252);
  double[]K={.95,.975,1.0,1.025,1.05};double[]r={2.4557955e-7,1.29117047e-4,5.0111443104e-3,9.16277402e-5,3.3118e-8};
  for(int i=0;i<5;i++){double c=p.call(K[i],256);double otm=K[i]<1?c-1+K[i]:c;double d=Math.abs(otm-r[i]);
   assertTrue("K="+K[i]+" model="+otm+" ref="+r[i]+" |Δ|="+d,d<1e-7);}}
 public void testPutCallParity(){RoughHestonHermitePricer p=new RoughHestonHermitePricer(.62,.1,.3156,.331,-.681,.0392,1.0/52);
  double C=p.call(1.05,256),P=p.put(1.05,256);assertEquals(C-P,1-1.05,1e-9);}}
