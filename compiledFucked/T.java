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
import java.util.TreeMap;

public class T implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private final TreeMap<Integer, ComplexPolynomial> cache = new TreeMap<>();
   public final Integer cℤ0000;
   public m m;
   public β β;
   public ComplexPolynomial p;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0019;
   public ComplexPolynomial vXℂ0020;
   public ComplexPolynomial vXℂ0021;
   public ComplexPolynomial vXℂ0022;
   public Integer vℤ0010;

   @Override
   public Class<Integer> domainType() {
      return Integer.class;
   }

   @Override
   public Class<ComplexPolynomial> coDomainType() {
      return ComplexPolynomial.class;
   }

   @Override
   public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result) {
      if (result == null) {
         result = new ComplexPolynomial();
      }

      if (!this.isInitialized) {
         this.initialize();
      }

      if (order <= 1) {
         ComplexPolynomial var11 = (ComplexPolynomial)Function.peek(this.cache, n);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            TreeMap var9 = this.cache;
            Integer var10 = n;
            ((ComplexPolynomial)this.m.evaluate(n.add(this.cℤ0000, bits, this.vℤ0010), order, bits, this.vXℂ0019))
               .sub(
                  ((ComplexPolynomial)this.β.evaluate(n, order, bits, this.vXℂ0020))
                     .mul((ComplexPolynomial)this.m.evaluate(n, order, bits, this.vXℂ0021), bits, this.vXℂ0022),
                  bits,
                  result
               )
               .setIndependentVariableName("u");
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
            var10000.evaluate(n, 1, bits, var8);
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
         if (this.β != null) {
            this.β.invalidateCache(var1);
         }

         if (this.m != null) {
            this.m.invalidateCache(var1);
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
         if (this.β == null) {
            this.β = new β();
            this.β.context = this.context;
         }

         if (this.m == null) {
            this.m = new m();
            this.m.context = this.context;
         }

         if (this.m.p == null) {
            this.m.p = this.p;
         } else {
            this.m.p.set(this.p);
         }

         if (this.m.q == null) {
            this.m.q = this.q;
         } else {
            this.m.q.set(this.q);
         }

         if (this.m.r == null) {
            this.m.r = this.r;
         } else {
            this.m.r.set(this.r);
         }

         if (this.m.μ == null) {
            this.m.μ = this.μ;
         } else {
            this.m.μ.set(this.μ);
         }

         if (this.β.p == null) {
            this.β.p = this.p;
         } else {
            this.β.p.set(this.p);
         }

         if (this.β.p0 == null) {
            this.β.p0 = this.p0;
         } else {
            this.β.p0.set(this.p0);
         }

         if (this.β.q == null) {
            this.β.q = this.q;
         } else {
            this.β.q.set(this.q);
         }

         if (this.β.p1 == null) {
            this.β.p1 = this.p1;
         } else {
            this.β.p1.set(this.p1);
         }

         if (this.β.r == null) {
            this.β.r = this.r;
         } else {
            this.β.r.set(this.r);
         }

         if (this.β.μ == null) {
            this.β.μ = this.μ;
         } else {
            this.β.μ.set(this.μ);
         }

         this.isInitialized = true;
      }
   }

   public T() {
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.vXℂ0019 = new ComplexPolynomial();
      this.vXℂ0020 = new ComplexPolynomial();
      this.vXℂ0021 = new ComplexPolynomial();
      this.vXℂ0022 = new ComplexPolynomial();
      this.vℤ0010 = new Integer();
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.vXℂ0019.close();
      this.vXℂ0020.close();
      this.vXℂ0021.close();
      this.vXℂ0022.close();
      this.vℤ0010.close();
      this.β.close();
      this.m.close();
   }

   @Override
   public String getName() {
      return "T";
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
      return "T:n➔m(n+1)-(β(n)*m(n))";
   }

   @Override
   public String typeset() {
      return "\\left(\\m\\left(\\left(n + 1\\right)\\right)-\\left(\\β\\left(n\\right) \\cdot \\m\\left(n\\right)\\right)\\right)";
   }
}
