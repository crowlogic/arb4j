package arb.fuckedup;

import arb.Complex;
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
import arb.functions.integer.ComplexPolynomialSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.TreeMap;

public class Bops implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private TreeMap<Integer, ComplexPolynomial> cache = new TreeMap<>();
   public α α;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0034;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var11 = (ComplexPolynomial)Function.peek(this.cache, n);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            TreeMap var9 = this.cache;
            Integer var10 = n;
            ((ComplexPolynomial)this.α.evaluate(n, order, bits, this.vXℂ0034)).neg(result);
            ComplexPolynomial var7 = new ComplexPolynomial();
            var7.set(result);
            Function.poke(var9, var10, var7);
            return result;
         }
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
            var10000.evaluate(n, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         this.cache.clear();
         if (this.α != null) {
            this.α.invalidateCache(var1);
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
         if (this.α == null) {
            Function var10001 = this.context.lookupFunctionInstance("α");
            if (var10001 != null) {
               this.α = (α)var10001;
            } else {
               this.α = new α();
               this.α.context = this.context;
            }
         }

         if (this.α.p0 == null) {
            this.α.p0 = this.p0;
         } else {
            this.α.p0.set(this.p0);
         }

         if (this.α.p1 == null) {
            this.α.p1 = this.p1;
         } else {
            this.α.p1.set(this.p1);
         }

         if (this.α.v == null) {
            this.α.v = this.v;
         } else {
            this.α.v.set(this.v);
         }

         if (this.α.μ == null) {
            this.α.μ = this.μ;
         } else {
            this.α.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   public Bops() {
      this.context = new Context();
      this.vXℂ0034 = new ComplexPolynomial();
   }

   @Override
   public void close() {
      this.vXℂ0034.close();
      this.α.close();
   }

   @Override
   public String getName() {
      return "Bops";
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
      return "Bops:n➔-α(n)";
   }

   @Override
   public String typeset() {
      return "-(\\α\\left(n\\right))";
   }
}
