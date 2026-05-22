package arb.fuckedup;

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
import arb.functions.integer.Sequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class aoperandF0001 implements Sequence<ComplexPolynomial>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   public final Integer cℤ0000 = new Integer("1");
   public a a;
   public Integer k;
   public ComplexPolynomial p;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer cseℤ0004 = new Integer();
   public ComplexPolynomial vXℂ0011 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0012 = new ComplexPolynomial();
   public Integer vℤ0004 = new Integer();
   public Integer vℤ0005 = new Integer();

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer j, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var9 = ((ComplexPolynomial)this.a.evaluate(j, order, bits, this.vXℂ0011))
            .mul(
               (ComplexPolynomial)this.a.evaluate(this.k.sub(this.cℤ0000, bits, this.vℤ0004).sub(j, bits, this.vℤ0005), order, bits, this.vXℂ0012),
               bits,
               result
            );
         var9.setIndependentVariableName("v");
         return var9;
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
            var10000.evaluate(j, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         if (this.a != null) {
            this.a.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.a == null) {
            Function var10001 = this.context.lookupFunctionInstance("a");
            if (var10001 != null) {
               this.a = (a)var10001;
            } else {
               this.a = new a();
               this.a.context = this.context;
            }
         }

         if (this.a.p == null) {
            this.a.p = this.p;
         } else {
            this.a.p.set(this.p);
         }

         if (this.a.q == null) {
            this.a.q = this.q;
         } else {
            this.a.q.set(this.q);
         }

         if (this.a.r == null) {
            this.a.r = this.r;
         } else {
            this.a.r.set(this.r);
         }

         if (this.a.μ == null) {
            this.a.μ = this.μ;
         } else {
            this.a.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cseℤ0004.close();
      this.vXℂ0011.close();
      this.vXℂ0012.close();
      this.vℤ0004.close();
      this.vℤ0005.close();
      this.a.close();
   }

   @Override
   public String getName() {
      return null;
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
      return String.format("j➔a(j)*a((%1$s-1)-j)", String.valueOf(this.k));
   }

   @Override
   public String typeset() {
      return "\\left(\\a\\left(j\\right) \\cdot \\a\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right)";
   }
}
