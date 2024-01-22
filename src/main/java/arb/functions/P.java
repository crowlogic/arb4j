package arb.functions;

import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class P implements
               Function<Integer, RealPolynomial>
{
  public static void main(String args[])
  {
    P P = new P();
    P.α = new Real("-0.5",
                   128);
    P.β = new Real("-0.5",
                   128);
    P.initializeContext();
    for (int n = 0; n < 10; n++)
    {
      RealPolynomial p = P.evaluate(new Integer(n), 128, new RealPolynomial());
      out.format("P(%d,x)=%s\n", n, p);
    }

  }

  private boolean       isInitialized;
  public Integer        const1 = new Integer("0");
  public Integer        const2 = new Integer("1");
  public Integer        const3 = new Integer("2");
  public Real           α;
  public Real           β;
  public Real           r1     = new Real();
  public Real           r2     = new Real();
  public RealPolynomial rp1    = new RealPolynomial();
  public RealPolynomial rp2    = new RealPolynomial();
  public RealPolynomial rp3    = new RealPolynomial();
  public RealPolynomial rp4    = new RealPolynomial();
  public Integer        i1     = new Integer();
  public RealPolynomial rp5    = new RealPolynomial();
  public RealPolynomial rp6    = new RealPolynomial();
  public Real           r3     = new Real();
  public Real           r4     = new Real();
  public Integer        i2     = new Integer();
  public RealPolynomial rp7    = new RealPolynomial();
  public RealPolynomial rp8    = new RealPolynomial();
  public RealPolynomial rp9    = new RealPolynomial();
  public Real           r5     = new Real();
  public Real           r6     = new Real();
  public P              P;
  public A              A;
  public B              B;
  public C              C;
  public E              E;
  public F              F;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initializeContext();
    }

    if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      return switch (in.getSignedValue())
      {
      case 0 -> result.set(const2);
      case 1 -> C.evaluate(r1.set(const2), order, bits, r2)
                 .mul(result.identity(), bits, rp1)
                 .sub(β, bits, rp2)
                 .add(α, bits, rp3)
                 .div(const3, bits, result);
      default ->
      {
        if (P == null)
        {
          P = new P(this);
          P.initializeContext();
        }

        yield A.evaluate(in, order, bits, rp4)
               .mul(P.evaluate(in.sub(1, bits, i1), order, bits, rp5), bits, rp6)
               .sub(B.evaluate(r3.set(in), order, bits, r4)
                     .mul(P.evaluate(in.sub(2, bits, i2), order, bits, rp7), bits, rp8),
                    bits,
                    rp9)
               .div(E.evaluate(r5.set(in), order, bits, r6), bits, result);
      }
      };
    }
  }

  public P()
  {
  }

  public void initializeContext()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      A var10001 = A = new A();
      A.α = α;
      A.β = β;
      A.initializeContext();
      A = var10001;
      B var1 = B = new B();
      B.α = α;
      B.β = β;
      B.initializeContext();
      B = var1;
      C var2 = C = new C();
      C.α = α;
      C.β = β;
      C.initializeContext();
      C = var2;
      E var3 = E = new E();
      E.α = α;
      E.β = β;
      E.initializeContext();
      E             = var3;
      isInitialized = true;
    }
  }

  public P(P var1)
  {
    this();
    if (var1.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (var1.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      α = var1.α;
      β = var1.β;
    }
  }

  public void close()
  {
    const1.close();
    const2.close();
    const3.close();
    r1.close();
    r2.close();
    rp1.close();
    rp2.close();
    rp3.close();
    rp4.close();
    i1.close();
    rp5.close();
    rp6.close();
    r3.close();
    r4.close();
    i2.close();
    rp7.close();
    rp8.close();
    rp9.close();
    r5.close();
    r6.close();
    P.close();
  }
}
