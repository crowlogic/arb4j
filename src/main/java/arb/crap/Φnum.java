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
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class Φnum implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomial> cache = new IndexCache();
   private boolean evaluating;
   public final Integer cℤ0000;
   public operandF0002 operandF0002;
   public Pn Pn;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public Complex v;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer jXℂ0002ℤ0001;
   public ComplexPolynomial sumXℂ0002;
   public Integer upperLimitℤ0002;
   public ComplexPolynomial valueXℂ0002;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer M, int order, int bits, ComplexPolynomial result) {
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

         return (ComplexPolynomial)var10000;
      }
   }

   private Object evaluate_body(Integer M, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var11 = (ComplexPolynomial)Function.peek(this.cache, M);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = M;
            if (this.operandF0002.M == null) {
               this.operandF0002.M = new Integer();
            }

            this.operandF0002.M.set(M);
            this.sumXℂ0002.additiveIdentity();
            this.jXℂ0002ℤ0001.set(this.cℤ0000);
            Integer var12 = this.jXℂ0002ℤ0001;
            this.upperLimitℤ0002.set(M);

            while (var12.compareTo(this.upperLimitℤ0002) <= 0) {
               this.sumXℂ0002.add((ComplexPolynomial)this.operandF0002.evaluate(this.jXℂ0002ℤ0001, bits, this.valueXℂ0002), bits);
               var12 = this.jXℂ0002ℤ0001.increment();
            }

            result.set(this.sumXℂ0002);
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
         if (this.operandF0002 != null) {
            this.operandF0002.invalidateCache(var1);
         }

         if (this.Pn != null) {
            this.Pn.invalidateCache(var1);
         }
      }
   }

   public void invalidateCache() {
      this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
   }

   @Override
   public void initialize() {
      if (this.isInitialized) {
         throw new AssertionError("Already initialized");
      } else {
         this.derivativeCache = new ArrayList<>();
         if (this.operandF0002 == null) {
            Function var10001 = this.context.lookupFunctionInstance("operandF0002");
            if (var10001 != null) {
               this.operandF0002 = (operandF0002)var10001;
            } else {
               this.operandF0002 = new operandF0002();
               this.operandF0002.context = this.context;
            }
         }

         if (this.Pn == null) {
            Function var1 = this.context.lookupFunctionInstance("Pn");
            if (var1 != null) {
               this.Pn = (Pn)var1;
            } else {
               this.Pn = new Pn();
               this.Pn.context = this.context;
            }
         }

         this.operandF0002.context = this.context;
         if (this.operandF0002.p0 == null) {
            this.operandF0002.p0 = this.p0;
         } else {
            this.operandF0002.p0.set(this.p0);
         }

         if (this.operandF0002.p1 == null) {
            this.operandF0002.p1 = this.p1;
         } else {
            this.operandF0002.p1.set(this.p1);
         }

         if (this.operandF0002.v == null) {
            this.operandF0002.v = this.v;
         } else {
            this.operandF0002.v.set(this.v);
         }

         if (this.operandF0002.μ == null) {
            this.operandF0002.μ = this.μ;
         } else {
            this.operandF0002.μ.set(this.μ);
         }

         if (this.Pn.p0 == null) {
            this.Pn.p0 = this.p0;
         } else {
            this.Pn.p0.set(this.p0);
         }

         if (this.Pn.p1 == null) {
            this.Pn.p1 = this.p1;
         } else {
            this.Pn.p1.set(this.p1);
         }

         if (this.Pn.v == null) {
            this.Pn.v = this.v;
         } else {
            this.Pn.v.set(this.v);
         }

         if (this.Pn.μ == null) {
            this.Pn.μ = this.μ;
         } else {
            this.Pn.μ.set(this.μ);
         }

         this.operandF0002.Pn = this.Pn;
         if (this.operandF0002.p0 == null) {
            this.operandF0002.p0 = new ComplexPolynomial();
         }

         this.operandF0002.p0.set(this.p0);
         if (this.operandF0002.p1 == null) {
            this.operandF0002.p1 = new ComplexPolynomial();
         }

         this.operandF0002.p1.set(this.p1);
         if (this.operandF0002.v == null) {
            this.operandF0002.v = new Complex();
         }

         this.operandF0002.v.set(this.v);
         if (this.operandF0002.μ == null) {
            this.operandF0002.μ = new Real();
         }

         this.operandF0002.μ.set(this.μ);
         this.isInitialized = true;
      }
   }

   public Φnum() {
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.jXℂ0002ℤ0001 = new Integer();
      this.sumXℂ0002 = new ComplexPolynomial();
      this.upperLimitℤ0002 = new Integer();
      this.valueXℂ0002 = new ComplexPolynomial();
   }

   @Override
   public void close() {
      if (this.cℤ0000 != this) {
         this.cℤ0000.close();
      }

      if (this.jXℂ0002ℤ0001 != this) {
         this.jXℂ0002ℤ0001.close();
      }

      if (this.sumXℂ0002 != this) {
         this.sumXℂ0002.close();
      }

      if (this.upperLimitℤ0002 != this) {
         this.upperLimitℤ0002.close();
      }

      if (this.valueXℂ0002 != this) {
         this.valueXℂ0002.close();
      }

      if (this.operandF0002 != null) {
         AutoCloseable var10005 = (AutoCloseable)this.operandF0002;
         this.operandF0002 = null;
         var10005.close();
      }

      if (this.Pn != null) {
         AutoCloseable var1 = (AutoCloseable)this.Pn;
         this.Pn = null;
         var1.close();
      }
   }

   @Override
   public String getName() {
      return "Φnum";
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
      return "Φnum:Σj➔(Pn(%s)[%s-j])*(z^j){j=1…M}";
   }

   @Override
   public String typeset() {
      return "\\sum_{j = 1}^{M}{\\left(\\Pn\\left(M\\right)_{\\left(M-j\\right)} \\cdot {z}^{j}\\right)}";
   }
}
