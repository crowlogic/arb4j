import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class n∏xPlusk{k=1…nMinus1} implements Function<Integer, RealPolynomial> {
   Integer c1;
   public Real valueℝ1;
   public Integer k;
   public Real productℝ1;
   public Integer endIndexℤ1;
   public Integer ℤ1;
   public final factorℝ1 factorℝ1 = new factorℝ1();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      factorℝ1.n = in;
      productℝ1.multiplicativeIdentity();
      k.set(c1);
      endIndexℤ1.set(in.sub(c1, bits, ℤ1));

      do {
         productℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
      } while(k.increment().compareTo(endIndexℤ1) <= 0);

      return (result).set(productℝ1);
   }

   public n_xPlusk_k_1_nMinus1_/* $VF was: n∏xPlusk{k=1…nMinus1}*/() {
      c1 = new Integer("1");
      valueℝ1 = new Real();
      k = new Integer();
      productℝ1 = new Real();
      endIndexℤ1 = new Integer();
      ℤ1 = new Integer();
   }

   public void close() {
      c1.close();
      valueℝ1.close();
      k.close();
      productℝ1.close();
      endIndexℤ1.close();
      ℤ1.close();
   }
}
