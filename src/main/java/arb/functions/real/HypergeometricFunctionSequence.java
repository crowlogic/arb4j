package arb.functions.real;

import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Context;
import arb.functions.Function;

/**
 * ...
 */
public class HypergeometricFunctionSequence implements
                                            Function<Integer, RealPolynomial>
{

  public static class F implements
                        Function<Integer, RealPolynomial>
  {
    private boolean       isInitialized;
    Integer               c1  = new Integer("0");
    Integer               c2  = new Integer("1");
    public Real           α;
    public Real           β;
    public Integer        ℤ1  = new Integer();
    public RealPolynomial r̅1 = new RealPolynomial();
    public F              F;

    public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
    {
      if (!isInitialized)
      {
        initialize();
      }
      return switch (in.getSignedValue())
      {
      case 0 -> result.set(c2);
      default ->
      {
        RealPolynomial var5 = result.identity();
        if (F == null)
        {
          F = new F(this);
        }

        F.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅1);
        yield var5.mul(r̅1, bits, result);
      }
      };
    }

    public F()
    {
    }

    public void initialize()
    {
      if (isInitialized)
      {
        throw new AssertionError("Already initialized");
      }
      else
      {
        isInitialized = true;
      }
    }

    public F(F var1)
    {
      this();

    }

    public void close()
    {
      c1.close();
      c2.close();
      ℤ1.close();
      r̅1.close();
      F.close();
    }
  }

  public static void main(String... args)
  {
//    HypergeometricFunctionSequence F  = new HypergeometricFunctionSequence(3,
//                                                                           1);
    var            f  = new F();
//    f.α.set(1, 4, -4);
//    f.β.set(0.5);

    RealPolynomial F0 = f.evaluate(new Integer(0), 0, 128, new RealPolynomial());
    out.println("F0=" + F0);
    RealPolynomial F1 = f.evaluate(new Integer(1), 0, 128, new RealPolynomial());
    out.println("F1=" + F1);
    RealPolynomial F2 = f.evaluate(new Integer(2), 0, 128, new RealPolynomial());
    out.println("F2=" + F2);
  }

  public final Context                     context;

  public final Real                        α, β;

  public Function<Integer, RealPolynomial> F;

  public static final String               Fdef = "n➔when(n=0,1,else,x*F(n-1))";

  public HypergeometricFunctionSequence(int p, int q)
  {
    context = new Context(α = Real.newVector(p).setName("α"),
                          β = Real.newVector(q).setName("β"));
    // F = Function.express(Integer.class, RealPolynomial.class, "F", Fdef,
    // context);
  }

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial f)
  {
    return F.evaluate(n, order, bits, f);
  }

}
