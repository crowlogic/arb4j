import arb.Integer;
import arb.RealPolynomial;
import arb.functions.Function;

public class factorr̅1 implements Function<Integer, RealPolynomial> {
   public Integer n;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      return result.identity().add(in, bits, result);
   }
}
