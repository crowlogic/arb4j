import arb.Real;
import arb.functions.real.RealFunction;

public class lntToThePowerOf2Plus1 implements RealFunction {
   int c1 = (int)(new int("2"));
   int c2 = (int)(new int("1"));
   public Real a;
   public Real α;
   public Real b;
   public Real r;
   public Real v;
   public Real x;
   public Real y;
   public Real z;
   public Real λ;
   public Real n;
   public Real ℝ1 = new Real();
   public Real ℝ2 = new Real();

   public Real evaluate(Real in, int order, int bits, Real result) {
      return in.pow(2, bits, ℝ1).add(1, bits, ℝ2).log(bits, result);
   }

   public void close() {
      c1.close();
      c2.close();
      ℝ1.close();
      ℝ2.close();
   }
}
