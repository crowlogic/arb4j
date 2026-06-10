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

public class da implements ComplexPolynomialSequence, Typesettable, AutoCloseable, Initializable, Named {
   public boolean isInitialized;
   public boolean closed;
   public boolean invalidatingCache;
   protected Context context;
   public Expression expression;
   private IndexCache<ComplexPolynomial> cache = new IndexCache<>();
   public final Integer cℤ0000;
   public final Integer cℤ0001;
   public daoperandF0002 daoperandF0002;
   public da da;
   public daoperandF0001 daoperandF0001;
   public a a;
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
   public ComplexPolynomial cseXℂ0001;
   public Integer cseℤ0005;
   public Integer cseℤ0006;
   public Integer cseℤ0007;
   public Integer cseℤ0008;
   public Integer cseℤ0012;
   public Integer cseℤ0013;
   public Integer cseℤ0014;
   public Integer cseℤ0015;
   public Integer jXℂ0002ℤ0001;
   public Integer jXℂ0003ℤ0001;
   public ComplexPolynomial sumXℂ0002;
   public ComplexPolynomial sumXℂ0003;
   public Integer upperLimitℤ0003;
   public Integer upperLimitℤ0004;
   public ComplexPolynomial vXℂ0031;
   public ComplexPolynomial vXℂ0032;
   public ComplexPolynomial vXℂ0033;
   public ComplexPolynomial vXℂ0034;
   public ComplexPolynomial vXℂ0035;
   public ComplexPolynomial vXℂ0036;
   public ComplexPolynomial vXℂ0037;
   public ComplexPolynomial vXℂ0038;
   public ComplexPolynomial vXℂ0039;
   public ComplexPolynomial valueXℂ0002;
   public ComplexPolynomial valueXℂ0003;
   public Real vℝ0029;
   public Real vℝ0030;
   public Real vℝ0031;
   public Real vℝ0032;
   public Real vℝ0033;
   public Real vℝ0034;
   public Real vℝ0035;
   public Real vℝ0036;
   public Real vℝ0037;
   public Integer vℤ0008;
   public Integer vℤ0009;
   public Integer vℤ0010;
   public Integer vℤ0011;
   public Integer vℤ0012;

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
                  case 1 -> this.pdv.div(this.μ.add(this.cℤ0000, bits, this.vℝ0029).Γ(bits, this.vℝ0030), bits, result);
                  default -> {
                     Real var12 = k.sub(this.cℤ0000, bits, this.vℤ0008)
                        .mul(this.μ, bits, this.vℝ0031)
                        .add(this.cℤ0000, bits, this.vℝ0032)
                        .Γ(bits, this.vℝ0033)
                        .div(k.mul(this.μ, bits, this.vℝ0034).add(this.cℤ0000, bits, this.vℝ0035).Γ(bits, this.vℝ0036), bits, this.vℝ0037);
                     ComplexPolynomial var10001 = this.qdv
                        .mul(this.a.evaluate(k.sub(this.cℤ0000, bits, this.vℤ0009), order, bits, this.vXℂ0031), bits, this.vXℂ0032)
                        .add(
                           this.q.mul(this.da.evaluate(k.sub(this.cℤ0000, bits, this.vℤ0010), order, bits, this.vXℂ0033), bits, this.vXℂ0034),
                           bits,
                           this.vXℂ0035
                        );
                     ComplexPolynomial var10002 = this.rdv;
                     if (this.daoperandF0001.k == null) {
                        this.daoperandF0001.k = new Integer();
                     }

                     this.daoperandF0001.k.set(k);
                     this.sumXℂ0002.additiveIdentity();
                     this.jXℂ0002ℤ0001.set(this.cℤ0000);
                     Integer var10003 = this.jXℂ0002ℤ0001;
                     this.upperLimitℤ0003.set(k.sub(this.cℤ0001, bits, this.vℤ0011));

                     while (var10003.compareTo(this.upperLimitℤ0003) <= 0) {
                        this.sumXℂ0002.add(this.daoperandF0001.evaluate(this.jXℂ0002ℤ0001, bits, this.valueXℂ0002), bits);
                        var10003 = this.jXℂ0002ℤ0001.increment();
                     }

                     var10001 = var10001.add(var10002.mul(this.sumXℂ0002, bits, this.vXℂ0036), bits, this.vXℂ0037);
                     var10002 = this.r;
                     if (this.daoperandF0002.k == null) {
                        this.daoperandF0002.k = new Integer();
                     }

                     this.daoperandF0002.k.set(k);
                     this.sumXℂ0003.additiveIdentity();
                     this.jXℂ0003ℤ0001.set(this.cℤ0000);
                     var10003 = this.jXℂ0003ℤ0001;
                     this.upperLimitℤ0004.set(k.sub(this.cℤ0001, bits, this.vℤ0012));

                     while (var10003.compareTo(this.upperLimitℤ0004) <= 0) {
                        this.sumXℂ0003.add(this.daoperandF0002.evaluate(this.jXℂ0003ℤ0001, bits, this.valueXℂ0003), bits);
                        var10003 = this.jXℂ0003ℤ0001.increment();
                     }

                     yield var12.mul(var10001.add(var10002.mul(this.sumXℂ0003, bits, this.vXℂ0038), bits, this.vXℂ0039), bits, result);
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

         if (this.daoperandF0002 != null) {
            this.daoperandF0002.invalidateCache();
         }

         if (this.da != null) {
            this.da.invalidateCache();
         }

         if (this.daoperandF0001 != null) {
            this.daoperandF0001.invalidateCache();
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
         if (this.qdv == null) {
            throw new AssertionError("qdv is null");
         } else if (this.pdv == null) {
            throw new AssertionError("pdv is null");
         } else if (this.rdv == null) {
            throw new AssertionError("rdv is null");
         } else if (this.q == null) {
            throw new AssertionError("q is null");
         } else if (this.r == null) {
            throw new AssertionError("r is null");
         } else if (this.μ == null) {
            throw new AssertionError("μ is null");
         } else {
            if (this.da == null) {
               this.da = new da();
               this.da.context = this.context;
               this.da.cache = this.cache;
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

            if (this.a == null) {
               Function var10002 = this.context.lookupFunctionInstance("a");
               if (var10002 != null) {
                  this.a = (a)var10002;
               } else {
                  this.a = new a();
                  this.a.context = this.context;
               }
            }

            if (this.daoperandF0002 == null) {
               Function var1 = this.context.lookupFunctionInstance("daoperandF0002");
               if (var1 != null) {
                  this.daoperandF0002 = (daoperandF0002)var1;
               } else {
                  this.daoperandF0002 = new daoperandF0002();
                  this.daoperandF0002.context = this.context;
               }
            }

            if (this.daoperandF0001 == null) {
               Function var2 = this.context.lookupFunctionInstance("daoperandF0001");
               if (var2 != null) {
                  this.daoperandF0001 = (daoperandF0001)var2;
               } else {
                  this.daoperandF0001 = new daoperandF0001();
                  this.daoperandF0001.context = this.context;
               }
            }

            this.daoperandF0002.context = this.context;
            this.daoperandF0001.context = this.context;
            if (this.daoperandF0002.ρ == null) {
               this.daoperandF0002.ρ = this.ρ;
            } else {
               this.daoperandF0002.ρ.set(this.ρ);
            }

            if (this.daoperandF0002.qdv == null) {
               this.daoperandF0002.qdv = this.qdv;
            } else {
               this.daoperandF0002.qdv.set(this.qdv);
            }

            if (this.daoperandF0002.pdv == null) {
               this.daoperandF0002.pdv = this.pdv;
            } else {
               this.daoperandF0002.pdv.set(this.pdv);
            }

            if (this.daoperandF0002.rdv == null) {
               this.daoperandF0002.rdv = this.rdv;
            } else {
               this.daoperandF0002.rdv.set(this.rdv);
            }

            if (this.daoperandF0002.J == null) {
               this.daoperandF0002.J = this.J;
            } else {
               this.daoperandF0002.J.set(this.J);
            }

            if (this.daoperandF0002.N == null) {
               this.daoperandF0002.N = this.N;
            } else {
               this.daoperandF0002.N.set(this.N);
            }

            if (this.daoperandF0002.p == null) {
               this.daoperandF0002.p = this.p;
            } else {
               this.daoperandF0002.p.set(this.p);
            }

            if (this.daoperandF0002.q == null) {
               this.daoperandF0002.q = this.q;
            } else {
               this.daoperandF0002.q.set(this.q);
            }

            if (this.daoperandF0002.r == null) {
               this.daoperandF0002.r = this.r;
            } else {
               this.daoperandF0002.r.set(this.r);
            }

            if (this.daoperandF0002.T == null) {
               this.daoperandF0002.T = this.T;
            } else {
               this.daoperandF0002.T.set(this.T);
            }

            if (this.daoperandF0002.θ == null) {
               this.daoperandF0002.θ = this.θ;
            } else {
               this.daoperandF0002.θ.set(this.θ);
            }

            if (this.daoperandF0002.V0 == null) {
               this.daoperandF0002.V0 = this.V0;
            } else {
               this.daoperandF0002.V0.set(this.V0);
            }

            if (this.daoperandF0002.λ == null) {
               this.daoperandF0002.λ = this.λ;
            } else {
               this.daoperandF0002.λ.set(this.λ);
            }

            if (this.daoperandF0002.μ == null) {
               this.daoperandF0002.μ = this.μ;
            } else {
               this.daoperandF0002.μ.set(this.μ);
            }

            if (this.daoperandF0002.ν == null) {
               this.daoperandF0002.ν = this.ν;
            } else {
               this.daoperandF0002.ν.set(this.ν);
            }

            this.daoperandF0002.da = this.da;
            if (this.daoperandF0001.ρ == null) {
               this.daoperandF0001.ρ = this.ρ;
            } else {
               this.daoperandF0001.ρ.set(this.ρ);
            }

            if (this.daoperandF0001.qdv == null) {
               this.daoperandF0001.qdv = this.qdv;
            } else {
               this.daoperandF0001.qdv.set(this.qdv);
            }

            if (this.daoperandF0001.pdv == null) {
               this.daoperandF0001.pdv = this.pdv;
            } else {
               this.daoperandF0001.pdv.set(this.pdv);
            }

            if (this.daoperandF0001.rdv == null) {
               this.daoperandF0001.rdv = this.rdv;
            } else {
               this.daoperandF0001.rdv.set(this.rdv);
            }

            if (this.daoperandF0001.J == null) {
               this.daoperandF0001.J = this.J;
            } else {
               this.daoperandF0001.J.set(this.J);
            }

            if (this.daoperandF0001.N == null) {
               this.daoperandF0001.N = this.N;
            } else {
               this.daoperandF0001.N.set(this.N);
            }

            if (this.daoperandF0001.p == null) {
               this.daoperandF0001.p = this.p;
            } else {
               this.daoperandF0001.p.set(this.p);
            }

            if (this.daoperandF0001.q == null) {
               this.daoperandF0001.q = this.q;
            } else {
               this.daoperandF0001.q.set(this.q);
            }

            if (this.daoperandF0001.r == null) {
               this.daoperandF0001.r = this.r;
            } else {
               this.daoperandF0001.r.set(this.r);
            }

            if (this.daoperandF0001.T == null) {
               this.daoperandF0001.T = this.T;
            } else {
               this.daoperandF0001.T.set(this.T);
            }

            if (this.daoperandF0001.θ == null) {
               this.daoperandF0001.θ = this.θ;
            } else {
               this.daoperandF0001.θ.set(this.θ);
            }

            if (this.daoperandF0001.V0 == null) {
               this.daoperandF0001.V0 = this.V0;
            } else {
               this.daoperandF0001.V0.set(this.V0);
            }

            if (this.daoperandF0001.λ == null) {
               this.daoperandF0001.λ = this.λ;
            } else {
               this.daoperandF0001.λ.set(this.λ);
            }

            if (this.daoperandF0001.μ == null) {
               this.daoperandF0001.μ = this.μ;
            } else {
               this.daoperandF0001.μ.set(this.μ);
            }

            if (this.daoperandF0001.ν == null) {
               this.daoperandF0001.ν = this.ν;
            } else {
               this.daoperandF0001.ν.set(this.ν);
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

            this.daoperandF0002.a = this.a;
            this.daoperandF0001.a = this.a;
            if (this.daoperandF0001.ρ == null) {
               this.daoperandF0001.ρ = new Real();
            }

            this.daoperandF0001.ρ.set(this.ρ);
            if (this.daoperandF0001.qdv == null) {
               this.daoperandF0001.qdv = new ComplexPolynomial();
            }

            this.daoperandF0001.qdv.set(this.qdv);
            if (this.daoperandF0001.pdv == null) {
               this.daoperandF0001.pdv = new ComplexPolynomial();
            }

            this.daoperandF0001.pdv.set(this.pdv);
            if (this.daoperandF0001.rdv == null) {
               this.daoperandF0001.rdv = new ComplexPolynomial();
            }

            this.daoperandF0001.rdv.set(this.rdv);
            if (this.daoperandF0001.J == null) {
               this.daoperandF0001.J = new Integer();
            }

            this.daoperandF0001.J.set(this.J);
            if (this.daoperandF0001.N == null) {
               this.daoperandF0001.N = new Integer();
            }

            this.daoperandF0001.N.set(this.N);
            if (this.daoperandF0001.p == null) {
               this.daoperandF0001.p = new ComplexPolynomial();
            }

            this.daoperandF0001.p.set(this.p);
            if (this.daoperandF0001.q == null) {
               this.daoperandF0001.q = new ComplexPolynomial();
            }

            this.daoperandF0001.q.set(this.q);
            if (this.daoperandF0001.r == null) {
               this.daoperandF0001.r = new ComplexPolynomial();
            }

            this.daoperandF0001.r.set(this.r);
            if (this.daoperandF0001.T == null) {
               this.daoperandF0001.T = new Real();
            }

            this.daoperandF0001.T.set(this.T);
            if (this.daoperandF0001.θ == null) {
               this.daoperandF0001.θ = new Real();
            }

            this.daoperandF0001.θ.set(this.θ);
            if (this.daoperandF0001.V0 == null) {
               this.daoperandF0001.V0 = new Real();
            }

            this.daoperandF0001.V0.set(this.V0);
            if (this.daoperandF0001.λ == null) {
               this.daoperandF0001.λ = new Real();
            }

            this.daoperandF0001.λ.set(this.λ);
            if (this.daoperandF0001.μ == null) {
               this.daoperandF0001.μ = new Real();
            }

            this.daoperandF0001.μ.set(this.μ);
            if (this.daoperandF0001.ν == null) {
               this.daoperandF0001.ν = new Real();
            }

            this.daoperandF0001.ν.set(this.ν);
            if (this.daoperandF0002.ρ == null) {
               this.daoperandF0002.ρ = new Real();
            }

            this.daoperandF0002.ρ.set(this.ρ);
            if (this.daoperandF0002.qdv == null) {
               this.daoperandF0002.qdv = new ComplexPolynomial();
            }

            this.daoperandF0002.qdv.set(this.qdv);
            if (this.daoperandF0002.pdv == null) {
               this.daoperandF0002.pdv = new ComplexPolynomial();
            }

            this.daoperandF0002.pdv.set(this.pdv);
            if (this.daoperandF0002.rdv == null) {
               this.daoperandF0002.rdv = new ComplexPolynomial();
            }

            this.daoperandF0002.rdv.set(this.rdv);
            if (this.daoperandF0002.J == null) {
               this.daoperandF0002.J = new Integer();
            }

            this.daoperandF0002.J.set(this.J);
            if (this.daoperandF0002.N == null) {
               this.daoperandF0002.N = new Integer();
            }

            this.daoperandF0002.N.set(this.N);
            if (this.daoperandF0002.p == null) {
               this.daoperandF0002.p = new ComplexPolynomial();
            }

            this.daoperandF0002.p.set(this.p);
            if (this.daoperandF0002.q == null) {
               this.daoperandF0002.q = new ComplexPolynomial();
            }

            this.daoperandF0002.q.set(this.q);
            if (this.daoperandF0002.r == null) {
               this.daoperandF0002.r = new ComplexPolynomial();
            }

            this.daoperandF0002.r.set(this.r);
            if (this.daoperandF0002.T == null) {
               this.daoperandF0002.T = new Real();
            }

            this.daoperandF0002.T.set(this.T);
            if (this.daoperandF0002.θ == null) {
               this.daoperandF0002.θ = new Real();
            }

            this.daoperandF0002.θ.set(this.θ);
            if (this.daoperandF0002.V0 == null) {
               this.daoperandF0002.V0 = new Real();
            }

            this.daoperandF0002.V0.set(this.V0);
            if (this.daoperandF0002.λ == null) {
               this.daoperandF0002.λ = new Real();
            }

            this.daoperandF0002.λ.set(this.λ);
            if (this.daoperandF0002.μ == null) {
               this.daoperandF0002.μ = new Real();
            }

            this.daoperandF0002.μ.set(this.μ);
            if (this.daoperandF0002.ν == null) {
               this.daoperandF0002.ν = new Real();
            }

            this.daoperandF0002.ν.set(this.ν);
            this.isInitialized = true;
         }
      }
   }

   public da() {
      this.cache.ownsValues = true;
      this.context = new Context();
      this.cℤ0000 = new Integer("1");
      this.cℤ0001 = new Integer("2");
      this.cseXℂ0001 = new ComplexPolynomial();
      this.cseℤ0005 = new Integer();
      this.cseℤ0006 = new Integer();
      this.cseℤ0007 = new Integer();
      this.cseℤ0008 = new Integer();
      this.cseℤ0012 = new Integer();
      this.cseℤ0013 = new Integer();
      this.cseℤ0014 = new Integer();
      this.cseℤ0015 = new Integer();
      this.jXℂ0002ℤ0001 = new Integer();
      this.jXℂ0003ℤ0001 = new Integer();
      this.sumXℂ0002 = new ComplexPolynomial();
      this.sumXℂ0003 = new ComplexPolynomial();
      this.upperLimitℤ0003 = new Integer();
      this.upperLimitℤ0004 = new Integer();
      this.vXℂ0031 = new ComplexPolynomial();
      this.vXℂ0032 = new ComplexPolynomial();
      this.vXℂ0033 = new ComplexPolynomial();
      this.vXℂ0034 = new ComplexPolynomial();
      this.vXℂ0035 = new ComplexPolynomial();
      this.vXℂ0036 = new ComplexPolynomial();
      this.vXℂ0037 = new ComplexPolynomial();
      this.vXℂ0038 = new ComplexPolynomial();
      this.vXℂ0039 = new ComplexPolynomial();
      this.valueXℂ0002 = new ComplexPolynomial();
      this.valueXℂ0003 = new ComplexPolynomial();
      this.vℝ0029 = new Real();
      this.vℝ0030 = new Real();
      this.vℝ0031 = new Real();
      this.vℝ0032 = new Real();
      this.vℝ0033 = new Real();
      this.vℝ0034 = new Real();
      this.vℝ0035 = new Real();
      this.vℝ0036 = new Real();
      this.vℝ0037 = new Real();
      this.vℤ0008 = new Integer();
      this.vℤ0009 = new Integer();
      this.vℤ0010 = new Integer();
      this.vℤ0011 = new Integer();
      this.vℤ0012 = new Integer();
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

         if (this.cseXℂ0001 != null) {
            this.cseXℂ0001.close();
         }

         if (this.cseℤ0005 != null) {
            this.cseℤ0005.close();
         }

         if (this.cseℤ0006 != null) {
            this.cseℤ0006.close();
         }

         if (this.cseℤ0007 != null) {
            this.cseℤ0007.close();
         }

         if (this.cseℤ0008 != null) {
            this.cseℤ0008.close();
         }

         if (this.cseℤ0012 != null) {
            this.cseℤ0012.close();
         }

         if (this.cseℤ0013 != null) {
            this.cseℤ0013.close();
         }

         if (this.cseℤ0014 != null) {
            this.cseℤ0014.close();
         }

         if (this.cseℤ0015 != null) {
            this.cseℤ0015.close();
         }

         if (this.jXℂ0002ℤ0001 != null) {
            this.jXℂ0002ℤ0001.close();
         }

         if (this.jXℂ0003ℤ0001 != null) {
            this.jXℂ0003ℤ0001.close();
         }

         if (this.sumXℂ0002 != null) {
            this.sumXℂ0002.close();
         }

         if (this.sumXℂ0003 != null) {
            this.sumXℂ0003.close();
         }

         if (this.upperLimitℤ0003 != null) {
            this.upperLimitℤ0003.close();
         }

         if (this.upperLimitℤ0004 != null) {
            this.upperLimitℤ0004.close();
         }

         if (this.vXℂ0031 != null) {
            this.vXℂ0031.close();
         }

         if (this.vXℂ0032 != null) {
            this.vXℂ0032.close();
         }

         if (this.vXℂ0033 != null) {
            this.vXℂ0033.close();
         }

         if (this.vXℂ0034 != null) {
            this.vXℂ0034.close();
         }

         if (this.vXℂ0035 != null) {
            this.vXℂ0035.close();
         }

         if (this.vXℂ0036 != null) {
            this.vXℂ0036.close();
         }

         if (this.vXℂ0037 != null) {
            this.vXℂ0037.close();
         }

         if (this.vXℂ0038 != null) {
            this.vXℂ0038.close();
         }

         if (this.vXℂ0039 != null) {
            this.vXℂ0039.close();
         }

         if (this.valueXℂ0002 != null) {
            this.valueXℂ0002.close();
         }

         if (this.valueXℂ0003 != null) {
            this.valueXℂ0003.close();
         }

         if (this.vℝ0029 != null) {
            this.vℝ0029.close();
         }

         if (this.vℝ0030 != null) {
            this.vℝ0030.close();
         }

         if (this.vℝ0031 != null) {
            this.vℝ0031.close();
         }

         if (this.vℝ0032 != null) {
            this.vℝ0032.close();
         }

         if (this.vℝ0033 != null) {
            this.vℝ0033.close();
         }

         if (this.vℝ0034 != null) {
            this.vℝ0034.close();
         }

         if (this.vℝ0035 != null) {
            this.vℝ0035.close();
         }

         if (this.vℝ0036 != null) {
            this.vℝ0036.close();
         }

         if (this.vℝ0037 != null) {
            this.vℝ0037.close();
         }

         if (this.vℤ0008 != null) {
            this.vℤ0008.close();
         }

         if (this.vℤ0009 != null) {
            this.vℤ0009.close();
         }

         if (this.vℤ0010 != null) {
            this.vℤ0010.close();
         }

         if (this.vℤ0011 != null) {
            this.vℤ0011.close();
         }

         if (this.vℤ0012 != null) {
            this.vℤ0012.close();
         }

         if (this.context != null) {
            this.context.closeOwnedInstances();
         }
      }
   }

   @Override
   public String getName() {
      return "da";
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
      return "da:when(k=1,pdv/Γ(μ+1),else,(Γ(((k-1)*μ)+1)/Γ((k*μ)+1))*((((qdv*a(k-1))+(q*da(k-1)))+(rdv*Σj➔a(j)*a((%s-1)-j){j=1…k-2}))+(r*Σj➔(da(j)*a((%s-1)-j))+(a(j)*da((%s-1)-j)){j=1…k-2})))";
   }

   @Override
   public String typeset() {
      return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\frac{pdv}{\\Gamma(\\left(μ + 1\\right))} & \\\\text{if } \\left(k = 1\\right)\\\\\\\\\\n\\left(\\frac{\\Gamma(\\left(\\left(\\left(k-1\\right) \\cdot μ\\right) + 1\\right))}{\\Gamma(\\left(\\left(k \\cdot μ\\right) + 1\\right))} \\cdot \\left(\\left(\\left(\\left(qdv \\cdot \\a\\left(\\left(k-1\\right)\\right)\\right) + \\left(q \\cdot \\da\\left(\\left(k-1\\right)\\right)\\right)\\right) + \\left(rdv \\cdot \\sum_{j = 1}^{\\left(k-2\\right)}{\\left(\\a\\left(j\\right) \\cdot \\a\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right)}\\right)\\right) + \\left(r \\cdot \\sum_{j = 1}^{\\left(k-2\\right)}{\\left(\\left(\\da\\left(j\\right) \\cdot \\a\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right) + \\left(\\a\\left(j\\right) \\cdot \\da\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\right)\\right)}\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
   }
}
