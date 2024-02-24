import arb.Integer;
import arb.RealPolynomial;
import arb.functions.Function;

public class n∏xPlusk{k=1…nMinus1} implements Function<Integer, RealPolynomial> {
   Integer c1;
   public RealPolynomial valuer̅1;
   public Integer k;
   public RealPolynomial productr̅1;
   public Integer endIndexℤ1;
   public Integer ℤ1;
   public final factorr̅1 factorr̅1 = new factorr̅1();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      factorr̅1.n = in;
      productr̅1.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ1.set(in.sub(c1, bits, ℤ1));

      do {
         productr̅1.mul(factorr̅1.evaluate(k, bits, valuer̅1), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      return result.set(productr̅1);
   }

   public n_xPlusk_k_1_nMinus1_/* $VF was: n∏xPlusk{k=1…nMinus1}*/() {
      c1 = new Integer("1");
      valuer̅1 = new RealPolynomial();
      k = new Integer();
      productr̅1 = new RealPolynomial();
      endIndexℤ1 = new Integer();
      ℤ1 = new Integer();
   }

   public void close() {
      c1.close();
      valuer̅1.close();
      k.close();
      productr̅1.close();
      endIndexℤ1.close();
      ℤ1.close();
   }
}
