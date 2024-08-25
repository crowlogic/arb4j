package arb.functions;

import arb.*;
import arb.Integer;
import arb.functions.rational.RationalHypergeometricFunction;
import arb.functions.rational.RationalNullaryFunction;

public class vNTimes implements
                     RationalNullaryFunction,
                     Typesettable,
                     AutoCloseable,
                     Initializable
{
  public static void main(String... args)
  {
    vNTimes v = new vNTimes();
    v.n=Real.of("3",128);
    v.v = RealConstants.half;
    RationalFunction f = v.evaluate(128);
    System.out.format("%s=%s\n", v,f);
  }

  public boolean                        isInitialized;
  public final Integer                  cℤ2 = new Integer("1");
  public final Integer                  cℤ1 = new Integer("2");
  public Real                           n;
  public Real                           v;
  public Real                           ℝ1;
  public RationalFunction               q1  = new RationalFunction();
  public RationalFunction               q2;
  public Real                           ℝ2;
  public RationalFunction               q3;
  public RationalFunction               q4;
  public RationalFunction               q5;
  public RationalHypergeometricFunction hypqF1;
  public RationalFunction               elementq1;
  public Fraction                       vf1 = new Fraction();
  public Fraction                       vf2;
  public Fraction                       f1;
  public Fraction                       f2;
  public Fraction                       f3;
  public Fraction                       f4;
  public Fraction                       f5;
  public Real                           ℝ3;
  public Real                           ℝ4;
  public Real                           ℝ5;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Object in, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return v.ascendingFactorial(n, bits, ℝ1)
            .mul(q1.identity().div(cℤ1, bits, q2).pow(n.neg(ℝ2), bits, q3), bits, q4)
            .mul(q5.set(elementq1), bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (v == null)
    {
      throw new AssertionError("v shan't be null");
    }
    else if (n == null)
    {
      throw new AssertionError("n shan't be null");
    }
    else
    {
      hypqF1.init(vf1.set(new Fraction[]
      { FractionConstants.oneHalf.sub(n.div(cℤ1, 128, ℝ3), 128, f1), n.div(cℤ1, 128, ℝ4).neg(f2) }),
                  vf2.set(new Fraction[]
                  { f3.set(v), n.neg(f4), cℤ2.sub(v, 128, ℝ5).sub(n, 128, f5) }),
                  RationalNullaryFunction.parse("-z^2"));
      hypqF1.evaluate(null, 1, 128, elementq1);
      isInitialized = true;
    }
  }

  public vNTimes()
  {
    q2        = new RationalFunction();
    q3        = new RationalFunction();
    q4        = new RationalFunction();
    vf2       = new Fraction();
    q5        = new RationalFunction();
    hypqF1    = new RationalHypergeometricFunction();
    elementq1 = new RationalFunction();
    f1        = new Fraction();
    f2        = new Fraction();
    f3        = new Fraction();
    f4        = new Fraction();
    f5        = new Fraction();
    ℝ1        = new Real();
    ℝ2        = new Real();
    ℝ3        = new Real();
    ℝ4        = new Real();
    ℝ5        = new Real();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    q1.close();
    vf1.close();
    q2.close();
    q3.close();
    q4.close();
    vf2.close();
    q5.close();
    hypqF1.close();
    elementq1.close();
    f1.close();
    f2.close();
    f3.close();
    f4.close();
    f5.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    ℝ5.close();
  }

  @Override
  public String toString()
  {
    return "v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)";
  }

  @Override
  public String typeset()
  {
    return "(v)_{n} \\cdot {(\\frac{z}{2})}^{(-n)} \\cdot {_2F_3}\\left(\\left[\\left(\\frac{1}{2}-\\frac{n}{2}\\right),-\\frac{n}{2}\\right], \\left[v,-n,\\left(\\left(1-v\\right)-n\\right)\\right] ; -{z}^{2}\\right)";
  }
}
