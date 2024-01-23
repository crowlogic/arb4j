import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class P implements Function<Integer, RealPolynomial> {
   private boolean isInitialized;
   public Integer const1;
   public Integer const2;
   public Integer const3;
   public Real α;
   public Real β;
   public Real ℝ1;
   public Real ℝ2;
   public RealPolynomial r1;
   public RealPolynomial r2;
   public RealPolynomial r3;
   public RealPolynomial r4;
   public Integer ℤ1;
   public RealPolynomial r5;
   public RealPolynomial r6;
   public Real ℝ3;
   public Real ℝ4;
   public Integer ℤ2;
   public RealPolynomial r7;
   public RealPolynomial r8;
   public RealPolynomial r9;
   public Real ℝ5;
   public Real ℝ6;
   public P P;
   public final A A = new A();
   public final B B = new B();
   public final C C = new C();
   public final E E = new E();

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      if (!this.isInitialized) {
         this.initializeVariableReferences();
      }

      if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else {
         return switch(in.getSignedValue()) {
            case 0 -> result.set(this.const2);
            case 1 -> ((Real)this.C.evaluate(this.ℝ1.set(this.const2), order, bits, this.ℝ2))
            .mul(result.identity(), bits, this.r1)
            .sub(this.β, bits, this.r2)
            .add(this.α, bits, this.r3)
            .div(this.const3, bits, result);
            default -> {
               RealPolynomial var5 = (RealPolynomial)this.A.evaluate(in, order, bits, this.r4);
               if (this.P == null) {
                  this.P = new P(this);
               }

               var5 = var5.mul((RealPolynomial)this.P.evaluate(in.sub(this.const2, bits, this.ℤ1), order, bits, this.r5), bits, this.r6);
               Real var10001 = (Real)this.B.evaluate(this.ℝ3.set(in), order, bits, this.ℝ4);
               if (this.P == null) {
                  this.P = new P(this);
               }

               yield var5.sub(
                     var10001.mul((RealPolynomial)this.P.evaluate(in.sub(this.const3, bits, this.ℤ2), order, bits, this.r7), bits, this.r8), bits, this.r9
                  )
                  .div((Real)this.E.evaluate(this.ℝ5.set(in), order, bits, this.ℝ6), bits, result);
            }
         };
      }
   }

   public P() {
      this.const1 = new Integer("0");
      this.const2 = new Integer("1");
      this.const3 = new Integer("2");
      this.ℝ1 = new Real();
      this.ℝ2 = new Real();
      this.r1 = new RealPolynomial();
      this.r2 = new RealPolynomial();
      this.r3 = new RealPolynomial();
      this.r4 = new RealPolynomial();
      this.ℤ1 = new Integer();
      this.r5 = new RealPolynomial();
      this.r6 = new RealPolynomial();
      this.ℝ3 = new Real();
      this.ℝ4 = new Real();
      this.ℤ2 = new Integer();
      this.r7 = new RealPolynomial();
      this.r8 = new RealPolynomial();
      this.r9 = new RealPolynomial();
      this.ℝ5 = new Real();
      this.ℝ6 = new Real();
   }

   public void initializeVariableReferences() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else if (this.α == null) {
         throw new AssertionError("α is null");
      } else if (this.β == null) {
         throw new AssertionError("β is null");
      } else {
         new A();
         this.A.α = this.α;
         this.A.β = this.β;
         new B();
         this.B.α = this.α;
         this.B.β = this.β;
         new C();
         this.C.α = this.α;
         this.C.β = this.β;
         new E();
         this.E.α = this.α;
         this.E.β = this.β;
         this.isInitialized = true;
      }
   }

   public P(P var1) {
      this();
      if (var1.α == null) {
         throw new AssertionError("α is null");
      } else if (var1.β == null) {
         throw new AssertionError("β is null");
      } else {
         this.α = var1.α;
         this.β = var1.β;
      }
   }

   public void close() {
      this.const1.close();
      this.const2.close();
      this.const3.close();
      this.ℝ1.close();
      this.ℝ2.close();
      this.r1.close();
      this.r2.close();
      this.r3.close();
      this.r4.close();
      this.ℤ1.close();
      this.r5.close();
      this.r6.close();
      this.ℝ3.close();
      this.ℝ4.close();
      this.ℤ2.close();
      this.r7.close();
      this.r8.close();
      this.r9.close();
      this.ℝ5.close();
      this.ℝ6.close();
      this.P.close();
   }
}
