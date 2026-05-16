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

public class α implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private final TreeMap<Integer, ComplexPolynomial> cache = new TreeMap<>();
   public S S;
   public T T;
   public ComplexPolynomial p;
   public ComplexPolynomial p0;
   public ComplexPolynomial p1;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public ComplexPolynomial vXℂ0017;
   public ComplexPolynomial vXℂ0018;

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
            ((ComplexPolynomial)this.T.evaluate(n, order, bits, this.vXℂ0017))
               .div((ComplexPolynomial)this.S.evaluate(n, order, bits, this.vXℂ0018), bits, result)
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
         if (this.S != null) {
            this.S.invalidateCache(var1);
         }

         if (this.T != null) {
            this.T.invalidateCache(var1);
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
         if (this.S == null) {
            this.S = new S();
            this.S.context = this.context;
         }

         if (this.T == null) {
            this.T = new T();
            this.T.context = this.context;
         }

         this.S.S = this.S;
         this.S.T = this.T;
         this.S.α = this;
         if (this.S.p == null) {
            this.S.p = this.p;
         } else {
            this.S.p.set(this.p);
         }

         if (this.S.p0 == null) {
            this.S.p0 = this.p0;
         } else {
            this.S.p0.set(this.p0);
         }

         if (this.S.q == null) {
            this.S.q = this.q;
         } else {
            this.S.q.set(this.q);
         }

         if (this.S.p1 == null) {
            this.S.p1 = this.p1;
         } else {
            this.S.p1.set(this.p1);
         }

         if (this.S.r == null) {
            this.S.r = this.r;
         } else {
            this.S.r.set(this.r);
         }

         if (this.S.μ == null) {
            this.S.μ = this.μ;
         } else {
            this.S.μ.set(this.μ);
         }

         if (this.T.p == null) {
            this.T.p = this.p;
         } else {
            this.T.p.set(this.p);
         }

         if (this.T.p0 == null) {
            this.T.p0 = this.p0;
         } else {
            this.T.p0.set(this.p0);
         }

         if (this.T.q == null) {
            this.T.q = this.q;
         } else {
            this.T.q.set(this.q);
         }

         if (this.T.p1 == null) {
            this.T.p1 = this.p1;
         } else {
            this.T.p1.set(this.p1);
         }

         if (this.T.r == null) {
            this.T.r = this.r;
         } else {
            this.T.r.set(this.r);
         }

         if (this.T.μ == null) {
            this.T.μ = this.μ;
         } else {
            this.T.μ.set(this.μ);
         }

         this.S.T = this.T;
         this.isInitialized = true;
      }
   }

   public α() {
      this.context = new Context();
      this.vXℂ0017 = new ComplexPolynomial();
      this.vXℂ0018 = new ComplexPolynomial();
   }

   @Override
   public void close() {
      this.vXℂ0017.close();
      this.vXℂ0018.close();
      this.S.close();
      this.T.close();
   }

   @Override
   public String getName() {
      return "α";
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
      return "α:n➔T(n)/S(n)";
   }

   @Override
   public String typeset() {
      return "\\frac{\\T\\left(n\\right)}{\\S\\left(n\\right)}";
   }
}
