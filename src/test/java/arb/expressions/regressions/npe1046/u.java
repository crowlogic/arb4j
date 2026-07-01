package arb.expressions.regressions.npe1046;

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
import arb.functions.IndexCache;
import arb.functions.integer.RealSequence;
import java.util.ArrayList;

public class u implements RealSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   public int staticPrecision;
   protected Context context;
   public Expression expression;
   private IndexCache<Real> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public Integer N;
   public Real T;
   public Real V0;
   public ComplexPolynomial p;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real θ;
   public Real λ;
   public Real μ;
   public Real ν;
   public Real ρ;
   public ArrayList<Function<Integer, Real>> derivativeCache;
   public Real staticℝ0001;
   public Real vℝ0012;
   public Real vℝ0013;
   public Real vℝ0014;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<Real> coDomainType() {
      return Real.class;
   }

   @Override
   public Real evaluate(Integer k, int order, int bits, Real result) {
      if (!this.isInitialized) {
         this.initialize();
      }

      if (this.staticPrecision < bits) {
         this.evaluateStaticSubexpressions(k, order, bits, result);
      }

      if (order <= 1) {
         Real var11 = Function.peek(this.cache, k);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = k;
            this.staticℝ0001.div(k.mul(this.μ, bits, this.vℝ0012).add(this.cℤ0000, bits, this.vℝ0013), bits, result);
            Real var7 = new Real();
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
            Object var8 = result.get(var5);
            var10000.evaluate(k, 1, bits, var8);
            if (var5 >= 2) {
               ((Field)var8).div((int)var6, bits, (Field)var8);
            }
         }

         return result;
      }
   }

   public Object evaluateStaticSubexpressions(Object var1, int var2, int var3, Object var4) {
      this.staticℝ0001 = this.θ.mul(this.λ, var3, this.vℝ0014);
      this.staticPrecision = var3;
      return null;
   }

   @Override
   public void invalidateCache() {
      if (!this.invalidatingCache) {
         this.invalidatingCache = true;
         this.staticPrecision = -1;
         this.cache.clear();
         this.invalidatingCache = false;
      }
   }

   @Override
   public void invalidateLocalCache() {
      if (!this.invalidatingCache) {
         this.invalidatingCache = true;
         this.staticPrecision = -1;
         this.cache.clear();
         this.invalidatingCache = false;
      }
   }

   @Override
   public RealSequence derivative() {
      return Function.express(Integer.class, Real.class, RealSequence.class, "diffu", "diff((θ*λ)/((k*μ)+1),k)", this.context);
   }

   @Override
   public RealSequence integral() {
      return Function.express(Integer.class, Real.class, RealSequence.class, "intu", "int((θ*λ)/((k*μ)+1),k)", this.context);
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         if (this.context != null) {
            this.context.own(this);
         }

         this.derivativeCache = new ArrayList<>();
         if (this.θ == null) {
            throw new AssertionError("θ is null");
         } else if (this.λ == null) {
            throw new AssertionError("λ is null");
         } else if (this.μ == null) {
            throw new AssertionError("μ is null");
         } else {
            this.isInitialized = true;
         }
      }
   }

   public u() {
      this.cache.ownsValues = true;
      this.staticPrecision = -1;
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.staticℝ0001 = new Real();
      this.vℝ0012 = new Real();
      this.vℝ0013 = new Real();
      this.vℝ0014 = new Real();
   }

   @Override
   public void close() {
      if (!this.closed) {
         this.closed = true;
         if (this.cℤ0000 != null) {
            this.cℤ0000.close();
         }

         if (this.staticℝ0001 != null) {
            this.staticℝ0001.close();
         }

         if (this.vℝ0012 != null) {
            this.vℝ0012.close();
         }

         if (this.vℝ0013 != null) {
            this.vℝ0013.close();
         }

         if (this.vℝ0014 != null) {
            this.vℝ0014.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
   }

   @Override
   public String getName() {
      return "u";
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
      return "u:k➔(θ*λ)/((k*μ)+1)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(θ \\cdot λ\\right)}{\\left(\\left(k \\cdot μ\\right) + 1\\right)}";
   }
}
