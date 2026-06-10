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

public class daoperandF0002 implements Sequence<ComplexPolynomial>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   public final Integer cℤ0000 = new Integer("1");
   public da da;
   public a a;
   public Integer k;
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
   public ComplexPolynomial cseXℂ0003 = new ComplexPolynomial();
   public Integer cseℤ0010 = new Integer();
   public Integer cseℤ0011 = new Integer();
   public Integer cseℤ0017 = new Integer();
   public Integer cseℤ0018 = new Integer();
   public Integer cseℤ0019 = new Integer();
   public Integer cseℤ0020 = new Integer();
   public Integer cseℤ0021 = new Integer();
   public ComplexPolynomial vXℂ0040 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0041 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0042 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0043 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0044 = new ComplexPolynomial();
   public ComplexPolynomial vXℂ0045 = new ComplexPolynomial();
   public Integer vℤ0013 = new Integer();
   public Integer vℤ0014 = new Integer();

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
         ComplexPolynomial var9 = this.da.evaluate(j, order, bits, this.vXℂ0040);
         a var10001 = this.a;
         this.cseℤ0019 = this.k.sub(this.cℤ0000, bits, this.vℤ0013).sub(j, bits, this.vℤ0014);
         var9 = var9.mul(var10001.evaluate(this.cseℤ0019, order, bits, this.vXℂ0041), bits, this.vXℂ0042)
            .add(
               this.a.evaluate(j, order, bits, this.vXℂ0043).mul(this.da.evaluate(this.cseℤ0019, order, bits, this.vXℂ0044), bits, this.vXℂ0045), bits, result
            );
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

         if (this.da != null) {
            this.da.invalidateCache();
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

         if (this.da == null) {
            Function var1 = this.context.lookupFunctionInstance("da");
            if (var1 != null) {
               this.da = (da)var1;
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

         if (this.a.ρ == null) {
            this.a.ρ = this.ρ;
         } else {
            this.a.ρ.set(this.ρ);
         }

         if (this.a.N == null) {
            this.a.N = this.N;
         } else {
            this.a.N.set(this.N);
         }

         if (this.a.p == null) {
            this.a.p = this.p;
         } else {
            this.a.p.set(this.p);
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

         this.da.a = this.a;
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

         if (this.cseXℂ0003 != null) {
            this.cseXℂ0003.close();
         }

         if (this.cseℤ0010 != null) {
            this.cseℤ0010.close();
         }

         if (this.cseℤ0011 != null) {
            this.cseℤ0011.close();
         }

         if (this.cseℤ0017 != null) {
            this.cseℤ0017.close();
         }

         if (this.cseℤ0018 != null) {
            this.cseℤ0018.close();
         }

         if (this.cseℤ0019 != null) {
            this.cseℤ0019.close();
         }

         if (this.cseℤ0020 != null) {
            this.cseℤ0020.close();
         }

         if (this.cseℤ0021 != null) {
            this.cseℤ0021.close();
         }

         if (this.vXℂ0040 != null) {
            this.vXℂ0040.close();
         }

         if (this.vXℂ0041 != null) {
            this.vXℂ0041.close();
         }

         if (this.vXℂ0042 != null) {
            this.vXℂ0042.close();
         }

         if (this.vXℂ0043 != null) {
            this.vXℂ0043.close();
         }

         if (this.vXℂ0044 != null) {
            this.vXℂ0044.close();
         }

         if (this.vXℂ0045 != null) {
            this.vXℂ0045.close();
         }

         if (this.vℤ0013 != null) {
            this.vℤ0013.close();
         }

         if (this.vℤ0014 != null) {
            this.vℤ0014.close();
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
      return String.format("j➔(da(j)*a((%1$s-1)-j))+(a(j)*da((%1$s-1)-j))", String.valueOf(this.k));
   }

   @Override
   public String typeset() {
      return "\\left(\\left(\\da\\left(j\\right) \\cdot \\a\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right) + \\left(\\a\\left(j\\right) \\cdot \\da\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right)\\right)";
   }
}
