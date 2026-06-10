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
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import java.util.ArrayList;

public class dΦ implements ComplexPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context = new Context();
   public Expression expression;
   public final Integer cℤ0000 = new Integer("0");
   public dΦoperandF0001 dΦoperandF0001;
   public dd dd;
   public Integer J;
   public Integer N;
   public Real S0;
   public Real T;
   public Real rr;
   public Real ε;
   public Real μ;
   public ArrayList<Function<Object, ComplexPolynomial>> derivativeCache;
   public Integer kXℂ0002ℤ0001 = new Integer();
   public ComplexPolynomial sumXℂ0002 = new ComplexPolynomial();
   public Integer upperLimitℤ0002 = new Integer();
   public ComplexPolynomial valueXℂ0002 = new ComplexPolynomial();

   @Override
   public Class<Object> domainType() {
      return Object.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Object in, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         this.sumXℂ0002.additiveIdentity();
         this.kXℂ0002ℤ0001.set(this.cℤ0000);
         Integer var9 = this.kXℂ0002ℤ0001;
         this.upperLimitℤ0002.set(this.N);

         while (var9.compareTo(this.upperLimitℤ0002) <= 0) {
            this.sumXℂ0002.add(this.dΦoperandF0001.evaluate(this.kXℂ0002ℤ0001, bits, this.valueXℂ0002), bits);
            var9 = this.kXℂ0002ℤ0001.increment();
         }

         return result.set(this.sumXℂ0002);
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
            var10000.evaluate(in, 1, bits, var8);
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

         if (this.dΦoperandF0001 != null) {
            this.dΦoperandF0001.invalidateCache();
         }

         this.invalidatingCache = false;
      }
   }

   @Override
   public Function integral() {
      return this.evaluate().integral();
   }

   @Override
   public Function derivative() {
      return this.evaluate().derivative();
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
         if (this.N == null) {
            throw new AssertionError("N is null");
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

            if (this.dΦoperandF0001 == null) {
               Function var1 = this.context.lookupFunctionInstance("dΦoperandF0001");
               if (var1 != null) {
                  this.dΦoperandF0001 = (dΦoperandF0001)var1;
               } else {
                  this.dΦoperandF0001 = new dΦoperandF0001();
                  this.dΦoperandF0001.context = this.context;
               }
            }

            this.dΦoperandF0001.context = this.context;
            if (this.dΦoperandF0001.rr == null) {
               this.dΦoperandF0001.rr = this.rr;
            } else {
               this.dΦoperandF0001.rr.set(this.rr);
            }

            if (this.dΦoperandF0001.T == null) {
               this.dΦoperandF0001.T = this.T;
            } else {
               this.dΦoperandF0001.T.set(this.T);
            }

            if (this.dΦoperandF0001.ε == null) {
               this.dΦoperandF0001.ε = this.ε;
            } else {
               this.dΦoperandF0001.ε.set(this.ε);
            }

            if (this.dΦoperandF0001.J == null) {
               this.dΦoperandF0001.J = this.J;
            } else {
               this.dΦoperandF0001.J.set(this.J);
            }

            if (this.dΦoperandF0001.μ == null) {
               this.dΦoperandF0001.μ = this.μ;
            } else {
               this.dΦoperandF0001.μ.set(this.μ);
            }

            if (this.dΦoperandF0001.S0 == null) {
               this.dΦoperandF0001.S0 = this.S0;
            } else {
               this.dΦoperandF0001.S0.set(this.S0);
            }

            if (this.dΦoperandF0001.N == null) {
               this.dΦoperandF0001.N = this.N;
            } else {
               this.dΦoperandF0001.N.set(this.N);
            }

            this.dΦoperandF0001.dd = this.dd;
            if (this.dΦoperandF0001.rr == null) {
               this.dΦoperandF0001.rr = new Real();
            }

            this.dΦoperandF0001.rr.set(this.rr);
            if (this.dΦoperandF0001.T == null) {
               this.dΦoperandF0001.T = new Real();
            }

            this.dΦoperandF0001.T.set(this.T);
            if (this.dΦoperandF0001.ε == null) {
               this.dΦoperandF0001.ε = new Real();
            }

            this.dΦoperandF0001.ε.set(this.ε);
            if (this.dΦoperandF0001.J == null) {
               this.dΦoperandF0001.J = new Integer();
            }

            this.dΦoperandF0001.J.set(this.J);
            if (this.dΦoperandF0001.μ == null) {
               this.dΦoperandF0001.μ = new Real();
            }

            this.dΦoperandF0001.μ.set(this.μ);
            if (this.dΦoperandF0001.S0 == null) {
               this.dΦoperandF0001.S0 = new Real();
            }

            this.dΦoperandF0001.S0.set(this.S0);
            if (this.dΦoperandF0001.N == null) {
               this.dΦoperandF0001.N = new Integer();
            }

            this.dΦoperandF0001.N.set(this.N);
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

         if (this.kXℂ0002ℤ0001 != null) {
            this.kXℂ0002ℤ0001.close();
         }

         if (this.sumXℂ0002 != null) {
            this.sumXℂ0002.close();
         }

         if (this.upperLimitℤ0002 != null) {
            this.upperLimitℤ0002.close();
         }

         if (this.valueXℂ0002 != null) {
            this.valueXℂ0002.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
   }

   @Override
   public String getName() {
      return "dΦ";
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
      return "dΦ:Σk➔(T^((k*μ)+1))*dd(k){k=0…N}";
   }

   @Override
   public String typeset() {
      return "\\sum_{k = 0}^{N}{\\left({T}^{(\\left(\\left(k \\cdot μ\\right) + 1\\right))} \\cdot \\dd\\left(k\\right)\\right)}";
   }
}
