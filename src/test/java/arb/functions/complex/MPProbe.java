package arb.functions.complex;
import arb.*;
public class MPProbe {
  public static void main(String[] x) {
    try (RiccatiMuntzPadeFunctional eq=new RiccatiMuntzPadeFunctional(new Real().set("1",256),"1","0","-1")) {
      Complex z=new Complex(); ComplexFunction approx=eq.evaluate(z,1,256,null);
      Complex t=new Complex(); Complex r=new Complex(); t.set("1",256);
      long s=System.nanoTime();
      try { approx.evaluate(t,1,256,r); System.out.printf("y(1)=%s  (%.1f ms)  true tanh(1)=0.7615941559557649%n", r.getReal().doubleValue(), (System.nanoTime()-s)/1e6); }
      catch(Throwable ex){ System.out.println("THREW "+ex); }
    }
  }
}
