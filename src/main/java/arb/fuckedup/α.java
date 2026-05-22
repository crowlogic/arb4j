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
import arb.functions.IndexCache;

public class α implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomial> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public σ σ;
   public h h;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomialSequence vSXℂ0007;
   public ComplexPolynomial vXℂ0015;
   public ComplexPolynomial vXℂ0016;
   public Integer vℤ0010;

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
         ComplexPolynomial var11 = (ComplexPolynomial)Function.peek(this.cache, j);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = j;
            ((ComplexPolynomial)((ComplexPolynomialSequence)this.σ.evaluate(j, order, bits, this.vSXℂ0007))
                  .evaluate(j.add(this.cℤ0000, bits, this.vℤ0010), order, bits, this.vXℂ0015))
               .div((ComplexPolynomial)this.h.evaluate(j, order, bits, this.vXℂ0016), bits, result);
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
         this.cache.clear();
         if (this.σ != null) {
            this.σ.invalidateCache(var1);
         }

         if (this.h != null) {
            this.h.invalidateCache(var1);
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
         if (this.σ == null) {
            Function var10001 = this.context.lookupFunctionInstance("σ");
            if (var10001 != null) {
               this.σ = (σ)var10001;
            } else {
               this.σ = new σ();
               this.σ.context = this.context;
            }
         }

         if (this.h == null) {
            Function var1 = this.context.lookupFunctionInstance("h");
            if (var1 != null) {
               this.h = (h)var1;
            } else {
               this.h = new h();
               this.h.context = this.context;
            }
         }

         if (this.σ.p0 == null) {
            this.σ.p0 = this.p0;
         } else {
            this.σ.p0.set(this.p0);
         }

         if (this.σ.p1 == null) {
            this.σ.p1 = this.p1;
         } else {
            this.σ.p1.set(this.p1);
         }

         if (this.σ.v == null) {
            this.σ.v = this.v;
         } else {
            this.σ.v.set(this.v);
         }

         if (this.σ.μ == null) {
            this.σ.μ = this.μ;
         } else {
            this.σ.μ.set(this.μ);
         }

         this.h.σ = this.σ;
         if (this.h.p0 == null) {
            this.h.p0 = this.p0;
         } else {
            this.h.p0.set(this.p0);
         }

         if (this.h.p1 == null) {
            this.h.p1 = this.p1;
         } else {
            this.h.p1.set(this.p1);
         }

         if (this.h.v == null) {
            this.h.v = this.v;
         } else {
            this.h.v.set(this.v);
         }

         if (this.h.μ == null) {
            this.h.μ = this.μ;
         } else {
            this.h.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   public α() {
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.vXℂ0015 = new ComplexPolynomial();
      this.vXℂ0016 = new ComplexPolynomial();
      this.vℤ0010 = new Integer();
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.vSXℂ0007.close();
      this.vXℂ0015.close();
      this.vXℂ0016.close();
      this.vℤ0010.close();
      this.σ.close();
      this.h.close();
   }

   @Override
   public String getName() {
      return "α";
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
      return "α:j➔(σ(j)(j+1))/h(j)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\σ\\left(j\\right)\\left(\\left(j + 1\\right)\\right)}{\\h\\left(j\\right)}";
   }
}
