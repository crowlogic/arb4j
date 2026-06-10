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

public class a implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomial> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
   public a a;
   public aoperandF0001 aoperandF0001;
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
   public Integer cseℤ0001;
   public Integer cseℤ0002;
   public Integer cseℤ0003;
   public Integer jXℂ0001ℤ0001;
   public ComplexPolynomial sumXℂ0001;
   public Integer upperLimitℤ0001;
   public ComplexPolynomial vXℂ0018;
   public ComplexPolynomial vXℂ0019;
   public ComplexPolynomial vXℂ0020;
   public ComplexPolynomial vXℂ0021;
   public ComplexPolynomial valueXℂ0001;
   public Real vℝ0003;
   public Real vℝ0004;
   public Real vℝ0005;
   public Real vℝ0006;
   public Real vℝ0007;
   public Real vℝ0008;
   public Real vℝ0009;
   public Real vℝ0010;
   public Real vℝ0011;
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
         ComplexPolynomial var11 = Function.peek(this.cache, k);
         if (var11 != null) {
            result.set(var11);
            return result;
         } else {
            IndexCache var9 = this.cache;
            Integer var10 = k;

            (switch (k.getSignedValue()) {
                  case 1 -> this.p.div(this.μ.add(this.cℤ0000, bits, this.vℝ0003).Γ(bits, this.vℝ0004), bits, result);
                  default -> {
                     Real var12 = k.sub(this.cℤ0000, bits, this.vℤ0001)
                        .mul(this.μ, bits, this.vℝ0005)
                        .add(this.cℤ0000, bits, this.vℝ0006)
                        .Γ(bits, this.vℝ0007)
                        .div(k.mul(this.μ, bits, this.vℝ0008).add(this.cℤ0000, bits, this.vℝ0009).Γ(bits, this.vℝ0010), bits, this.vℝ0011);
                     ComplexPolynomial var10001 = this.q
                        .mul(this.a.evaluate(k.sub(this.cℤ0000, bits, this.vℤ0002), order, bits, this.vXℂ0018), bits, this.vXℂ0019);
                     ComplexPolynomial var10002 = this.r;
                     if (this.aoperandF0001.k == null) {
                        this.aoperandF0001.k = new Integer();
                     }

                     this.aoperandF0001.k.set(k);
                     this.sumXℂ0001.additiveIdentity();
                     this.jXℂ0001ℤ0001.set(this.cℤ0000);
                     Integer var10003 = this.jXℂ0001ℤ0001;
                     this.upperLimitℤ0001.set(k.sub(this.cℤ0001, bits, this.vℤ0003));

                     while (var10003.compareTo(this.upperLimitℤ0001) <= 0) {
                        this.sumXℂ0001.add(this.aoperandF0001.evaluate(this.jXℂ0001ℤ0001, bits, this.valueXℂ0001), bits);
                        var10003 = this.jXℂ0001ℤ0001.increment();
                     }

                     yield var12.mul(var10001.add(var10002.mul(this.sumXℂ0001, bits, this.vXℂ0020), bits, this.vXℂ0021), bits, result);
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

   @Override
   public void invalidateCache() {
      if (!this.cache.invalidating) {
         this.cache.invalidating = true;
         this.cache.clear();
         if (this.a != null) {
            this.a.invalidateCache();
         }

         if (this.aoperandF0001 != null) {
            this.aoperandF0001.invalidateCache();
         }

         this.cache.invalidating = false;
      }
   }

   @Override
   public void invalidateLocalCache() {
      if (!this.cache.invalidating) {
         this.cache.invalidating = true;
         this.cache.clear();
         this.cache.invalidating = false;
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
         if (this.p == null) {
            throw new AssertionError("p is null");
         } else if (this.q == null) {
            throw new AssertionError("q is null");
         } else if (this.r == null) {
            throw new AssertionError("r is null");
         } else if (this.μ == null) {
            throw new AssertionError("μ is null");
         } else {
            if (this.a == null) {
               this.a = new a();
               this.a.context = this.context;
               this.a.cache = this.cache;
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

            if (this.aoperandF0001 == null) {
               Function var10002 = this.context.lookupFunctionInstance("aoperandF0001");
               if (var10002 != null) {
                  this.aoperandF0001 = (aoperandF0001)var10002;
               } else {
                  this.aoperandF0001 = new aoperandF0001();
                  this.aoperandF0001.context = this.context;
               }
            }

            this.aoperandF0001.context = this.context;
            this.aoperandF0001.a = this.a;
            if (this.aoperandF0001.p == null) {
               this.aoperandF0001.p = this.p;
            } else {
               this.aoperandF0001.p.set(this.p);
            }

            if (this.aoperandF0001.ρ == null) {
               this.aoperandF0001.ρ = this.ρ;
            } else {
               this.aoperandF0001.ρ.set(this.ρ);
            }

            if (this.aoperandF0001.q == null) {
               this.aoperandF0001.q = this.q;
            } else {
               this.aoperandF0001.q.set(this.q);
            }

            if (this.aoperandF0001.r == null) {
               this.aoperandF0001.r = this.r;
            } else {
               this.aoperandF0001.r.set(this.r);
            }

            if (this.aoperandF0001.T == null) {
               this.aoperandF0001.T = this.T;
            } else {
               this.aoperandF0001.T.set(this.T);
            }

            if (this.aoperandF0001.θ == null) {
               this.aoperandF0001.θ = this.θ;
            } else {
               this.aoperandF0001.θ.set(this.θ);
            }

            if (this.aoperandF0001.V0 == null) {
               this.aoperandF0001.V0 = this.V0;
            } else {
               this.aoperandF0001.V0.set(this.V0);
            }

            if (this.aoperandF0001.λ == null) {
               this.aoperandF0001.λ = this.λ;
            } else {
               this.aoperandF0001.λ.set(this.λ);
            }

            if (this.aoperandF0001.μ == null) {
               this.aoperandF0001.μ = this.μ;
            } else {
               this.aoperandF0001.μ.set(this.μ);
            }

            if (this.aoperandF0001.ν == null) {
               this.aoperandF0001.ν = this.ν;
            } else {
               this.aoperandF0001.ν.set(this.ν);
            }

            if (this.aoperandF0001.N == null) {
               this.aoperandF0001.N = this.N;
            } else {
               this.aoperandF0001.N.set(this.N);
            }

            if (this.aoperandF0001.p == null) {
               this.aoperandF0001.p = new ComplexPolynomial();
            }

            this.aoperandF0001.p.set(this.p);
            if (this.aoperandF0001.ρ == null) {
               this.aoperandF0001.ρ = new Real();
            }

            this.aoperandF0001.ρ.set(this.ρ);
            if (this.aoperandF0001.q == null) {
               this.aoperandF0001.q = new ComplexPolynomial();
            }

            this.aoperandF0001.q.set(this.q);
            if (this.aoperandF0001.r == null) {
               this.aoperandF0001.r = new ComplexPolynomial();
            }

            this.aoperandF0001.r.set(this.r);
            if (this.aoperandF0001.T == null) {
               this.aoperandF0001.T = new Real();
            }

            this.aoperandF0001.T.set(this.T);
            if (this.aoperandF0001.θ == null) {
               this.aoperandF0001.θ = new Real();
            }

            this.aoperandF0001.θ.set(this.θ);
            if (this.aoperandF0001.V0 == null) {
               this.aoperandF0001.V0 = new Real();
            }

            this.aoperandF0001.V0.set(this.V0);
            if (this.aoperandF0001.λ == null) {
               this.aoperandF0001.λ = new Real();
            }

            this.aoperandF0001.λ.set(this.λ);
            if (this.aoperandF0001.μ == null) {
               this.aoperandF0001.μ = new Real();
            }

            this.aoperandF0001.μ.set(this.μ);
            if (this.aoperandF0001.ν == null) {
               this.aoperandF0001.ν = new Real();
            }

            this.aoperandF0001.ν.set(this.ν);
            if (this.aoperandF0001.N == null) {
               this.aoperandF0001.N = new Integer();
            }

            this.aoperandF0001.N.set(this.N);
            this.isInitialized = true;
         }
      }
   }

   public a() {
      this.cache.ownsValues = true;
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.cℤ0001 = new Integer("2");
      this.cseℤ0001 = new Integer();
      this.cseℤ0002 = new Integer();
      this.cseℤ0003 = new Integer();
      this.jXℂ0001ℤ0001 = new Integer();
      this.sumXℂ0001 = new ComplexPolynomial();
      this.upperLimitℤ0001 = new Integer();
      this.vXℂ0018 = new ComplexPolynomial();
      this.vXℂ0019 = new ComplexPolynomial();
      this.vXℂ0020 = new ComplexPolynomial();
      this.vXℂ0021 = new ComplexPolynomial();
      this.valueXℂ0001 = new ComplexPolynomial();
      this.vℝ0003 = new Real();
      this.vℝ0004 = new Real();
      this.vℝ0005 = new Real();
      this.vℝ0006 = new Real();
      this.vℝ0007 = new Real();
      this.vℝ0008 = new Real();
      this.vℝ0009 = new Real();
      this.vℝ0010 = new Real();
      this.vℝ0011 = new Real();
      this.vℤ0001 = new Integer();
      this.vℤ0002 = new Integer();
      this.vℤ0003 = new Integer();
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

         if (this.cseℤ0001 != null) {
            this.cseℤ0001.close();
         }

         if (this.cseℤ0002 != null) {
            this.cseℤ0002.close();
         }

         if (this.cseℤ0003 != null) {
            this.cseℤ0003.close();
         }

         if (this.jXℂ0001ℤ0001 != null) {
            this.jXℂ0001ℤ0001.close();
         }

         if (this.sumXℂ0001 != null) {
            this.sumXℂ0001.close();
         }

         if (this.upperLimitℤ0001 != null) {
            this.upperLimitℤ0001.close();
         }

         if (this.vXℂ0018 != null) {
            this.vXℂ0018.close();
         }

         if (this.vXℂ0019 != null) {
            this.vXℂ0019.close();
         }

         if (this.vXℂ0020 != null) {
            this.vXℂ0020.close();
         }

         if (this.vXℂ0021 != null) {
            this.vXℂ0021.close();
         }

         if (this.valueXℂ0001 != null) {
            this.valueXℂ0001.close();
         }

         if (this.vℝ0003 != null) {
            this.vℝ0003.close();
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

         if (this.vℝ0007 != null) {
            this.vℝ0007.close();
         }

         if (this.vℝ0008 != null) {
            this.vℝ0008.close();
         }

         if (this.vℝ0009 != null) {
            this.vℝ0009.close();
         }

         if (this.vℝ0010 != null) {
            this.vℝ0010.close();
         }

         if (this.vℝ0011 != null) {
            this.vℝ0011.close();
         }

         if (this.vℤ0001 != null) {
            this.vℤ0001.close();
         }

         if (this.vℤ0002 != null) {
            this.vℤ0002.close();
         }

         if (this.vℤ0003 != null) {
            this.vℤ0003.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
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
