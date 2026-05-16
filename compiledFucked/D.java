import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class D implements ComplexPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context = new Context();
   public Expression expression;
   public final Integer cℤ0000 = new Integer("2");
   public final Integer cℤ0001 = new Integer("4");
   public R R;
   public Q Q;
   public P P;
   public ComplexPolynomial p;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Object, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0001 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0002 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0003 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0004 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0005 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0006 = new ComplexPolynomial();

   @Override
   public Class<Object> domainType() {
      return Object.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Object in, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         return ((ComplexPolynomial)this.Q.evaluate(null, order, bits, this.vXℂ0001))
            .pow(this.cℤ0000, bits, this.vXℂ0002)
            .sub(
               this.cℤ0001
                  .mul((ComplexPolynomial)this.P.evaluate(null, order, bits, this.vXℂ0003), bits, this.vXℂ0004)
                  .mul((ComplexPolynomial)this.R.evaluate(null, order, bits, this.vXℂ0005), bits, this.vXℂ0006),
               bits,
               result
            );
      } else {
         if (this.derivativeCache == null) {
            this.derivativeCache = new ArrayList<>();
         }

         if (this.derivativeCache.size() == 0) {
            this.derivativeCache.add(this);
         }

         long var6 = 1L;

         for (int var5 = 0; var5 < order; var5++) {
            if (var5 > 0) {
               var6 *= var5;
            }

            while (this.derivativeCache.size() <= var5) {
               this.derivativeCache.add(this.derivativeCache.get(this.derivativeCache.size() - 1).derivative());
            }

            Function var10000 = this.derivativeCache.get(var5);
            Object var8 = ((Field)result).get(var5);
            var10000.evaluate(in, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         if (this.P != null) {
            this.P.invalidateCache(var1);
         }

         if (this.Q != null) {
            this.Q.invalidateCache(var1);
         }

         if (this.R != null) {
            this.R.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public Function integral() {
      return ((ComplexPolynomial)this.evaluate()).integral();
   }

   @Override
   public Function derivative() {
      return ((ComplexPolynomial)this.evaluate()).derivative();
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.P == null) {
            this.P = new P();
            this.P.context = this.context;
         }

         if (this.Q == null) {
            this.Q = new Q();
            this.Q.context = this.context;
         }

         if (this.R == null) {
            this.R = new R();
            this.R.context = this.context;
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.vXℂ0001.close();
      this.vXℂ0002.close();
      this.vXℂ0003.close();
      this.vXℂ0004.close();
      this.vXℂ0005.close();
      this.vXℂ0006.close();
      this.P.close();
      this.Q.close();
      this.R.close();
   }

   @Override
   public String getName() {
      return "D";
   }

   @Override
   public Context getContext() {
      return this.context;
   }

   @Override
   public Expression getExpression() {
      return this.expression;
   }

   @Override
   public String toString() {
      return "D:(Q()^2)-((4*P())*R())";
   }

   @Override
   public String typeset() {
      return "\\left({\\Q\\left(\\right)}^{2}-\\left(\\left(4 \\cdot \\P\\left(\\right)\\right) \\cdot \\R\\left(\\right)\\right)\\right)";
   }
}
