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

public class a implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   protected Context context;
   public Expression expression;
   private final TreeMap<Integer, ComplexPolynomial> cache = new TreeMap<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
   public a a;
   public operandF0001 operandF0001;
   public ComplexPolynomial p;
   public ComplexPolynomial q;
   public ComplexPolynomial r;
   public Real μ;
   public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
   public Integer cseℤ0001;
   public Integer cseℤ0002;
   public Integer cseℤ0003;
   public Integer jXℂ0001ℤ0001;
   public ComplexPolynomial sumXℂ0001;
   public Integer upperLimitℤ0001;
   public ComplexPolynomial vXℂ0007;
   public ComplexPolynomial vXℂ0008;
   public ComplexPolynomial vXℂ0009;
   public ComplexPolynomial vXℂ0010;
   public ComplexPolynomial valueXℂ0001;
   public Real vℝ0001;
   public Real vℝ0002;
   public Real vℝ0003;
   public Real vℝ0004;
   public Real vℝ0005;
   public Real vℝ0006;
   public Real vℝ0007;
   public Real vℝ0008;
   public Real vℝ0009;
   public Integer vℤ0001;
   public Integer vℤ0002;
   public Integer vℤ0003;

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
         ComplexPolynomial var11 = (ComplexPolynomial)Function.peek(this.cache, k);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            TreeMap var9 = this.cache;
            Integer var10 = k;

            (switch (k.getSignedValue()) {
                  case 1 -> this.p.div(this.μ.add(this.cℤ0000, bits, this.vℝ0001).Γ(bits, this.vℝ0002), bits, result);
                  default -> {
                     Real var12 = k.sub(this.cℤ0000, bits, this.vℤ0001)
                        .mul(this.μ, bits, this.vℝ0003)
                        .add(this.cℤ0000, bits, this.vℝ0004)
                        .Γ(bits, this.vℝ0005)
                        .div(k.mul(this.μ, bits, this.vℝ0006).add(this.cℤ0000, bits, this.vℝ0007).Γ(bits, this.vℝ0008), bits, this.vℝ0009);
                     ComplexPolynomial var10001 = this.q
                        .mul((ComplexPolynomial)this.a.evaluate(k.sub(this.cℤ0000, bits, this.vℤ0002), order, bits, this.vXℂ0007), bits, this.vXℂ0008);
                     ComplexPolynomial var10002 = this.r;
                     if (this.operandF0001.k == null) {
                        this.operandF0001.k = new Integer();
                     }

                     this.operandF0001.k.set(k);
                     this.sumXℂ0001.additiveIdentity();
                     this.jXℂ0001ℤ0001.set(this.cℤ0000);
                     Integer var10003 = this.jXℂ0001ℤ0001;
                     this.upperLimitℤ0001.set(k.sub(this.cℤ0001, bits, this.vℤ0003));

                     while (var10003.compareTo(this.upperLimitℤ0001) <= 0) {
                        this.sumXℂ0001.add((ComplexPolynomial)this.operandF0001.evaluate(this.jXℂ0001ℤ0001, bits, this.valueXℂ0001), bits);
                        var10003 = this.jXℂ0001ℤ0001.increment();
                     }

                     yield var12.mul(var10001.add(var10002.mul(this.sumXℂ0001, bits, this.vXℂ0009), bits, this.vXℂ0010), bits, result);
                  }
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

   public void invalidateCache(Set<Function<?, ?>> var1) {
      if (var1.add(this)) {
         this.cache.clear();
         if (this.a != null) {
            this.a.invalidateCache(var1);
         }

         if (this.operandF0001 != null) {
            this.operandF0001.invalidateCache(var1);
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
         if (this.p == null) {
            throw new AssertionError("p is null");
         } else if (this.q == null) {
            throw new AssertionError("q is null");
         } else if (this.r == null) {
            throw new AssertionError("r is null");
         } else if (this.μ == null) {
            throw new AssertionError("μ is null");
         } else {
            if (this.operandF0001 == null) {
               this.operandF0001 = new operandF0001();
               this.operandF0001.context = this.context;
            }

            this.operandF0001.a = this;
            this.operandF0001.context = this.context;
            this.operandF0001.a = this.a;
            if (this.operandF0001.p == null) {
               this.operandF0001.p = this.p;
            } else {
               this.operandF0001.p.set(this.p);
            }

            if (this.operandF0001.q == null) {
               this.operandF0001.q = this.q;
            } else {
               this.operandF0001.q.set(this.q);
            }

            if (this.operandF0001.r == null) {
               this.operandF0001.r = this.r;
            } else {
               this.operandF0001.r.set(this.r);
            }

            if (this.operandF0001.μ == null) {
               this.operandF0001.μ = this.μ;
            } else {
               this.operandF0001.μ.set(this.μ);
            }

            if (this.operandF0001.p == null) {
               this.operandF0001.p = new ComplexPolynomial();
            }

            this.operandF0001.p.set(this.p);
            if (this.operandF0001.q == null) {
               this.operandF0001.q = new ComplexPolynomial();
            }

            this.operandF0001.q.set(this.q);
            if (this.operandF0001.r == null) {
               this.operandF0001.r = new ComplexPolynomial();
            }

            this.operandF0001.r.set(this.r);
            if (this.operandF0001.μ == null) {
               this.operandF0001.μ = new Real();
            }

            this.operandF0001.μ.set(this.μ);
            if (this.a == null) {
               this.a = new a();
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

            if (this.a.μ == null) {
               this.a.μ = this.μ;
            } else {
               this.a.μ.set(this.μ);
            }

            this.isInitialized = true;
         }
      }
   }

   public a() {
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.cℤ0001 = new Integer("2");
      this.cseℤ0001 = new Integer();
      this.cseℤ0002 = new Integer();
      this.cseℤ0003 = new Integer();
      this.jXℂ0001ℤ0001 = new Integer();
      this.sumXℂ0001 = new ComplexPolynomial();
      this.upperLimitℤ0001 = new Integer();
      this.vXℂ0007 = new ComplexPolynomial();
      this.vXℂ0008 = new ComplexPolynomial();
      this.vXℂ0009 = new ComplexPolynomial();
      this.vXℂ0010 = new ComplexPolynomial();
      this.valueXℂ0001 = new ComplexPolynomial();
      this.vℝ0001 = new Real();
      this.vℝ0002 = new Real();
      this.vℝ0003 = new Real();
      this.vℝ0004 = new Real();
      this.vℝ0005 = new Real();
      this.vℝ0006 = new Real();
      this.vℝ0007 = new Real();
      this.vℝ0008 = new Real();
      this.vℝ0009 = new Real();
      this.vℤ0001 = new Integer();
      this.vℤ0002 = new Integer();
      this.vℤ0003 = new Integer();
   }

   @Override
   public void close() {
      this.cℤ0000.close();
      this.cℤ0001.close();
      this.cseℤ0001.close();
      this.cseℤ0002.close();
      this.cseℤ0003.close();
      this.jXℂ0001ℤ0001.close();
      this.sumXℂ0001.close();
      this.upperLimitℤ0001.close();
      this.vXℂ0007.close();
      this.vXℂ0008.close();
      this.vXℂ0009.close();
      this.vXℂ0010.close();
      this.valueXℂ0001.close();
      this.vℝ0001.close();
      this.vℝ0002.close();
      this.vℝ0003.close();
      this.vℝ0004.close();
      this.vℝ0005.close();
      this.vℝ0006.close();
      this.vℝ0007.close();
      this.vℝ0008.close();
      this.vℝ0009.close();
      this.vℤ0001.close();
      this.vℤ0002.close();
      this.vℤ0003.close();
      this.a.close();
      this.operandF0001.close();
   }

   @Override
   public String getName() {
      return "a";
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
      return "a:when(k=1,p/Γ(μ+1),else,(Γ(((k-1)*μ)+1)/Γ((k*μ)+1))*((q*a(k-1))+(r*Σj➔a(j)*a((%s-1)-j){j=1…k-2})))";
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\frac{p}{\\Gamma(\\left(μ + 1\\right))} & \\\\text{if } \\left(k = 1\\right)\\\\\\\\\\n\\left(\\frac{\\Gamma(\\left(\\left(\\left(k-1\\right) \\cdot μ\\right) + 1\\right))}{\\Gamma(\\left(\\left(k \\cdot μ\\right) + 1\\right))} \\cdot \\left(\\left(q \\cdot \\a\\left(\\left(k-1\\right)\\right)\\right) + \\left(r \\cdot \\sum_{j = 1}^{\\left(k-2\\right)}{\\left(\\a\\left(j\\right) \\cdot \\a\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right)}\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
