package arb.functions;

import static java.lang.System.out;
import static org.junit.Assert.assertEquals;

import arb.*;
import arb.Integer;
import arb.expressions.Expression;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.rational.RationalHypergeometricFunction;
import arb.functions.rational.RationalNullaryFunction;

public class DecompiledLommelPolynomialSequenceTest implements
                                                    RationalFunctionSequence,
                                                    Typesettable,
                                                    AutoCloseable,
                                                    Initializable
{
  public static void main(String args[])
  {
    DecompiledLommelPolynomialSequenceTest n = new DecompiledLommelPolynomialSequenceTest();
    n.v = RealConstants.half;
    RationalFunction thirdLommelPolynomial = n.evaluate(3, 128);
    System.out.println("L(3)=" + thirdLommelPolynomial);
    assertEquals( "(-6*x^2+15)/(x^3)", thirdLommelPolynomial.toString() );
  }

  public boolean                        isInitialized;
  Integer                               cℤ2    = new Integer("1");
  Integer                               cℤ1    = new Integer("2");
  public Real                           v;
  public RationalFunction               q1     = new RationalFunction();
  public Fraction                       vf1    = new Fraction();
  public RationalFunction               q2     = new RationalFunction();
  public RationalFunction               q3     = new RationalFunction();
  public RationalFunction               q4     = new RationalFunction();
  public Fraction                       vf2    = new Fraction();
  public RationalFunction               q5     = new RationalFunction();
  public RationalHypergeometricFunction hypqF1 = new RationalHypergeometricFunction();
  public Integer                        ℤ1     = new Integer();
  public Fraction                       f1     = new Fraction();
  public Fraction                       f2     = new Fraction();
  public Fraction                       f3     = new Fraction();
  public Fraction                       f4     = new Fraction();
  public Fraction                       f5     = new Fraction();
  public Real                           ℝ1     = new Real();
  public Fraction                       f6     = new Fraction();
  public Real                           ℝ2     = new Real();
  public Fraction                       f7     = new Fraction();

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

    Fraction numerator   = vf1.set(FractionConstants.oneHalf.sub(n.div(cℤ1, bits, f1), bits, f2),
                                   n.div(cℤ1, bits, f3).neg(f4));
    Fraction denominator = vf2.set(f5.set(v), n.neg(f6), cℤ2.sub(v, bits, ℝ2).sub(n, bits, f7));

    System.out.format("numer=%s\ndenom=%s\n", numerator, denominator);

    Expression<Object,
                  RationalFunction,
                  RationalNullaryFunction> arg = RationalNullaryFunction.parse("-z^2");
    System.out.println("arg=" + arg);
    @SuppressWarnings("resource")
     var f = new F();
//    RationalHypergeometricFunction h = hypqF1.init(numerator,
//                                                   denominator,
//                                                   RationalNullaryFunction.parse("-z^2"));
    //RationalNullaryFunction        g = f.f;
    //f.context.injectReferences(g);
    //h.context.injectReferences(f);
   // out.println("injecting " + h.context.variables );
//    h.context.injectVariableReferences(f);
//    h.context.injectVariableReferences(f.factorq1);
//    h.context.injectVariableReferences(f.factorq1.factorq2);
//    h.context.injectVariableReferences(f.factorq1.factorq3);
    
//    f.N = f.factorq1.N = f.factorq1.factorq2.N = f.factorq1.factorq3.N = new Integer(2);
//    f.p = f.factorq1.p = f.factorq1.factorq2.p = f.factorq1.factorq3.p = new Integer(numerator.dim);
//    f.q =
//        f.factorq1.q = f.factorq1.factorq2.q = f.factorq1.factorq3.q = new Integer(denominator.dim);
//    f.α =
//        f.factorq1.α = f.factorq1.factorq2.α = f.factorq1.factorq3.α = Real.newVector(numerator.dim)
//                                                                           .set(numerator);
//    f.β =
//        f.factorq1.β =
//                     f.factorq1.factorq2.β = f.factorq1.factorq3.β = Real.newVector(denominator.dim)
//                                                                         .set(denominator);
  //  f.initialize();

    assert bits > 0;
    System.out.println("f=" + f);
    RationalFunction element = f.evaluate(null, 1, bits, q5);
    System.out.println("f=" + f.getClass());

    System.out.println("element=" + element);

    return v.ascendingFactorial(n, bits, ℝ1)
            .mul(q1.identity().div(cℤ1, bits, q2).pow(n.neg(ℤ1), bits, q3), bits, q4)
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
    q1.close();
    vf1.close();
    q2.close();
    q3.close();
    q4.close();
    vf2.close();
    q5.close();
    hypqF1.close();
    ℤ1.close();
    f1.close();
    f2.close();
    f3.close();
    f4.close();
    f5.close();
    ℝ1.close();
    f6.close();
    ℝ2.close();
    f7.close();
  }

  @Override
  public String toString()
  {
    return "n➔v₍ₙ₎*(z/2)^(-n)*pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left((v)_{n} \\cdot (\\frac{z}{2})^{(-n)}\\right) \\cdot {_2F_3}\\left(\\left[\\left(\\frac{1}{2}-\\frac{n}{2}\\right),-\\frac{n}{2}\\right], \\left[v,-n,\\left(\\left(1-v\\right)-n\\right)\\right] ; -(z)^{(2)}\\right)\\right)";
  }
}
