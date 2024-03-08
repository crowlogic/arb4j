import arb.Integer;
import arb.functions.Function;

public class factorℤ1 implements Function<Integer, Integer> {
   public Integer n;

   public Integer evaluate(Integer in, int order, int bits, Integer result) {
      return result.set(in);
   }
}
