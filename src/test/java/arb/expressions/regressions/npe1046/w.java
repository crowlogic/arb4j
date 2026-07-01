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

public class w implements RealSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   private IndexCache<Real> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
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
   public Real vℝ0015;
   public Real vℝ0016;
   public Real vℝ0017;
   public Real vℝ0018;
   public Real vℝ0019;
   public Real vℝ0020;
   public Real vℝ0021;
   public Integer vℤ0006;

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

      if (order <= 1) {
         Real var11 = Function.peek(this.cache, k);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = k;
            this.V0
               .mul(
                  k.add(this.cℤ0000, bits, this.vℤ0006).mul(this.μ, bits, this.vℝ0015).add(this.cℤ0000, bits, this.vℝ0016).Γ(bits, this.vℝ0017),
                  bits,
                  this.vℝ0018
               )
               .div(k.mul(this.μ, bits, this.vℝ0019).add(this.cℤ0001, bits, this.vℝ0020).Γ(bits, this.vℝ0021), bits, result);
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

   @Override
   public void invalidateCache() {
      if (!this.invalidatingCache) {
         this.invalidatingCache = true;
         this.cache.clear();
         this.invalidatingCache = false;
      }
   }

   @Override
   public void invalidateLocalCache() {
      if (!this.invalidatingCache) {
         this.invalidatingCache = true;
         this.cache.clear();
         this.invalidatingCache = false;
      }
   }

   @Override
   public RealSequence derivative() {
      return Function.express(Integer.class, Real.class, RealSequence.class, "diffw", "diff((V0*Γ(((k+1)*μ)+1))/Γ((k*μ)+2),k)", this.context);
   }

   @Override
   public RealSequence integral() {
      return Function.express(Integer.class, Real.class, RealSequence.class, "intw", "int((V0*Γ(((k+1)*μ)+1))/Γ((k*μ)+2),k)", this.context);
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
         if (this.V0 == null) {
            throw new AssertionError("V0 is null");
         } else if (this.μ == null) {
            throw new AssertionError("μ is null");
         } else {
            this.isInitialized = true;
         }
      }
   }

   public w() {
      this.cache.ownsValues = true;
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.cℤ0001 = new Integer("2");
      this.vℝ0015 = new Real();
      this.vℝ0016 = new Real();
      this.vℝ0017 = new Real();
      this.vℝ0018 = new Real();
      this.vℝ0019 = new Real();
      this.vℝ0020 = new Real();
      this.vℝ0021 = new Real();
      this.vℤ0006 = new Integer();
   }

   @Override
   public void close() {
      if (!this.closed) {
         this.closed = true;
         if (this.cℤ0000 != null) {
            this.cℤ0000.close();
         }

         if (this.cℤ0001 != null) {
            this.cℤ0001.close();
         }

         if (this.vℝ0015 != null) {
            this.vℝ0015.close();
         }

         if (this.vℝ0016 != null) {
            this.vℝ0016.close();
         }

         if (this.vℝ0017 != null) {
            this.vℝ0017.close();
         }

         if (this.vℝ0018 != null) {
            this.vℝ0018.close();
         }

         if (this.vℝ0019 != null) {
            this.vℝ0019.close();
         }

         if (this.vℝ0020 != null) {
            this.vℝ0020.close();
         }

         if (this.vℝ0021 != null) {
            this.vℝ0021.close();
         }

         if (this.vℤ0006 != null) {
            this.vℤ0006.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
   }

   @Override
   public String getName() {
      return "w";
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
      return "w:k➔(V0*Γ(((k+1)*μ)+1))/Γ((k*μ)+2)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\left(V0 \\cdot \\Gamma(\\left(\\left(\\left(k + 1\\right) \\cdot μ\\right) + 1\\right))\\right)}{\\Gamma(\\left(\\left(k \\cdot μ\\right) + 2\\right))}";
   }
}
