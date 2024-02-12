import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factor implements Function<Integer, Real> {
   public Integer k;

   public Real evaluate(Integer in, int order, int bits, Real result) {
      return result.set(in);
   }
}
