package arb.expressions;

import arb.*;
import arb.Integer;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.integer.RealSequence;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @see FunctionNode#substitute(String, Node)
 * @see Expression#inlineFunction(String)
 */
public class ExpressionTest extends
                            TestCase
{
  public void testConstantFolding()
  {
    var F = RealNullaryFunction.parse("f:((((-1)^3)-(2*((-1)^2)))-1)");
    RealNullaryFunction f = F.instantiate();
    Real x = f.evaluate();
    assertEquals( "-4", x.toString() );
    System.out.println("f=" + F.inspect(f) );
    assertEquals( "-4" , F.toString());

  }
  /**
   * Register f(x)=x² in a shared {@link Context}, define g(x)=f(x)+1 in the same
   * {@link Context}, inline f into g, and verify that the resulting expression's
   * {@link Node#toString()} no longer references f(x) and instead contains the
   * inlined body x².
   */
  @SuppressWarnings("unused")
  public void testInlineContextualFunction()
  {
    try ( Context context = new Context())
    {
      var F = RealFunction.parse("f:x➔x²", context);
      var G = RealFunction.parse("g:x➔f(x)+1", context);
      assertEquals("g:x➔f(x)+1", G.toString());
      G.inlineFunction("f");
      assertEquals("g:x➔(x^2)+1", G.toString());
    }
  }

  public static void testToString()
  {
    var expr = RealFunction.express("f:x➔sin(x)");
    assertEquals("f:x➔sin(x)", expr.toString());
  }

  /**
   * Expresses a {@link RealFunctionSequence} H:i→i*x, evaluates it at i=1 to
   * obtain f1, then mutates the same {@link Integer} to 3 and evaluates again to
   * obtain f2. Asserts that f1 and f2 produce different results at x=2, proving
   * that the independent variable was copied by value rather than by reference.
   *
   * <p>
   * With the old (buggy) code that assigned by reference
   * ({@code var10000.i = i}), both f1 and f2 would share the same {@link Integer}
   * object. After {@code i.set(3)}, f1 would also see i=3, making f1(2)=6 instead
   * of the correct f1(2)=2.
   * </p>
   */
  public void testPropagateIndependentVariableCopiesByValue()
  {
    var     H = RealFunctionSequence.express("H:i->i*x");

    Integer i = new Integer();

    i.set(1);
    RealFunction f1 = H.evaluate(i, 1, 128, null);

    i.set(3);
    RealFunction f2    = H.evaluate(i, 1, 128, null);

    double       f1At2 = f1.eval(2.0);
    double       f2At2 = f2.eval(2.0);

    assertEquals("f1 should use i=1: f1(2) = 1*2 = 2.0", 2.0, f1At2);
    assertEquals("f2 should use i=3: f2(2) = 3*2 = 6.0", 6.0, f2At2);
    assertFalse("f1 and f2 must not be equal since i was copied by value, not by reference",
                f1At2 == f2At2);
  }

  public static void testRealToComplexFunctionWithSum()
  {
    var f =
          RealToComplexFunction.express("x->sin(sum(k➔x^k{k=2..4}))*cos(sum(k➔x^(k-1/2){k=2..4}))");
    var r = f.realPart().eval(2.3);
    assertFalse(Double.isNaN(r));
  }

  public static void testAnotherTrigIntegral()
  {
    var f = ComplexFunction.parse("T->int(exp(I*t),t=0…T)");

    f.rootNode = f.rootNode.simplify();
    assertEquals("T➔(exp(ⅈ*T)/ⅈ)-(1/ⅈ)", f.toString());

  }

  public static void testFourierTransformOfType1ChebyshevPolynomialsComplexFunction()
  {
    var context = new Context(Integer.named("m").set(4));

    ComplexFunction.express("A:pFq([1,m,-m],[½],I/2/y)*exp(2*I*π*m-y*I)", context);
    ComplexFunction.express("B:pFq([1,m,-m],[½],-I/2/y)*exp(m*π*I+y*I)", context);
    var f = ComplexFunction.express("F:y➔I*(A(y)-B(y))/y", context);
    var y = f.eval(2.3, new Complex());

    assertTrue(y.re().toString().startsWith("0.40342938701065"));
    assertTrue(y.im().doubleValue() < 10e-15);
  }

  public static void testSimplificationAConstantIntegerRaisedToAConstantInteger()
  {
    var f = RealNullaryFunction.parse("5^3");
    f.simplify();
    assertEquals("125", f.toString());
  }

  public static void testDerivativeOfLogarithm()
  {
    var x = RealFunction.parse("∂ln(x)/∂x");
    assertEquals("1/x", x.rootNode.toString());
  }

  public static void testDerivativeOfExponentialFunction()
  {
    var x = RealFunction.parse("∂exp(x)/∂x");
    assertEquals("exp(x)", x.rootNode.toString());
  }

  public static void testAFractionConstantMinusAFractionConstant()
  {
    var f = RationalNullaryFunction.parse("½-¼");
    f.simplify();
    assertEquals("1/4", f.toString());
    RationalNullaryFunction instance = f.instantiate();
    RationalFunction        val      = instance.evaluate();
    Fraction                hmm      = val.evaluate(new Fraction());
    assertEquals(0.25, hmm.doubleValue());
  }

  public static void testAFractionConstantPlusAFractionConstant()
  {
    var f = RationalNullaryFunction.parse("½+¼");
    f.simplify();
    assertEquals("3/4", f.toString());
    RationalNullaryFunction instance = f.instantiate();
    RationalFunction        val      = instance.evaluate();
    Fraction                hmm      = val.evaluate(new Fraction());
    assertEquals(0.75, hmm.doubleValue());
  }

  public static void testConstantIntegerTimesAConstantInteger()
  {
    var f = RealNullaryFunction.parse("5*3");
    assertEquals("15", f.toString());
    assertEquals(15.0, f.instantiate().evaluate(128).doubleValue());
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
    assertEquals(-0.452709380316814, eval.re().doubleValue());
    assertTrue(eval.im().isZero());
  }

  public static void testArgOfZetaOnTheCriticalLineReal()
  {
    RealFunction f    = RealFunction.express("t->arg(ζ(1/2+I*t))");
    Real         eval = f.eval(2.3, new Real());
    assertEquals(-0.452709380316814, eval.doubleValue());
  }

  public void testIntegerToNegativeIntegerPower()
  {
    RealNullaryFunction f   = RealNullaryFunction.express("3^(-3)");
    Real                val = f.evaluate(128);
    assertEquals(1.0 / 27.0, val.doubleValue());
  }

  public void testDerivative()
  {
    var context = new Context(Real.named("x"));
    var x       = RealNullaryFunction.express("∂x/∂x", context);
    assertEquals("1", x.typeset());
  }

  public void testDerivativeToo()
  {
    Context context = new Context(Real.named("y"),
                                  Real.named("x"));
    var     x       = RealNullaryFunction.express("∂y/∂x", context);
    assertEquals("0", x.typeset());
  }

  /**
   * See {@link TestCompiledDerivative} for modified decompiled thing that the
   * code needs to be modified to generate
   * 
   */
  public void testRealFunctionDerivative()
  {

    var          context = new Context(Real.named("a").set(2),
                                       Real.named("b").set(4),
                                       Real.named("c").set(6));
    RealFunction x       = Function.express(Real.class,
                                            Real.class,
                                            RealFunction.class,
                                            "x->∂a*x+b*x²+c*x³/∂x",
                                            context);

    var          y       = x.evaluate(new Real("2.3",
                                               128),
                                      1,
                                      128,
                                      new Real());
    y.printPrecision = false;
    assertEquals(115.62, y.doubleValue());
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

  /**
   * Regression test for
   * <a href="https://github.com/crowlogic/arb4j/issues/698">#698</a>: ensures
   * that every node in the expression AST has a non-null generatedType after
   * instantiation, particularly the integer literal children of Fraction-typed
   * DivisionNodes (e.g. 1/4 used as an exponent).
   */
  public static void testNoNullGeneratedTypesInExpressionAST()
  {
    var F = RealFunction.parse("s->√(π)*Γ(¾)*J(¼,|s|)*2^¼/|s|^¼");
    var f = F.instantiate();
    f.evaluate(new Real("3",
                        128),
               1,
               128,
               new Real());
    String inspection = F.inspect(f).toString();
    assertFalse("Expression AST contains node(s) with null generatedType: " + inspection,
                inspection.contains("(null)"));
  }

  public static void testSumTypeset()
  {
    var x = RealNullaryFunction.express("∑k{k=2...4}");
    assertEquals("\\sum_{k = 2}^{4}{k}", x.typeset());
  }

  public static void testWholeFractionDifference()
  {
    var x = RealNullaryFunction.express("[½-3/2]");
    var d = x.evaluate(128, new Real());
    assertTrue(d.neg().isOne());
  }

  public static void testRealSquareRootOfOneHalf()
  {
    RealNullaryFunction expression          = RealNullaryFunction.express("⌊100/√(1⁄2)⌋");
    Real                squareRootOfOneHalf = expression.evaluate(128);
    assertEquals(141.0, squareRootOfOneHalf.doubleValue());
  }

  public static void testIntegerPartOfSquareRootOfOneHalf()
  {
    IntegerNullaryFunction expression          = IntegerNullaryFunction.compile("⌊100/√(1⁄2)⌋");
    Integer                squareRootOfOneHalf = expression.evaluate(128);
    assertEquals(141, squareRootOfOneHalf.getUnsignedValue());
  }

  public static void testIntegerPartOfSquareRootOfOneHalfToo()
  {
    Integer squareRootOfOneHalf = Integer.express("⌊100/√(1⁄2)⌋");
    assertEquals(141, squareRootOfOneHalf.getUnsignedValue());
  }

  public void testBinomialCoefficient()
  {
    IntegerFunction f            = IntegerFunction.express("binom(5,n)");
    Integer         permutations = f.eval(3);
    assertEquals(10, permutations.getSignedValue());
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
    var    F   =
             RealPolynomialNullaryFunction.parse("F",
                                                 "Σn➔zⁿ/n!*∏k➔αₖ₍ₙ₎{k=1…p}*∏k➔βₖ₍ₙ₎{k=1…q}{n=0…N}",
                                                 context);
    String str = F.toString();
    assertEquals("F:Σn➔z^(n)/n!*∏k➔αₖ₍ₙ₎{k=1…p}*∏k➔βₖ₍ₙ₎{k=1…q}{n=0…N}", str);
    var transformedExpression = F.substitute("z", RealFunction.parse("2*z"));
    str = transformedExpression.toString();
    assertEquals("F:Σn➔((((2*z)^n)*Πk➔α[k]⋰n{k=1…p})*Πk➔β[k]⋰n{k=1…q})/Γ(n+1){n=0…N}", str);
  }

  public void testSubstitutionToo2()
  {
    Context context = new Context();
    context.registerVariable("p", new Integer(3));
    context.registerVariable("q", new Integer(2));
    context.registerVariable("N", new Integer(3));
    var    F                     =
             RealPolynomialNullaryFunction.parse("F",
                                                 "Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}",
                                                 context);
    var    transformedExpression = F.substitute("z", RealFunction.parse("2*z"));
    String correct                 = "F:Σn➔(((2*z)^n)*Πk➔α[k]⋰n{k=1…p})/(Γ(n+1)*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
    String str                   = transformedExpression.toString();
    // System.out.format("ideal=%s\n str=%s\n", ideal, str );
    assertEquals(correct, str);
  }

  public void testSubstitution()
  {
    var expr = RealFunction.parse("2*x²");
    var subs = RealFunction.parse("½-z/2");

    subs.rootNode.accept(node -> node.expression = expr);

    expr.substitute("x", subs);

    assertTrue(expr.instructions == null);

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

  public void testRatioOfRisingFactorials()
  {

    try ( Real λ = new Real())
    {
      var          context  = new Context(λ.setName("λ").set("3.5", 128));
      RealSequence f        = RealSequence.express("n➔(λ*2)₍ₙ₎/(λ+½)₍ₙ₎", context);
      var          in       = new Integer(4);
      var          evaluate = f.evaluate(in, 128, new Real());
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
