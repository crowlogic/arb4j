package arb.fuckedup;

import arb.Complex;
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
import arb.functions.integer.ComplexPolynomialSequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import arb.functions.IndexCache;

public class Φnum implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomial> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public ΦnumoperandF0001 ΦnumoperandF0001;
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
            if (this.ΦnumoperandF0001.M == null) {
               this.ΦnumoperandF0001.M = new Integer();
            }

            this.ΦnumoperandF0001.M.set(M);
            this.sumXℂ0002.additiveIdentity();
            this.jXℂ0002ℤ0001.set(this.cℤ0000);
            Integer var12 = this.jXℂ0002ℤ0001;
            this.upperLimitℤ0002.set(M);

            while (var12.compareTo(this.upperLimitℤ0002) <= 0) {
               this.sumXℂ0002.add((ComplexPolynomial)this.ΦnumoperandF0001.evaluate(this.jXℂ0002ℤ0001, bits, this.valueXℂ0002), bits);
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
         if (this.ΦnumoperandF0001 != null) {
            this.ΦnumoperandF0001.invalidateCache(var1);
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
         if (this.ΦnumoperandF0001 == null) {
            Function var10001 = this.context.lookupFunctionInstance("ΦnumoperandF0001");
            if (var10001 != null) {
               this.ΦnumoperandF0001 = (ΦnumoperandF0001)var10001;
            } else {
               this.ΦnumoperandF0001 = new ΦnumoperandF0001();
               this.ΦnumoperandF0001.context = this.context;
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

         this.ΦnumoperandF0001.context = this.context;
         if (this.ΦnumoperandF0001.p0 == null) {
            this.ΦnumoperandF0001.p0 = this.p0;
         } else {
            this.ΦnumoperandF0001.p0.set(this.p0);
         }

         if (this.ΦnumoperandF0001.p1 == null) {
            this.ΦnumoperandF0001.p1 = this.p1;
         } else {
            this.ΦnumoperandF0001.p1.set(this.p1);
         }

         if (this.ΦnumoperandF0001.v == null) {
            this.ΦnumoperandF0001.v = this.v;
         } else {
            this.ΦnumoperandF0001.v.set(this.v);
         }

         if (this.ΦnumoperandF0001.μ == null) {
            this.ΦnumoperandF0001.μ = this.μ;
         } else {
            this.ΦnumoperandF0001.μ.set(this.μ);
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

         this.ΦnumoperandF0001.Pn = this.Pn;
         if (this.ΦnumoperandF0001.p0 == null) {
            this.ΦnumoperandF0001.p0 = new ComplexPolynomial();
         }

         this.ΦnumoperandF0001.p0.set(this.p0);
         if (this.ΦnumoperandF0001.p1 == null) {
            this.ΦnumoperandF0001.p1 = new ComplexPolynomial();
         }

         this.ΦnumoperandF0001.p1.set(this.p1);
         if (this.ΦnumoperandF0001.v == null) {
            this.ΦnumoperandF0001.v = new Complex();
         }

         this.ΦnumoperandF0001.v.set(this.v);
         if (this.ΦnumoperandF0001.μ == null) {
            this.ΦnumoperandF0001.μ = new Real();
         }

         this.ΦnumoperandF0001.μ.set(this.μ);
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
      this.cℤ0000.close();
      this.jXℂ0002ℤ0001.close();
      this.sumXℂ0002.close();
      this.upperLimitℤ0002.close();
      this.valueXℂ0002.close();
      this.ΦnumoperandF0001.close();
      this.Pn.close();
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
