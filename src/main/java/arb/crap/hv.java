package arb.crap;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.IndexCache;
import arb.functions.integer.ComplexSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class hv implements ComplexSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<Complex> cache = new IndexCache();
   private boolean evaluating;
   public h h;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, Complex>> derivativeCache;
   public ComplexPolynomial vXℂ0019;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<Complex> coDomainType() {
      return Complex.class;
   }

   @Override
   public Complex evaluate(Integer n, int order, int bits, Complex result) {
      if (this.evaluating) {
         throw new CompilerException("re-entrant evaluate() call on same instance");
      } else {
         this.evaluating = true;

         Object var10000;
         try {
            var10000 = this.evaluate_body(n, order, bits, result);
         } finally {
            this.evaluating = false;
         }

         return (Complex)var10000;
      }
   }

   private Object evaluate_body(Object n, int order, int bits, Object result) {
      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         Complex var11 = (Complex)Function.peek(this.cache, n);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = n;
            var11 = (Complex)((ComplexPolynomial)this.h.evaluate(n, order, bits, this.vXℂ0019)).evaluate(this.v, order, bits, result);
            Complex var7 = new Complex();
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
         if (this.h != null) {
            this.h.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public ComplexSequence derivative() {
      return Function.express(Integer.class, Complex.class, ComplexSequence.class, "diffhv", "diff(h(n)(v),n)", this.context);
   }

   @Override
   public ComplexSequence integral() {
      return Function.express(Integer.class, Complex.class, ComplexSequence.class, "inthv", "int(h(n)(v),n)", this.context);
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.v == null) {
            throw new AssertionError("v is null");
         } else {
            if (this.h == null) {
               Function var10001 = this.context.lookupFunctionInstance("h");
               if (var10001 != null) {
                  this.h = (h)var10001;
               } else {
                  this.h = new h();
                  this.h.context = this.context;
               }
            }

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
   }

   public hv() {
      this.context = new Context();
      this.vXℂ0019 = new ComplexPolynomial();
   }

   @Override
   public void close() {
      if (this.vXℂ0019 != this) {
         this.vXℂ0019.close();
      }

      if (this.h != null) {
         AutoCloseable var10001 = (AutoCloseable)this.h;
         this.h = null;
         var10001.close();
      }
   }

   @Override
   public String getName() {
      return "hv";
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
      return "hv:n➔h(n)(v)";
   }

   @Override
   public String typeset() {
      return "\\h\\left(n\\right)\\left(v\\right)";
   }
}
