import arb.Real;
import arb.functions.real.RealFunction;

public class aMinusbTimesJZeroλTimest implements RealFunction {
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
      return a.sub(b.mul(λ.mul(in, bits, ℝ1).J0(bits, ℝ2), bits, ℝ3), bits, result);
   }

   public void close() {
      ℝ1.close();
      ℝ2.close();
      ℝ3.close();
   }
}
