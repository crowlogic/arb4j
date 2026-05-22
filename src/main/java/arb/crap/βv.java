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

public class βv implements ComplexSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<Complex> cache = new IndexCache();
   private boolean evaluating;
   public β β;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, Complex>> derivativeCache;
   public ComplexPolynomial vXℂ0018;

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

   private Object evaluate_body(Integer n, int order, int bits, Complex result) {
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
            var11 = (Complex)((ComplexPolynomial)this.β.evaluate(n, order, bits, this.vXℂ0018)).evaluate(this.v, order, bits, result);
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
         if (this.β != null) {
            this.β.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public ComplexSequence derivative() {
      return Function.express(Integer.class, Complex.class, ComplexSequence.class, "diffβv", "diff(β(n)(v),n)", this.context);
   }

   @Override
   public ComplexSequence integral() {
      return Function.express(Integer.class, Complex.class, ComplexSequence.class, "intβv", "int(β(n)(v),n)", this.context);
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
            if (this.β == null) {
               Function var10001 = this.context.lookupFunctionInstance("β");
               if (var10001 != null) {
                  this.β = (β)var10001;
               } else {
                  this.β = new β();
                  this.β.context = this.context;
               }
            }

            if (this.β.p0 == null) {
               this.β.p0 = this.p0;
            } else {
               this.β.p0.set(this.p0);
            }

            if (this.β.p1 == null) {
               this.β.p1 = this.p1;
            } else {
               this.β.p1.set(this.p1);
            }

            if (this.β.v == null) {
               this.β.v = this.v;
            } else {
               this.β.v.set(this.v);
            }

            if (this.β.μ == null) {
               this.β.μ = this.μ;
            } else {
               this.β.μ.set(this.μ);
            }

            this.isInitialized = true;
         }
      }
   }

   public βv() {
      this.context = new Context();
      this.vXℂ0018 = new ComplexPolynomial();
   }

   @Override
   public void close() {
      if (this.vXℂ0018 != this) {
         this.vXℂ0018.close();
      }

      if (this.β != null) {
         AutoCloseable var10001 = (AutoCloseable)this.β;
         this.β = null;
         var10001.close();
      }
   }

   @Override
   public String getName() {
      return "βv";
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
      return "βv:n➔β(n)(v)";
   }

   @Override
   public String typeset() {
      return "\\β\\left(n\\right)\\left(v\\right)";
   }
}
