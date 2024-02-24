import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class factorr̅1 implements Function<Integer, RealPolynomial> {
   Integer c1 = new Integer("1");
   public Integer n;
   public Integer p;
   public Integer q;
   public Real α;
   public Real β;
   public RealPolynomial r̅1 = new RealPolynomial();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      return α.get(in).risingFactorial(result.identity().sub(c1, bits, r̅1), bits, result);
   }

   public void close() {
      c1.close();
      r̅1.close();
   }
}
