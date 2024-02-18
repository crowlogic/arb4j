import arb.Integer;
import arb.Real;
import arb.functions.real.RealNullaryFunction;

public class ∏2Timesk{k=1…3} implements RealNullaryFunction {
   Integer startIndex;
   Integer endIndex;
   public Real valuer1;
   public Integer k;
   public Real productr1;
   public final factorr1 factorr1 = new factorr1();

   public Real evaluate(Void in, int order, int bits, Real result) {
      productr1.multiplicativeIdentity();
      k.set(startIndex);

      do {
         productr1.mul(factorr1.evaluate(k, bits, valuer1), bits);
      } while(k.increment().compareTo(endIndex) <= 0);

      return result.set(productr1);
   }

   public _2Timesk_k_1_3_/* $VF was: ∏2Timesk{k=1…3}*/() {
      startIndex = new Integer("1");
      endIndex = new Integer("3");
      valuer1 = new Real();
      k = new Integer();
      productr1 = new Real();
   }

   public void close() {
      startIndex.close();
      endIndex.close();
      valuer1.close();
      k.close();
      productr1.close();
   }
}
