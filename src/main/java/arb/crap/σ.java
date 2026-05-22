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
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexPolynomialSequenceSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class σ implements ComplexPolynomialSequenceSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomialSequence> cache = new IndexCache();
   private boolean evaluating;
   public α α;
   public σ σ;
   public m m;
   public β β;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomialSequence>> derivativeCache;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomialSequence> coDomainType() {
      return ComplexPolynomialSequence.class;
   }

   @Override
   public ComplexPolynomialSequence evaluate(Integer j, int order, int bits, ComplexPolynomialSequence result) {
      if (this.evaluating) {
         throw new CompilerException("re-entrant evaluate() call on same instance");
      } else {
         this.evaluating = true;

         Object var10000;
         try {
            var10000 = this.evaluate_body(j, order, bits, result);
         } finally {
            this.evaluating = false;
         }

         return (ComplexPolynomialSequence)var10000;
      }
   }

   private Object evaluate_body(Object j, int order, int bits, Object result) {
      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomialSequence var11 = (ComplexPolynomialSequence)Function.peek(this.cache, j);
         if (var11 != null) {
            return var11;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = j;
            σfunc var12 = new σfunc();
            if (var12.j == null) {
               var12.j = new Integer();
            }

            var12.j.set(j);
            var12.p0 = this.p0;
            var12.p1 = this.p1;
            var12.v = this.v;
            var12.μ = this.μ;
            var12.α = this.α;
            var12.β = this.β;
            var12.m = this.m;
            var12.context = this.context;
            var12.initialize();
            Function.poke(var9, var10, var12);
            return var12;
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
         if (this.α != null) {
            this.α.invalidateCache(var1);
         }

         if (this.β != null) {
            this.β.invalidateCache(var1);
         }

         if (this.σ != null) {
            this.σ.invalidateCache(var1);
         }

         if (this.m != null) {
            this.m.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public ComplexPolynomialSequenceSequence derivative() {
      return Function.express(
         Integer.class,
         ComplexPolynomialSequence.class,
         ComplexPolynomialSequenceSequence.class,
         "diffσ",
         "diff(when(j=0,m(k),j=1,(σ(0)(k+1))-(α(0)*(σ(0)(k))),else,((σ(j-1)(k+1))-(α(j-1)*(σ(j-1)(k))))-(β(j-1)*(σ(j-2)(k)))),j)",
         this.context
      );
   }

   @Override
   public ComplexPolynomialSequenceSequence integral() {
      return Function.express(
         Integer.class,
         ComplexPolynomialSequence.class,
         ComplexPolynomialSequenceSequence.class,
         "intσ",
         "int(when(j=0,m(k),j=1,(σ(0)(k+1))-(α(0)*(σ(0)(k))),else,((σ(j-1)(k+1))-(α(j-1)*(σ(j-1)(k))))-(β(j-1)*(σ(j-2)(k)))),j)",
         this.context
      );
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

         if (this.β == null) {
            Function var1 = this.context.lookupFunctionInstance("β");
            if (var1 != null) {
               this.β = (β)var1;
            } else {
               this.β = new β();
               this.β.context = this.context;
            }
         }

         if (this.m == null) {
            Function var2 = this.context.lookupFunctionInstance("m");
            if (var2 != null) {
               this.m = (m)var2;
            } else {
               this.m = new m();
               this.m.context = this.context;
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

         this.α.σ = this.σ;
         if (this.m.v == null) {
            this.m.v = this.v;
         } else {
            this.m.v.set(this.v);
         }

         if (this.m.μ == null) {
            this.m.μ = this.μ;
         } else {
            this.m.μ.set(this.μ);
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

   public σ() {
      this.context = new Context();
   }

   @Override
   public String getName() {
      return "σ";
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
      return "σ:j➔when(%s=0,m(k),%s=1,(σ(0)(k+1))-(α(0)*(σ(0)(k))),else,((σ(%s-1)(k+1))-(α(%s-1)*(σ(%s-1)(k))))-(β(%s-1)*(σ(%s-2)(k))))";
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\m\\left(k\\right) & \\\\text{if } \\left(j = 0\\right)\\\\\\\\\\n\\left(\\σ\\left(0\\right)\\left(\\left(k + 1\\right)\\right)-\\left(\\α\\left(0\\right) \\cdot \\σ\\left(0\\right)\\left(k\\right)\\right)\\right) & \\\\text{if } \\left(j = 1\\right)\\\\\\\\\\n\\left(\\left(\\σ\\left(\\left(j-1\\right)\\right)\\left(\\left(k + 1\\right)\\right)-\\left(\\α\\left(\\left(j-1\\right)\\right) \\cdot \\σ\\left(\\left(j-1\\right)\\right)\\left(k\\right)\\right)\\right)-\\left(\\β\\left(\\left(j-1\\right)\\right) \\cdot \\σ\\left(\\left(j-2\\right)\\right)\\left(k\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
