package arb.expressions;

import arb.Complex;
import arb.Fraction;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.functions.Function;
import arb.functions.IntegerFunction;
import arb.functions.IntegerNullaryFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealFunctional;
import arb.functions.real.RealNullaryFunction;
import arb.functions.real.TestCompiledDerivative;
import junit.framework.TestCase;

/**
 * @author StΣνε
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTest extends
                            TestCase
{
  public static void testAFractionConstantTimesAFractionConstant()
  {
    var f = RationalNullaryFunction.parse("½+¼");
    f.simplify();
    assertEquals("3/4", f.toString());
    RationalNullaryFunction instance = f.instantiate();
    RationalFunction val = instance.evaluate();
    
    Fraction hmm = val.evaluate(new Fraction());
    assertEquals(0.75, hmm.doubleValue());
  }

  public static void testConstantIntegerTimesAConstantInteger()
  {
    var f = RealNullaryFunction.parse("5*3");
    f.simplify();
    assertEquals(15.0, f.instantiate().evaluate(128).doubleValue());
    assertEquals("15", f.toString());
  }

  public static void testSimplificationOneTimesZero()
  {
    var f = RealNullaryFunction.parse("1*0");
    f.simplify();
    assertEquals(0.0, f.instantiate().evaluate(128).doubleValue());
    assertEquals("0", f.toString());
  }

  public static void testSimplificationAConstantTimesOneIsTheConstant()
  {
    var f = RealNullaryFunction.parse("5*1");
    f.simplify();
    assertEquals(5.0, f.instantiate().evaluate(128).doubleValue());
    assertEquals("5", f.toString());
  }

  public static void testSimplificationOneTimesAConstantIsTheConstant()
  {
    var f = RealNullaryFunction.parse("1*5");
    f.simplify();
    assertEquals(5.0, f.instantiate().evaluate(128).doubleValue());
    assertEquals("5", f.toString());
  }

  public static void testSimplificationAConstantTimesZeroIsZero()
  {
    var f = RealNullaryFunction.parse("5*0");
    f.simplify();
    assertEquals(0.0, f.instantiate().evaluate(128).doubleValue());
    assertEquals("0", f.toString());
  }

  public static void testSimplificationZeroTimesAConstantIsZero()
  {
    var f = RealNullaryFunction.parse("0*5");
    f.simplify();
    assertEquals(0.0, f.instantiate().evaluate(128).doubleValue());
    assertEquals("0", f.toString());
  }

  public static void testArgOfZetaOnTheCriticalLineComplex()
  {
    ComplexFunction f    = ComplexFunction.express("t->arg(ζ(1/2+I*t))");
    Complex         eval = f.eval(2.3, new Complex());
    System.out.println("f(2.3)" + eval);

  }

  public static void testArgOfZetaOnTheCriticalLineReal()
  {
    RealFunction f    = RealFunction.express("t->arg(ζ(1/2+I*t))");
    Real         eval = f.eval(2.3, new Real());
    System.out.println("f(2.3)" + eval);

  }

  public void testIntegerToNegativeIntegerPower()
  {
    RealNullaryFunction f   = RealNullaryFunction.express("3^(-3)");
    Real                val = f.evaluate(128);
    assertEquals(1.0 / 27.0, val.doubleValue());
  }

  public void testFourierTransformOfType1ChebyshevPolynomials()
  {
    Context         context = new Context(Integer.named("m").set(2));
    ComplexFunction f       =
                      ComplexFunction.express("y->-I*(pFq([1,m,-m],[1/2],-((1/2)*I)/y)*exp(I*(π*m+y))-pFq([1,m,-m],[1/2],((1/2)*I)/y)*exp(I*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)/((4*m^2*y-2*y)*π)",
                                              context);
    Complex         eval    = f.eval(2.3, new Complex());

    assertEquals("-0.2897102277656836133548571248961385757265", eval.re().doubleValue());
    assertTrue(eval.im().isZero());

  }

  public void testDerivative()
  {
    var x = RealNullaryFunction.express("∂x/∂x");
    assertEquals("1", x.typeset());
  }

  public void testDerivativeToo()
  {
    Context context = new Context(Real.named("y"));
    var     x       = RealNullaryFunction.express("∂y/∂x", context);
    assertEquals("0", x.typeset());
  }

  public void testRealPolynomialDerivative()
  {
    var context = new Context(Real.named("a").set(2),
                              Real.named("b").set(4),
                              Real.named("c").set(6));
    var x       = RealPolynomialNullaryFunction.express("x->∂a*x+b*x²+c*x³/∂x", context);
    assertEquals("x➔∂a*x+b*x²+c*x³/∂x", x.toString());
    var poly = x.evaluate(128);
    assertEquals("18*x² + 8*x + 2", poly.toString());
    var y = poly.evaluate(new Real("2.3",
                                   128),
                          1,
                          128,
                          new Real());
    y.printPrecision = false;
    assertEquals("115.62", y.toString());
  }

  /**
   * See {@link TestCompiledDerivative} for modified decompiled thing that the
   * code needs to be modified to generate
   * 
   */
  public void testRealFunctionDerivative()
  {
    var context = new Context(Real.named("a"),
                              Real.named("b"),
                              Real.named("c"));
    var x       = RealFunctional.express("x->∂a*x+b*x²+c*x³/∂x", context);
    assertEquals("2*a*x+b", x.typeset());
  }

  public void testRationalFunctionDerivative()
  {
    var context = new Context(Real.named("a").set(2),
                              Real.named("b").set(4),
                              Real.named("c").set(6));
    var x       = RationalNullaryFunction.express("x->∂a*x+b*x²+c*x³/∂x", context);
    var poly    = x.evaluate(128);
    assertEquals("18*x^2+8*x+2", poly.toString());
    var y = poly.evaluate(new Real("2.3",
                                   128),
                          1,
                          128,
                          new Real());
    y.printPrecision = false;
    assertEquals("115.62", y.toString());
  }

  public void testSumTypeset()
  {
    var x = RealNullaryFunction.express("∑k{k=2...4}");
    assertEquals("\\sum_{k = 2}^{4}{k}", x.typeset());
  }

  public void testWholeFractionDifference()
  {
    var x = RealNullaryFunction.express("[1/2-3/2]");
    var d = x.evaluate(128, new Real());
    assertTrue(d.neg().isOne());
  }

  public void testRealSquareRootOfOneHalf()
  {
    RealNullaryFunction expression          = RealNullaryFunction.express("⌊100/√(1⁄2)⌋");
    Real                squareRootOfOneHalf = expression.evaluate(128);
    assertEquals(141.0, squareRootOfOneHalf.doubleValue());
  }

  public void testIntegerPartOfSquareRootOfOneHalf()
  {
    IntegerNullaryFunction expression          = IntegerNullaryFunction.compile("⌊100/√(1⁄2)⌋");
    Integer                squareRootOfOneHalf = expression.evaluate(128);
    assertEquals(141, squareRootOfOneHalf.getUnsignedValue());
  }

  public void testIntegerPartOfSquareRootOfOneHalfToo()
  {
    Integer squareRootOfOneHalf = Integer.express("⌊100/√(1⁄2)⌋");
    assertEquals(141, squareRootOfOneHalf.getUnsignedValue());
  }

  public void testBinomialCoefficient()
  {
    IntegerFunction f            = IntegerFunction.express("ℭ(5,n)");
    Integer         permutations = f.eval(3);
    assertEquals(10, permutations.getSignedValue());
  }

  public void testLogOfLommelPolynomialRealExpression()
  {
    var    f   = RealFunction.express("log(1+R(3,½;z)²)");
    double hmm = f.eval(-2.68);
    assertEquals(1.141113163192019433725615596826852379455, hmm);
  }

  public void testLommelPolynomialRealExpression()
  {
    var    f   = RealFunction.express("R(3,1/2;z)");
    // System.out.println("f=" + f);
    double hmm = f.eval(2.3);
    /// System.out.println("f(2.3)="+hmm);
    assertEquals(-1.3758527163639351505, hmm);
  }

  public void testLommelPolynomialRationalExpression()
  {
    var F = RationalNullaryFunction.express("R(3,1/2;z)");
    // System.out.println("F=" + F);
    var f = F.evaluate(128);
    assertEquals("(-6*x^2+15)/(x^3)", f.toString());
    // System.out.println("f=" + f);
    double hmm = f.asRealFunction().eval(2.3);
    // System.out.println("f(2.3)="+hmm);
    assertEquals(-1.3758527163639351505, hmm);
  }

  public void testLogGamma()
  {
    var    f    = RealFunction.express("ln⁡Γ(t)");
    double eval = f.eval(2.3);
    assertEquals(0.15418945495963046, eval);
  }

  public void testAbsoluteValue()
  {
    var  expr   = RealNullaryFunction.express("abs(2.3)");
    Real result = expr.evaluate(128);
    assertEquals(2.3, result.doubleValue());
  }

  public void testImaginary()
  {
    var     expr   = ComplexNullaryFunction.express("ⅈ");
    Complex result = expr.evaluate(128);
    result.forEach(r -> assertTrue(r.isExact()));
    assertTrue(result.re().isZero());
    assertTrue(result.im().isOne());
  }

  public void testVector()
  {
    var expr   = RealNullaryFunction.express("[8,0,8]");
    var result = expr.evaluate(128, new Real());
    result.forEach(r -> assertTrue(r.isExact()));
    assertEquals(8.0, result.get(0).doubleValue());
    assertEquals(0.0, result.get(1).doubleValue());
    assertEquals(8.0, result.get(2).doubleValue());
  }

  public void testSubstitutionToo()
  {
    Context context = new Context();
    context.registerVariable("p", new Integer(3));
    context.registerVariable("q", new Integer(2));
    var F                     =
          RealPolynomialNullaryFunction.parse("F", "Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}", context);
    var transformedExpression = F.substitute("z", RealFunction.parse("2*z"));
    assertEquals("Σn➔(((2*z)^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q}){n=0…N}", transformedExpression.toString());
  }

  public void testSubstitutionToo2()
  {
    Context context = new Context();
    context.registerVariable("p", new Integer(3));
    context.registerVariable("q", new Integer(2));
    context.registerVariable("N", new Integer(3));
    var F                     =
          RealPolynomialNullaryFunction.parse("F", "n➔Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}", context);
    var transformedExpression = F.substitute("z", RealFunction.parse("2*z"));
    assertEquals("Σn➔(((2*z)^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q}){n=0…N}", transformedExpression.toString());
  }

  public void testSubstitution()
  {
    var expr = RealFunction.parse("2*x²");
    var subs = RealFunction.parse("½-z/2");

    subs.rootNode.accept(node -> node.expression = expr);

    expr.substitute("x", subs);

    assertTrue(expr.instructionByteCodes == null);

    var f = expr.generate();
    var g = f.instantiate();
    var x = new Real("8.08",
                     256);
    assertEquals(25.0632, g.evaluate(x, 0, 256).doubleValue());
  }

  public void testIntegralOfAConstant()
  {
    var integral = RealFunction.express("∫x➔1dx∈(2,4)");
    assertEquals(2.0, integral.eval(0.0));
  }

  public void testSuperscriptLowercaseQ()
  {
    assertEquals("𐞥", String.format("%c", Parser.lowercaseSuperscriptAlphabet[16]));
  }

  public void testConflictingFunctionNameDefinitionThrowsException()
  {
    boolean caughtException = false;
    try
    {
      RealFunction func = RealFunction.express("G", "F: x₍₃₎", null);
      try ( Real result = func.evaluate(new Real("5",
                                                 128),
                                        0,
                                        128,
                                        new Real()))
      {
      }
    }
    catch (CompilerException e)
    {
      String message = e.getMessage();
      assertTrue(message.contains("'F'"));
      assertTrue(message.contains("'G"));
      caughtException = true;
    }
    assertTrue(caughtException);
  }

  public void testRatioOfRisingFactorials()
  {

    try ( Real λ = new Real())
    {
      Context                 context  = new Context(λ.setName("λ").set("3.5", 128));
      Function<Integer, Real> f        = Function.express(Integer.class, Real.class, "n➔(λ*2)₍ₙ₎/(λ+½)₍ₙ₎", context);
      Integer                 in       = new Integer(4);
      Real                    evaluate = f.evaluate(in, 128, new Real());
      assertEquals(6.0, evaluate.doubleValue());
    }
  }

  public void testProductViaFactorial()
  {
    IntegerFunction f        = IntegerFunction.express("n➔∏k{k=1…n}");
    Integer         in       = new Integer(3);
    Integer         evaluate = f.evaluate(in, 128, new Integer());
    assertEquals(6, evaluate.getUnsignedValue());
  }

  public void testGammaReal()
  {
    RealFunction func   = RealFunction.express("Γ(4.0)");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(6.0, result.doubleValue());
  }

  public void testGamma()
  {
    RealFunction func   = RealFunction.express("Γ(4)");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(6.0, result.doubleValue());
  }

  public void testFactorial()
  {
    RealFunction func   = RealFunction.express("4!");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(24.0, result.doubleValue());
  }

  public void testFactorialToo()
  {
    RealFunction func   = RealFunction.express("x!");
    Real         result = func.evaluate(new Real("4",
                                                 128),
                                        0,
                                        128,
                                        new Real());
    assertEquals(24.0, result.doubleValue());
  }

  public void testRisingFactorial()
  {
    RealFunction func   = RealFunction.express("x₍₃₎");
    Real         result = func.evaluate(new Real("5",
                                                 128),
                                        0,
                                        128,
                                        new Real());
    assertEquals(210.0, result.doubleValue());
  }

  /**
   * {@link #testVariableIndexedByASubscriptAndMultipliedByTheDefactoInput()} is
   * equivalent to this but with the other syntax where the i-th element of x is
   * specified by xᵢ
   */
  public void testVariableIndexedByASquareBracketedConstantAndMultipliedByTheDefactoInput()
  {
    Real         α       = Real.newVector(3);
    Context      context = new Context(α.setName("α"));
    RealFunction f       = RealFunction.express("α[1]*t", context);
    α.get(0).set(RealConstants.π);
    Real twoPi = f.evaluate(RealConstants.two, 128, new Real());
    assertTrue(RealConstants.twoπ.approximatelyEquals(twoPi, 257));
  }

  /**
   * {@link #testVariableIndexedByASquareBracketedConstantAndMultipliedByTheDefactoInput()}
   * is equivalent to this but with the other syntax where the i-th element of x
   * is specified by x[i]
   */
  public void testVariableIndexedByASubscriptAndMultipliedByTheDefactoInput()
  {
    Real         α       = Real.newVector(3);
    Context      context = new Context(α.setName("α"));
    RealFunction f       = RealFunction.express("α₁*t", context);
    α.get(0).set(RealConstants.π);
    Real twoPi = f.evaluate(RealConstants.two, 128, new Real());
    assertTrue(RealConstants.twoπ.approximatelyEquals(twoPi, 257));
  }
}
