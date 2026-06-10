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

public class dΦoperandF0001 implements Sequence<ComplexPolynomial>, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   public final Integer cℤ0000 = new Integer("1");
   public dd dd;
   public Integer J;
   public Integer N;
   public Real S0;
   public Real T;
   public Real rr;
   public Real ε;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0002 = new ComplexPolynomial();
   public Real vℝ0004 = new Real();
   public Real vℝ0005 = new Real();
   public Real vℝ0006 = new Real();

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
         return this.T
            .pow(k.mul(this.μ, bits, this.vℝ0004).add(this.cℤ0000, bits, this.vℝ0005), bits, this.vℝ0006)
            .mul((ComplexPolynomial)this.dd.evaluate(k, order, bits, this.vXℂ0002), bits, result);
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
         if (this.dd != null) {
            this.dd.invalidateCache();
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
         if (this.T == null) {
            throw new AssertionError("T is null");
         } else if (this.μ == null) {
            throw new AssertionError("μ is null");
         } else {
            if (this.dd == null) {
               Function var10001 = this.context.lookupFunctionInstance("dd");
               if (var10001 != null) {
                  this.dd = (dd)var10001;
               } else {
                  this.dd = new dd();
                  this.dd.context = this.context;
               }
            }

            this.isInitialized = true;
         }
      }
   }

   @Override
   public void close() {
      if (!this.closed) {
         this.closed = true;
         if (this.cℤ0000 != null) {
            this.cℤ0000.close();
         }

         if (this.vXℂ0002 != null) {
            this.vXℂ0002.close();
         }

         if (this.vℝ0004 != null) {
            this.vℝ0004.close();
         }

         if (this.vℝ0005 != null) {
            this.vℝ0005.close();
         }

         if (this.vℝ0006 != null) {
            this.vℝ0006.close();
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
      return "k➔(T^((k*μ)+1))*dd(k)";
   }

   @Override
   public String typeset() {
      return "\\left({T}^{(\\left(\\left(k \\cdot μ\\right) + 1\\right))} \\cdot \\dd\\left(k\\right)\\right)";
   }
}
