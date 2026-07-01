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
import arb.functions.integer.ComplexPolynomialSequence;
import java.util.ArrayList;

public class dd implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomial> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
   public da da;
   public w w;
   public u u;
   public Integer J;
   public Integer N;
   public Real T;
   public Real V0;
   public ComplexPolynomial p;
   public ComplexPolynomial pdv;
   public ComplexPolynomial q;
   public ComplexPolynomial qdv;
   public ComplexPolynomial r;
   public ComplexPolynomial rdv;
   public Real θ;
   public Real λ;
   public Real μ;
   public Real ν;
   public Real ρ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0051;
   public ComplexPolynomial vXℂ0052;
   public ComplexPolynomial vXℂ0053;
   public ComplexPolynomial vXℂ0054;
   public ComplexPolynomial vXℂ0055;
   public Real vℝ0041;
   public Real vℝ0042;
   public Real vℝ0043;
   public Integer vℤ0017;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer k, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var11 = Function.peek(this.cache, k);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = k;

            (switch (k.getSignedValue()) {
                  case 0 -> this.w.evaluate(this.cℤ0000, order, bits, this.vℝ0041).mul(this.da.evaluate(this.cℤ0001, order, bits, this.vXℂ0051), bits, result);
                  default -> this.u
                     .evaluate(k, order, bits, this.vℝ0042)
                     .mul(this.da.evaluate(k, order, bits, this.vXℂ0052), bits, this.vXℂ0053)
                     .add(
                        this.w
                           .evaluate(k, order, bits, this.vℝ0043)
                           .mul(this.da.evaluate(k.add(this.cℤ0001, bits, this.vℤ0017), order, bits, this.vXℂ0054), bits, this.vXℂ0055),
                        bits,
                        result
                     );
               })
               .setIndependentVariableName("v");
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
         if (this.u != null) {
            this.u.invalidateCache();
         }

         if (this.w != null) {
            this.w.invalidateCache();
         }

         if (this.da != null) {
            this.da.invalidateCache();
         }

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
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         if (this.context != null) {
            this.context.own(this);
         }

         this.derivativeCache = new ArrayList<>();
         if (this.u == null) {
            Function var10001 = this.context.lookupFunctionInstance("u");
            if (var10001 != null) {
               this.u = (u)var10001;
            } else {
               this.u = new u();
               this.u.context = this.context;
            }
         }

         if (this.w == null) {
            Function var1 = this.context.lookupFunctionInstance("w");
            if (var1 != null) {
               this.w = (w)var1;
            } else {
               this.w = new w();
               this.w.context = this.context;
            }
         }

         if (this.da == null) {
            Function var2 = this.context.lookupFunctionInstance("da");
            if (var2 != null) {
               this.da = (da)var2;
            } else {
               this.da = new da();
               this.da.context = this.context;
            }
         }

         if (this.da.ρ == null) {
            this.da.ρ = this.ρ;
         } else {
            this.da.ρ.set(this.ρ);
         }

         if (this.da.qdv == null) {
            this.da.qdv = this.qdv;
         } else {
            this.da.qdv.set(this.qdv);
         }

         if (this.da.pdv == null) {
            this.da.pdv = this.pdv;
         } else {
            this.da.pdv.set(this.pdv);
         }

         if (this.da.rdv == null) {
            this.da.rdv = this.rdv;
         } else {
            this.da.rdv.set(this.rdv);
         }

         if (this.da.J == null) {
            this.da.J = this.J;
         } else {
            this.da.J.set(this.J);
         }

         if (this.da.N == null) {
            this.da.N = this.N;
         } else {
            this.da.N.set(this.N);
         }

         if (this.da.p == null) {
            this.da.p = this.p;
         } else {
            this.da.p.set(this.p);
         }

         if (this.da.q == null) {
            this.da.q = this.q;
         } else {
            this.da.q.set(this.q);
         }

         if (this.da.r == null) {
            this.da.r = this.r;
         } else {
            this.da.r.set(this.r);
         }

         if (this.da.T == null) {
            this.da.T = this.T;
         } else {
            this.da.T.set(this.T);
         }

         if (this.da.θ == null) {
            this.da.θ = this.θ;
         } else {
            this.da.θ.set(this.θ);
         }

         if (this.da.V0 == null) {
            this.da.V0 = this.V0;
         } else {
            this.da.V0.set(this.V0);
         }

         if (this.da.λ == null) {
            this.da.λ = this.λ;
         } else {
            this.da.λ.set(this.λ);
         }

         if (this.da.μ == null) {
            this.da.μ = this.μ;
         } else {
            this.da.μ.set(this.μ);
         }

         if (this.da.ν == null) {
            this.da.ν = this.ν;
         } else {
            this.da.ν.set(this.ν);
         }

         if (this.w.ρ == null) {
            this.w.ρ = this.ρ;
         } else {
            this.w.ρ.set(this.ρ);
         }

         if (this.w.N == null) {
            this.w.N = this.N;
         } else {
            this.w.N.set(this.N);
         }

         if (this.w.p == null) {
            this.w.p = this.p;
         } else {
            this.w.p.set(this.p);
         }

         if (this.w.q == null) {
            this.w.q = this.q;
         } else {
            this.w.q.set(this.q);
         }

         if (this.w.r == null) {
            this.w.r = this.r;
         } else {
            this.w.r.set(this.r);
         }

         if (this.w.T == null) {
            this.w.T = this.T;
         } else {
            this.w.T.set(this.T);
         }

         if (this.w.θ == null) {
            this.w.θ = this.θ;
         } else {
            this.w.θ.set(this.θ);
         }

         if (this.w.V0 == null) {
            this.w.V0 = this.V0;
         } else {
            this.w.V0.set(this.V0);
         }

         if (this.w.λ == null) {
            this.w.λ = this.λ;
         } else {
            this.w.λ.set(this.λ);
         }

         if (this.w.μ == null) {
            this.w.μ = this.μ;
         } else {
            this.w.μ.set(this.μ);
         }

         if (this.w.ν == null) {
            this.w.ν = this.ν;
         } else {
            this.w.ν.set(this.ν);
         }

         if (this.u.ρ == null) {
            this.u.ρ = this.ρ;
         } else {
            this.u.ρ.set(this.ρ);
         }

         if (this.u.N == null) {
            this.u.N = this.N;
         } else {
            this.u.N.set(this.N);
         }

         if (this.u.p == null) {
            this.u.p = this.p;
         } else {
            this.u.p.set(this.p);
         }

         if (this.u.q == null) {
            this.u.q = this.q;
         } else {
            this.u.q.set(this.q);
         }

         if (this.u.r == null) {
            this.u.r = this.r;
         } else {
            this.u.r.set(this.r);
         }

         if (this.u.T == null) {
            this.u.T = this.T;
         } else {
            this.u.T.set(this.T);
         }

         if (this.u.θ == null) {
            this.u.θ = this.θ;
         } else {
            this.u.θ.set(this.θ);
         }

         if (this.u.V0 == null) {
            this.u.V0 = this.V0;
         } else {
            this.u.V0.set(this.V0);
         }

         if (this.u.λ == null) {
            this.u.λ = this.λ;
         } else {
            this.u.λ.set(this.λ);
         }

         if (this.u.μ == null) {
            this.u.μ = this.μ;
         } else {
            this.u.μ.set(this.μ);
         }

         if (this.u.ν == null) {
            this.u.ν = this.ν;
         } else {
            this.u.ν.set(this.ν);
         }

         this.isInitialized = true;
      }
   }

   public dd() {
      this.cache.ownsValues = true;
      this.context = new Context();
      this.cℤ0000 = new Integer("0");
      this.cℤ0001 = new Integer("1");
      this.vXℂ0051 = new ComplexPolynomial();
      this.vXℂ0052 = new ComplexPolynomial();
      this.vXℂ0053 = new ComplexPolynomial();
      this.vXℂ0054 = new ComplexPolynomial();
      this.vXℂ0055 = new ComplexPolynomial();
      this.vℝ0041 = new Real();
      this.vℝ0042 = new Real();
      this.vℝ0043 = new Real();
      this.vℤ0017 = new Integer();
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

         if (this.vXℂ0051 != null) {
            this.vXℂ0051.close();
         }

         if (this.vXℂ0052 != null) {
            this.vXℂ0052.close();
         }

         if (this.vXℂ0053 != null) {
            this.vXℂ0053.close();
         }

         if (this.vXℂ0054 != null) {
            this.vXℂ0054.close();
         }

         if (this.vXℂ0055 != null) {
            this.vXℂ0055.close();
         }

         if (this.vℝ0041 != null) {
            this.vℝ0041.close();
         }

         if (this.vℝ0042 != null) {
            this.vℝ0042.close();
         }

         if (this.vℝ0043 != null) {
            this.vℝ0043.close();
         }

         if (this.vℤ0017 != null) {
            this.vℤ0017.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
   }

   @Override
   public String getName() {
      return "dd";
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
      return "dd:k➔when(k=0,w(0)*da(1),else,(u(k)*da(k))+(w(k)*da(k+1)))";
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\left(\\w\\left(0\\right) \\cdot \\da\\left(1\\right)\\right) & \\\\text{if } \\left(k = 0\\right)\\\\\\\\\\n\\left(\\left(\\u\\left(k\\right) \\cdot \\da\\left(k\\right)\\right) + \\left(\\w\\left(k\\right) \\cdot \\da\\left(\\left(k + 1\\right)\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
