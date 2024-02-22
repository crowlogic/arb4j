import arb.Integer;
import arb.functions.Function;

public class factorℤ1 implements Function<Integer, Integer> {
   Integer c1 = new Integer("1");
   public Integer n;
   public Integer ℤ1 = new Integer();

   public Integer evaluate(Integer in, int order, int bits, Integer result) {
      return in.risingFactorial(n.sub(c1, bits, ℤ1), bits, result);
   }

   public void close() {
      c1.close();
      ℤ1.close();
   }
}
