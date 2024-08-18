package arb.functions;

import arb.*;
import arb.Integer;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.functions.rational.ComplexRationalHypergeometricFunction;
import arb.functions.rational.ComplexRationalNullaryFunction;

public class nvNTimes implements
                      ComplexRationalFunctionSequence,
                      Typesettable,
                      AutoCloseable,
                      Initializable
{
  public static void main(String args[])
  {
    nvNTimes main = new nvNTimes();
    main.v = RealConstants.half;
    ComplexRationalFunction f = main.evaluate(3, 0);
    System.out.format("f(%s)=%s\n", main, f);
  }

  public boolean                               isInitialized;
  Integer                                      cℤ2     = new Integer("1");
  Integer                                      cℤ1     = new Integer("2");
  public Real                                  v;
  public ComplexRationalFunction               qℂ5     = new ComplexRationalFunction();
  public ComplexRationalFunction               qℂ2     = new ComplexRationalFunction();
  public ComplexFraction                       vfℂ1    = new ComplexFraction();
  public ComplexRationalFunction               qℂ1     = new ComplexRationalFunction();
  public ComplexRationalFunction               qℂ4     = new ComplexRationalFunction();
  public ComplexRationalHypergeometricFunction hypqℂF1 =
                                                       new ComplexRationalHypergeometricFunction();
  public ComplexRationalFunction               qℂ3     = new ComplexRationalFunction();
  public Integer                               ℤ1      = new Integer();
  public Fraction                              f1      = new Fraction();
  public Fraction                              f2      = new Fraction();
  public Fraction                              f3      = new Fraction();
  public Real                                  ℝ1      = new Real();
  public ComplexFraction                       fℂ1     = new ComplexFraction();
  public Real                                  ℝ2      = new Real();
  public ComplexFraction                       fℂ3     = new ComplexFraction();
  public ComplexFraction                       fℂ2     = new ComplexFraction();
  public ComplexFraction                       vfℂ2    = new ComplexFraction();
  public ComplexFraction                       fℂ5     = new ComplexFraction();
  public ComplexFraction                       fℂ4     = new ComplexFraction();

  @Override
  public Class<ComplexRationalFunction> coDomainType()
  {
    return ComplexRationalFunction.class;
  }

  @Override
  public ComplexRationalFunction
         evaluate(Integer n, int order, int bits, ComplexRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Fraction ass = cℤ2.div(cℤ1, bits, f1);
    Fraction cunt = n.div(cℤ1, bits, f2);
    ComplexFraction fuck = ass.sub(cunt, bits, fℂ1);
    Fraction twat = n.div(cℤ1, bits, f3);
    ComplexFraction shit = twat.neg(fℂ2);
    ComplexFraction numerator   = vfℂ1.set(fuck,
                               shit);

    ComplexFraction denominator = vfℂ2.set(fℂ3.set(v), n.neg(fℂ4), cℤ2.sub(v, bits, ℝ2).sub(n, bits, fℂ5));

    var arg         = ComplexRationalNullaryFunction.parse("-z^2");

    hypqℂF1.init(numerator, denominator, arg);

    var element = hypqℂF1.evaluate(null, 1, bits, qℂ5);

    return v.ascendingFactorial(n, bits, ℝ1)
            .mul(qℂ1.identity().div(cℤ1, bits, qℂ2).pow(n.neg(ℤ1), bits, qℂ3), bits, qℂ4)
            .mul(element, bits, result);
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
    qℂ5.close();
    qℂ2.close();
    vfℂ1.close();
    qℂ1.close();
    qℂ4.close();
    hypqℂF1.close();
    qℂ3.close();
    ℤ1.close();
    f1.close();
    f2.close();
    f3.close();
    ℝ1.close();
    fℂ1.close();
    ℝ2.close();
    fℂ3.close();
    fℂ2.close();
    vfℂ2.close();
    fℂ5.close();
    fℂ4.close();
  }

  @Override
  public String toString()
  {
    return "n➔v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z²)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left((v)_{n} \\cdot (\\frac{z}{2})^{(-n)}\\right) \\cdot {_2F_3}\\left(\\left[\\left(\\frac{1}{2}-\\frac{n}{2}\\right),-\\frac{n}{2}\\right], \\left[v,-n,\\left(\\left(1-v\\right)-n\\right)\\right] ; -(z)^{(2)}\\right)\\right)";
  }
}
