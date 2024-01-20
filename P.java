import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class P implements Function<Integer, RealPolynomial> {
   public Integer const1 = new Integer("0");
   public Integer const2 = new Integer("1");
   public Integer const3 = new Integer("2");
   public Real α;
   public Real β;
   public Real r1 = new Real();
   public Real r2 = new Real();
   public RealPolynomial rp1 = new RealPolynomial();
   public RealPolynomial rp2 = new RealPolynomial();
   public RealPolynomial rp3 = new RealPolynomial();
   public RealPolynomial rp4 = new RealPolynomial();
   public Integer i1 = new Integer();
   public RealPolynomial rp5 = new RealPolynomial();
   public RealPolynomial rp6 = new RealPolynomial();
   public Real r3 = new Real();
   public Real r4 = new Real();
   public Integer i2 = new Integer();
   public RealPolynomial rp7 = new RealPolynomial();
   public RealPolynomial rp8 = new RealPolynomial();
   public RealPolynomial rp9 = new RealPolynomial();
   public Real r5 = new Real();
   public Real r6 = new Real();
   public Function<Integer, RealPolynomial> P;
   public Function<Integer, RealPolynomial> A;
   public Function<Real, Real> B;
   public Function<Real, Real> C;
   public Function<Real, Real> E;

   public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result) {
      return switch(in.getSignedValue()) {
         case 0 -> result.set(this.const2);
         case 1 -> ((Real)this.C.evaluate(this.r1.set(this.const2), order, bits, this.r2))
         .mul(result.identity(), bits, this.rp1)
         .sub(this.β, bits, this.rp2)
         .add(this.α, bits, this.rp3)
         .div(this.const3, bits, result);
         default -> {
            RealPolynomial var5 = (RealPolynomial)this.A.evaluate(in, order, bits, this.rp4);
            if (this.P == null) {
               this.P = new P(this);
            }

            var5 = var5.mul((RealPolynomial)this.P.evaluate(in.sub(this.const2, bits, this.i1), order, bits, this.rp5), bits, this.rp6);
            Real var10001 = (Real)this.B.evaluate(this.r3.set(in), order, bits, this.r4);
            if (this.P == null) {
               this.P = new P(this);
            }

            yield var5.sub(
                  var10001.mul((RealPolynomial)this.P.evaluate(in.sub(this.const3, bits, this.i2), order, bits, this.rp7), bits, this.rp8), bits, this.rp9
               )
               .div((Real)this.E.evaluate(this.r5.set(in), order, bits, this.r6), bits, result);
         }
      };
   }

   public P() {
      this.initializeContextualFunctions();
   }

   public void initializeContextualFunctions() {
      this.A = new A();
      this.B = new B();
      this.C = new C();
      this.E = new E();
   }

   public P(P var1) {
      this();
      this.α = var1.α;
      this.β = var1.β;
   }

   public void close() {
      this.const1.close();
      this.const2.close();
      this.const3.close();
      this.r1.close();
      this.r2.close();
      this.rp1.close();
      this.rp2.close();
      this.rp3.close();
      this.rp4.close();
      this.i1.close();
      this.rp5.close();
      this.rp6.close();
      this.r3.close();
      this.r4.close();
      this.i2.close();
      this.rp7.close();
      this.rp8.close();
      this.rp9.close();
      this.r5.close();
      this.r6.close();
      this.P.close();
   }
}
