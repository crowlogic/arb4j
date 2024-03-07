import arb.Real;
import arb.functions.real.RealFunction;

public class 1Plus2Plus3 implements RealFunction {
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
   public int i1 = (int)(new int());

   public Real evaluate(Real in, int order, int bits, Real result) {
      return 1.add(2, bits, i1).add(3, bits, result);
   }

   public void close() {
      i1.close();
   }
}
