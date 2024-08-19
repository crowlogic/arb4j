package arb.functions.real;

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
  public static void main(String... args)
  {
    nvNTimes m = new nvNTimes();
    m.v = RealConstants.half;
    ComplexRationalFunction x = m.evaluate(3, 128);
    System.out.println("x=" + x);
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

    F f = new F();

    hypqℂF1.init(vfℂ1.set(new ComplexFraction[]
    { cℤ2.div(cℤ1, bits, f1).sub(n.div(cℤ1, bits, f2), bits, fℂ1), n.div(cℤ1, bits, f3).neg(fℂ2) }),
                 vfℂ2.set(new ComplexFraction[]
                 { fℂ3.set(v), n.neg(fℂ4), cℤ2.sub(v, bits, ℝ2).sub(n, bits, fℂ5) }),
                 ComplexRationalNullaryFunction.parse("-z^2"));

    hypqℂF1.context.injectVariableReferences(f);
    hypqℂF1.context.injectVariableReferences(f.factorqℂ1);
    hypqℂF1.context.injectVariableReferences(f.factorqℂ1.factorqℂ2);
    hypqℂF1.context.injectVariableReferences(f.factorqℂ1.factorqℂ3);

    ComplexRationalFunction g = f.evaluate(null, 1, bits, qℂ5);

    System.out.println("g=" + g);
    return v.ascendingFactorial(n, bits, ℝ1)
            .mul(qℂ1.identity().div(cℤ1, bits, qℂ2).pow(n.neg(ℤ1), bits, qℂ3), bits, qℂ4)
            .mul(g, bits, result);
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
