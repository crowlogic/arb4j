package arb.functions.real;

import arb.*;
import arb.Integer;
import arb.functions.sequences.RationalFunctionSequence;

public class vNTimes implements RationalFunctionSequence, Typesettable, AutoCloseable, Initializable
{
  public static void main(String args[])
  {
    vNTimes vnTimes = new vNTimes();
    vnTimes.v = RealConstants.half;

    RationalFunction val = vnTimes.evaluate(3, 128);
    System.out.println("val=" + val);
  }

  public boolean          isInitialized;
  Integer                 cℤ2 = new Integer("1");
  Integer                 cℤ1 = new Integer("2");
  public Real             v;
  public Fraction         vf1 = new Fraction();
  public Fraction         vf2 = new Fraction();
  public Integer          ℤ1  = new Integer();
  public Fraction         f1  = new Fraction();
  public Fraction         f2  = new Fraction();
  public Fraction         f3  = new Fraction();
  public Fraction         f4  = new Fraction();
  public Fraction         f5  = new Fraction();
  public Real             ℝ1  = new Real();
  public Fraction         f6  = new Fraction();
  public Fraction         f7  = new Fraction();
  public Real             ℝ2  = new Real();
  public Fraction         f8  = new Fraction();
  public RationalFunction fℝ4 = new RationalFunction();
  public RationalFunction fℝ3 = new RationalFunction();
  public RationalFunction fℝ5 = new RationalFunction();
  public RationalFunction fℝ2 = new RationalFunction();
  public RationalFunction fℝ1 = new RationalFunction();

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Fraction topLeft     = cℤ2.div(cℤ1, bits, f1).sub(n.div(cℤ1, bits, f2), bits, f3);
    Fraction topRight    = n.div(cℤ1, bits, f4).neg(f5);
    Fraction numerator   = vf1.set(topLeft, topRight);
    Fraction denominator = vf2.set(f6.set(v), n.neg(f7), cℤ2.sub(v, bits, ℝ2).sub(n, bits, f8));
    System.out.format("topLeft=%s\ntopRight=%s\nnumerator=%s\ndenominator=%s\n",
                      numerator,
                      denominator,
                      topLeft,
                      topRight);

    var arg = RationalNullaryFunction.parse("-z^2");
    var f   = new RationalHypergeometricFunction(numerator,
                                                 denominator,
                                                 arg);
    return v.ascendingFactorial(n, bits, ℝ1)
            .mul(fℝ1.identity().div(cℤ1, bits, fℝ2).pow(n.neg(ℤ1), bits, fℝ3), bits, fℝ4)
            .mul(f.evaluate(null, 1, bits, fℝ5), bits, result);
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
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    vf1.close();
    vf2.close();
    ℤ1.close();
    f1.close();
    f2.close();
    f3.close();
    f4.close();
    f5.close();
    ℝ1.close();
    f6.close();
    f7.close();
    ℝ2.close();
    f8.close();
    fℝ4.close();
    fℝ3.close();
    fℝ5.close();
    fℝ2.close();
    fℝ1.close();
  }

  @Override
  public String toString()
  {
    return "n➔v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z^2)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left((v)_{n} \\cdot (\\frac{z}{2})^{(-n)}\\right) \\cdot ${_2F_3}\\left(\\left[\\left(\\frac{1}{2}-\\frac{n}{2}\\right),-\\frac{n}{2}\\right], \\left[v,-n,\\left(\\left(1-v\\right)-n\\right)\\right] ; -(z)^{(2)}\\right)\\right)";
  }
}
