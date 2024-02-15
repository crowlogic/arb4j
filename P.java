import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class P implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   Integer c1;
   Integer c2;
   Integer c3;
   public Real α;
   public Real β;
   public Real ℝ1;
   public Real ℝ2;
   public RealPolynomial r̅1;
   public RealPolynomial r̅2;
   public RealPolynomial r̅3;
   public RealPolynomial r̅4;
   public Integer ℤ1;
   public RealPolynomial r̅5;
   public RealPolynomial r̅6;
   public Real ℝ3;
   public Real ℝ4;
   public Integer ℤ2;
   public RealPolynomial r̅7;
   public RealPolynomial r̅8;
   public RealPolynomial r̅9;
   public Real ℝ5;
   public Real ℝ6;
   public P P;
   public final A A = new A();
   public final B B = new B();
   public final C C = new C();
   public final E E = new E();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!isInitialized) {
         initialize();
      }
      return switch(in.getSignedValue()) {
         case 0 -> result.set(c2);
         case 1 -> (C.evaluate(ℝ1.set(c2), order, bits, ℝ2))
         .mul(result.identity(), bits, r̅1)
         .sub(β, bits, r̅2)
         .add(α, bits, r̅3)
         .div(c3, bits, result);
         default -> (A.evaluate(in, order, bits, r̅4))
         .mul(P.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅5), bits, r̅6)
         .sub(
            (B.evaluate(ℝ3.set(in), order, bits, ℝ4))
               .mul(P.evaluate(in.sub(c3, bits, ℤ2), order, bits, r̅7), bits, r̅8),
            bits,
            r̅9
         )
         .div(E.evaluate(ℝ5.set(in), order, bits, ℝ6), bits, result);
      };
   }

   public P() {
      c1 = new Integer("0");
      c2 = new Integer("1");
      c3 = new Integer("2");
      ℝ1 = new Real();
      ℝ2 = new Real();
      r̅1 = new RealPolynomial();
      r̅2 = new RealPolynomial();
      r̅3 = new RealPolynomial();
      r̅4 = new RealPolynomial();
      ℤ1 = new Integer();
      r̅5 = new RealPolynomial();
      r̅6 = new RealPolynomial();
      ℝ3 = new Real();
      ℝ4 = new Real();
      ℤ2 = new Integer();
      r̅7 = new RealPolynomial();
      r̅8 = new RealPolynomial();
      r̅9 = new RealPolynomial();
      ℝ5 = new Real();
      ℝ6 = new Real();
   }

   public void initialize() {
      if (isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (α == null) {
         throw new AssertionError("α is null");
      } else if (β == null) {
         throw new AssertionError("β is null");
      } else {
         A.α = α;
         A.β = β;
         B.α = α;
         B.β = β;
         C.α = α;
         C.β = β;
         E.α = α;
         E.β = β;
         P = new P();
         P.α = α;
         P.β = β;
         isInitialized = true;
      }
   }

   public void close() {
      c1.close();
      c2.close();
      c3.close();
      ℝ1.close();
      ℝ2.close();
      r̅1.close();
      r̅2.close();
      r̅3.close();
      r̅4.close();
      ℤ1.close();
      r̅5.close();
      r̅6.close();
      ℝ3.close();
      ℝ4.close();
      ℤ2.close();
      r̅7.close();
      r̅8.close();
      r̅9.close();
      ℝ5.close();
      ℝ6.close();
      P.close();
   }
}
