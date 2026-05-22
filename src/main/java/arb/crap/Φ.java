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
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class Φ implements ComplexFunctionSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexFunction> cache = new IndexCache();
   private boolean evaluating;
   public Φden Φden;
   public Φnum Φnum;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexFunction>> derivativeCache;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexFunction> coDomainType() {
      return ComplexFunction.class;
   }

   @Override
   public ComplexFunction evaluate(Integer M, int order, int bits, ComplexFunction result) {
      if (this.evaluating) {
         throw new CompilerException("re-entrant evaluate() call on same instance");
      } else {
         this.evaluating = true;

         Object var10000;
         try {
            var10000 = this.evaluate_body(M, order, bits, result);
         } finally {
            this.evaluating = false;
         }

         return (ComplexFunction)var10000;
      }
   }

   private Object evaluate_body(Object M, int order, int bits, Object result) {
      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexFunction var11 = (ComplexFunction)Function.peek(this.cache, M);
         if (var11 != null) {
            return var11;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = M;
            Φfunc var12 = new Φfunc();
            if (var12.M == null) {
               var12.M = new Integer();
            }

            var12.M.set(M);
            var12.p0 = this.p0;
            var12.p1 = this.p1;
            var12.v = this.v;
            var12.μ = this.μ;
            var12.Φnum = this.Φnum;
            var12.Φden = this.Φden;
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
            var10000.evaluate(M, 1, bits, var8);
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
         if (this.Φnum != null) {
            this.Φnum.invalidateCache(var1);
         }

         if (this.Φden != null) {
            this.Φden.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public ComplexFunctionSequence derivative() {
      return Function.express(Integer.class, ComplexFunction.class, ComplexFunctionSequence.class, "diffΦ", "diff((Φnum(M)(z))/(Φden(M)(z)),M)", this.context);
   }

   @Override
   public ComplexFunctionSequence integral() {
      return Function.express(Integer.class, ComplexFunction.class, ComplexFunctionSequence.class, "intΦ", "int((Φnum(M)(z))/(Φden(M)(z)),M)", this.context);
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.Φnum == null) {
            Function var10001 = this.context.lookupFunctionInstance("Φnum");
            if (var10001 != null) {
               this.Φnum = (Φnum)var10001;
            } else {
               this.Φnum = new Φnum();
               this.Φnum.context = this.context;
            }
         }

         if (this.Φden == null) {
            Function var1 = this.context.lookupFunctionInstance("Φden");
            if (var1 != null) {
               this.Φden = (Φden)var1;
            } else {
               this.Φden = new Φden();
               this.Φden.context = this.context;
            }
         }

         if (this.Φden.p0 == null) {
            this.Φden.p0 = this.p0;
         } else {
            this.Φden.p0.set(this.p0);
         }

         if (this.Φden.p1 == null) {
            this.Φden.p1 = this.p1;
         } else {
            this.Φden.p1.set(this.p1);
         }

         if (this.Φden.v == null) {
            this.Φden.v = this.v;
         } else {
            this.Φden.v.set(this.v);
         }

         if (this.Φden.μ == null) {
            this.Φden.μ = this.μ;
         } else {
            this.Φden.μ.set(this.μ);
         }

         if (this.Φnum.p0 == null) {
            this.Φnum.p0 = this.p0;
         } else {
            this.Φnum.p0.set(this.p0);
         }

         if (this.Φnum.p1 == null) {
            this.Φnum.p1 = this.p1;
         } else {
            this.Φnum.p1.set(this.p1);
         }

         if (this.Φnum.v == null) {
            this.Φnum.v = this.v;
         } else {
            this.Φnum.v.set(this.v);
         }

         if (this.Φnum.μ == null) {
            this.Φnum.μ = this.μ;
         } else {
            this.Φnum.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   public Φ() {
      this.context = new Context();
   }

   @Override
   public String getName() {
      return "Φ";
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
      return "Φ:M➔(Φnum(%s)(z))/(Φden(%s)(z))";
   }

   @Override
   public String typeset() {
      return "\\frac{\\Φnum\\left(M\\right)\\left(z\\right)}{\\Φden\\left(M\\right)\\left(z\\right)}";
   }
}
