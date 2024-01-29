import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class x₍₃₎ implements RealFunction {
   Integer c1 = new Integer("3");

   public Real evaluate(Real in, int order, int bits, Real result) {
      return c1.risingFactorial(c1, bits, result);
   }

   public void close() {
      c1.close();
   }
}
