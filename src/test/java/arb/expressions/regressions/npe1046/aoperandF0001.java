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
import arb.functions.integer.Sequence;
import java.util.ArrayList;

public class aoperandF0001 implements Sequence<ComplexPolynomial>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   public final Integer cℤ0000 = new Integer("1");
   public a a;
   public Integer k;
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
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer cseℤ0004 = new Integer();
   public ComplexPolynomial vXℂ0022 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0023 = new ComplexPolynomial();
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
         ComplexPolynomial var9 = this.a
            .evaluate(j, order, bits, this.vXℂ0022)
            .mul(this.a.evaluate(this.k.sub(this.cℤ0000, bits, this.vℤ0004).sub(j, bits, this.vℤ0005), order, bits, this.vXℂ0023), bits, result);
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

   @Override
   public void invalidateCache() {
      if (!this.invalidatingCache) {
         this.invalidatingCache = true;
         if (this.a != null) {
            this.a.invalidateCache();
         }

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

         if (this.a.ρ == null) {
            this.a.ρ = this.ρ;
         } else {
            this.a.ρ.set(this.ρ);
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

         if (this.a.T == null) {
            this.a.T = this.T;
         } else {
            this.a.T.set(this.T);
         }

         if (this.a.θ == null) {
            this.a.θ = this.θ;
         } else {
            this.a.θ.set(this.θ);
         }

         if (this.a.V0 == null) {
            this.a.V0 = this.V0;
         } else {
            this.a.V0.set(this.V0);
         }

         if (this.a.λ == null) {
            this.a.λ = this.λ;
         } else {
            this.a.λ.set(this.λ);
         }

         if (this.a.μ == null) {
            this.a.μ = this.μ;
         } else {
            this.a.μ.set(this.μ);
         }

         if (this.a.ν == null) {
            this.a.ν = this.ν;
         } else {
            this.a.ν.set(this.ν);
         }

         if (this.a.N == null) {
            this.a.N = this.N;
         } else {
            this.a.N.set(this.N);
         }

         this.isInitialized = true;
      }
   }

   @Override
   public void close() {
      if (!this.closed) {
         this.closed = true;
         if (this.cℤ0000 != null) {
            this.cℤ0000.close();
         }

         if (this.cseℤ0004 != null) {
            this.cseℤ0004.close();
         }

         if (this.vXℂ0022 != null) {
            this.vXℂ0022.close();
         }

         if (this.vXℂ0023 != null) {
            this.vXℂ0023.close();
         }

         if (this.vℤ0004 != null) {
            this.vℤ0004.close();
         }

         if (this.vℤ0005 != null) {
            this.vℤ0005.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
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
