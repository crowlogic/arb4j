package arb.functions;

import static java.lang.System.out;

import java.util.ArrayList;
import java.util.Objects;
import java.util.stream.Stream;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class P implements
               Function<Integer, RealPolynomial>,
               AutoCloseable
{
  public static final int precision = 128;

  public static void main(String args[])
  {
    ArrayList<RealPolynomial> polys = new ArrayList<>();

    try ( P P = new P(); Integer index = new Integer();)
    {
      P.α = new Real("-0.50",
                     precision);
      P.β = new Real("-0.50",
                     precision);
      for (int n = 0; n < 21; n++)
      {
        ;
        RealPolynomial p = P.evaluate(index.set(n), precision, new RealPolynomial());
        polys.add(p);
        out.format("P(%d,x)=%s\n", n, p);
      }
    }
  //  ShellFunctions.plot(-1, 1, 1000, polys.toArray(new RealPolynomial[polys.size()]));

  }

  private boolean       isInitialized;
  public Integer        const1 = new Integer("0");
  public Integer        const2 = new Integer("1");
  public Integer        const3 = new Integer("2");
  public Real           α;
  public Real           β;
  public Real           ℝ1     = new Real();
  public Real           ℝ2     = new Real();
  public RealPolynomial r1     = new RealPolynomial();
  public RealPolynomial r2     = new RealPolynomial();
  public RealPolynomial r3     = new RealPolynomial();
  public RealPolynomial r4     = new RealPolynomial();
  public Integer        ℤ1     = new Integer();
  public RealPolynomial r5     = new RealPolynomial();
  public RealPolynomial r6     = new RealPolynomial();
  public Real           ℝ3     = new Real();
  public Real           ℝ4     = new Real();
  public Integer        ℤ2     = new Integer();
  public RealPolynomial r7     = new RealPolynomial();
  public RealPolynomial r8     = new RealPolynomial();
  public RealPolynomial r9     = new RealPolynomial();
  public Real           ℝ5     = new Real();
  public Real           ℝ6     = new Real();
  public P              P;
  public final A        A      = new A();
  public final B        B      = new B();
  public final C        C      = new C();
  public final E        E      = new E();
  public final eff        F      = new eff();
  public final G        G      = new G();

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
      case 1 -> C.evaluate(ℝ1.set(const2), order, bits, ℝ2)
                 .mul(result.identity(), bits, r1)
                 .sub(β, bits, r2)
                 .add(α, bits, r3)
                 .div(const3, bits, result);
      default ->
      {
        if (P == null)
        {
          P = new P(this);
        }

        yield A.evaluate(in, order, bits, r4)
               .mul(P.evaluate(in.sub(const2, bits, ℤ1), order, bits, r5), bits, r6)
               .sub(B.evaluate(ℝ3.set(in), order, bits, ℝ4)
                     .mul(P.evaluate(in.sub(const3, bits, ℤ2), order, bits, r7), bits, r8),
                    bits,
                    r9)
               .div(E.evaluate(ℝ5.set(in), order, bits, ℝ6), bits, result);
      }
      };
    }
  }

  public P()
  {
  }

  private void initializeContext()
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
      A.α           = α;
      A.β           = β;
      B.α           = α;
      B.β           = β;
      C.α           = α;
      C.β           = β;
      E.α           = α;
      E.β           = β;
      isInitialized = true;
    }
  }

  public P(P that)
  {
    this();
    if (that.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (that.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      this.α = that.α;
      this.β = that.β;
    }
  }

  public void close()
  {
    Stream.of(const1, const2, const3, r1, r2, r3, r4, r5, r6, r7, r8, r9, ℝ1, ℝ2, ℝ3, ℝ4, ℝ5, ℝ6, ℤ1, ℤ2, P)
          .filter(Objects::nonNull)
          .forEach(this::closeQuietly);

  }

  private void closeQuietly(AutoCloseable resource)
  {
    try
    {
      resource.close();
    }
    catch (Exception e)
    {
      e.printStackTrace(System.err);
    }
  }

}
