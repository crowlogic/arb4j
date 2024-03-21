import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class tanhln1PlusyTo2 implements RealFunction {
   Integer c1 = new Integer("1");
   Integer c2 = new Integer("2");
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
   public Real ℝ3 = new Real();

   public Real evaluate(Real in, int order, int bits, Real result) {
      return c1.add(in.pow(c2, bits, ℝ1), bits, ℝ2).log(bits, ℝ3).tanh(bits, result);
   }

   public void close() {
      c1.close();
      c2.close();
      ℝ1.close();
      ℝ2.close();
      ℝ3.close();
   }
}
