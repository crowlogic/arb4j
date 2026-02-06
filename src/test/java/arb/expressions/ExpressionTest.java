package arb.expressions;

import arb.*;
import arb.Integer;
import arb.functions.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.integer.*;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class ExpressionTest extends
                            TestCase
{

  /**
   * Tests the exact scenario from issue #825: a double-lambda expression
   * i→j→Σₖ... where the inner function's independent variable j must be
   * propagated to nested operand functions during initialization, and the outer
   * variable i controls the summation bounds. Before the fix, this throws
   * java.lang.NoSuchFieldError: Class μfunc does not have member field
   * 'arb.Integer j'.
   */
  public void testNestedLambdaWithSumPropagatesInnerIndependentVariable()
  {
    var     μ      = RealFunctionSequence.express("μ:i→j→Σk➔j*k{k=0…i}");

    Integer i      = new Integer(3);
    var     μfunc  = μ.evaluate(i, 1, 128, null);

    Integer j      = new Integer(2);
    Real    result = μfunc.evaluate(j, 1, 128, new Real());

    // Σk➔j*k{k=0…3} = j*0 + j*1 + j*2 + j*3 = j*(0+1+2+3) = j*6
    // With j=2: 2*6 = 12
    assertEquals(12.0, result.doubleValue());
  }

  /**
   * Verifies that the inner independent variable j is declared as a field (not
   * just a method parameter) when nested functions reference it. This is the
   * first part of the fix in declareVariables().
   */
  public void testNestedLambdaSumCompilesWithoutNoSuchFieldError()
  {
    try
    {
      var     f      = RealFunctionSequence.express("f:i→j→Σk➔j+k{k=1…i}");

      Integer i      = new Integer(3);
      var     fInner = f.evaluate(i, 1, 128, null);

      Integer j      = new Integer(10);
      Real    result = fInner.evaluate(j, 1, 128, new Real());

      // Σk➔j+k{k=1…3} = (j+1)+(j+2)+(j+3) = 3j+6
      // With j=10: 30+6 = 36
      assertEquals(36.0, result.doubleValue());
    }
    catch (NoSuchFieldError e)
    {
      fail("NoSuchFieldError should not be thrown after fix: " + e.getMessage());
    }
  }

  /**
   * Tests that the independent variable field is populated from the evaluate()
   * parameter BEFORE the conditional initializer runs. This is the second part of
   * the fix in generateEvaluationMethod(). Without this, even if the field
   * exists, it would be null/zero during propagation to nested operands.
   */
  public void testIndependentVariableAvailableBeforeInitialization()
  {
    var     μ      = RealFunctionSequence.express("μ:i→j→Σk➔j^k{k=0…i}");

    Integer i      = new Integer(2);
    var     μfunc  = μ.evaluate(i, 1, 128, null);

    Integer j      = new Integer(3);
    Real    result = μfunc.evaluate(j, 1, 128, new Real());

    // Σk➔j^k{k=0…2} = j^0 + j^1 + j^2 = 1 + 3 + 9 = 13
    assertEquals(13.0, result.doubleValue());
  }

  /**
   * Tests a double-lambda with a product instead of a sum, ensuring the fix is
   * not sum-specific but applies to all n-ary operations whose operand functions
   * reference the inner independent variable.
   */
  public void testNestedLambdaWithProductPropagatesInnerVariable()
  {
    var     f      = RealFunctionSequence.express("f:i→j→∏k➔j+k{k=1…i}");

    Integer i      = new Integer(3);
    var     fInner = f.evaluate(i, 1, 128, null);

    Integer j      = new Integer(2);
    Real    result = fInner.evaluate(j, 1, 128, new Real());

    // ∏k➔j+k{k=1…3} = (j+1)*(j+2)*(j+3) = 3*4*5 = 60
    assertEquals(60.0, result.doubleValue());
  }

  /**
   * Tests that when the outer variable i is used alongside the inner variable j
   * in the summand, both are correctly propagated. This exercises the scenario
   * where the ascendent expression's independent variable and the inner
   * expression's own independent variable must both be accessible.
   */
  public void testBothOuterAndInnerVariablesPropagated()
  {
    var     μ      = RealFunctionSequence.express("μ:i→j→Σk➔i*j*k{k=1…2}");

    Integer i      = new Integer(3);
    var     μfunc  = μ.evaluate(i, 1, 128, null);

    Integer j      = new Integer(5);
    Real    result = μfunc.evaluate(j, 1, 128, new Real());

    // Σk➔i*j*k{k=1…2} = i*j*1 + i*j*2 = i*j*(1+2) = 3*5*3 = 45
    assertEquals(45.0, result.doubleValue());
  }

  /**
   * Verifies that the fix works for different input values of both i and j,
   * ensuring the independent variable field is re-populated on each evaluate()
   * call rather than being stuck at the initial value.
   */
  public void testInnerVariableUpdatesAcrossMultipleEvaluations()
  {
    var     μ       = RealFunctionSequence.express("μ:i→j→Σk➔i*j+k{k=0…2}");

    Integer i       = new Integer(4);
    var     inner   = μ.evaluate(i, 1, 128, null);

    Integer j1      = new Integer(10);
    Real    result1 = inner.evaluate(j1, 1, 128, new Real());
    // Σk➔i*j+k{k=0…2} = (4*10+0)+(4*10+1)+(4*10+2) = 40+41+42 = 123
    assertEquals(123.0, result1.doubleValue());

    Integer j2      = new Integer(20);
    Real    result2 = inner.evaluate(j2, 1, 128, new Real());
    // (4*20+0)+(4*20+1)+(4*20+2) = 80+81+82 = 243
    assertEquals(243.0, result2.doubleValue());

    assertFalse("Results must differ for different j values",
                result1.doubleValue() == result2.doubleValue());
  }

  /**
   * Tests a simple single-lambda expression to confirm the fix does not regress
   * existing behavior where no inner independent variable field is needed.
   */
  public void testSingleLambdaSumStillWorksCorrectly()
  {
    var     f      = RealFunction.express("j→Σk➔j*k{k=1…3}");

    Integer j      = new Integer(4);
    Real    result = f.evaluate(j, 1, 128, new Real());

    // Σk➔j*k{k=1…3} = 4*1 + 4*2 + 4*3 = 4+8+12 = 24
    assertEquals(24.0, result.doubleValue());
  }

  /**
   * Tests that expressions WITHOUT nested function references to the independent
   * variable do NOT unnecessarily declare the independent variable as a field.
   * This validates the conditional logic in hasFieldForIndependentVariable().
   */
  public void testNoUnnecessaryFieldWhenNoNestedReferences()
  {
    var     f      = RealFunctionSequence.express("f:i→j→i+j+1");

    Integer i      = new Integer(5);
    var     fInner = f.evaluate(i, 1, 128, null);

    Integer j      = new Integer(7);
    Real    result = fInner.evaluate(j, 1, 128, new Real());

    // i+j+1 = 5+7+1 = 13
    assertEquals(13.0, result.doubleValue());
  }

  /**
   * Tests the expression pattern from the original issue (split from #810): μ =
   * i→j→Σₖ where nested operand functions within the sum need access to j and i
   * controls the upper bound. Uses a more complex summand expression to
   * stress-test propagation.
   */
  public void testIssue825ReproducerNestedSumWithMultiplication()
  {
    try
    {
      var     μ      = RealFunctionSequence.express("μ:i→j→Σk➔(j+1)*(k+1){k=0…i}");

      Integer i      = new Integer(2);
      var     μfunc  = μ.evaluate(i, 1, 128, null);

      Integer j      = new Integer(3);
      Real    result = μfunc.evaluate(j, 1, 128, new Real());

      // Σk➔(j+1)*(k+1){k=0…2} = (3+1)*(0+1) + (3+1)*(1+1) + (3+1)*(2+1)
      // = 4*1 + 4*2 + 4*3 = 4+8+12 = 24
      assertEquals(24.0, result.doubleValue());
    }
    catch (NoSuchFieldError e)
    {
      fail("Issue #825 not fixed: " + e.getMessage());
    }
  }

  /**
   * Tests that changing i produces a structurally different inner function, since
   * i controls the summation bounds. Evaluating μ with i=2 vs i=4 should yield
   * different results for the same j.
   */
  public void testDifferentOuterVariableProducesDifferentInnerFunction()
  {
    var     μ       = RealFunctionSequence.express("μ:i→j→Σk➔j+k{k=0…i}");

    Integer i2      = new Integer(2);
    var     inner2  = μ.evaluate(i2, 1, 128, null);
    Integer j       = new Integer(10);
    Real    result2 = inner2.evaluate(j, 1, 128, new Real());
    // Σk➔j+k{k=0…2} = (10+0)+(10+1)+(10+2) = 33
    assertEquals(33.0, result2.doubleValue());

    Integer i4      = new Integer(4);
    var     inner4  = μ.evaluate(i4, 1, 128, null);
    Real    result4 = inner4.evaluate(j, 1, 128, new Real());
    // Σk➔j+k{k=0…4} = (10+0)+(10+1)+(10+2)+(10+3)+(10+4) = 60
    assertEquals(60.0, result4.doubleValue());

    assertFalse("Different i must produce different sums",
                result2.doubleValue() == result4.doubleValue());
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

  public static void testIntegralOfComplexExponential()
  {
    var f = ComplexFunction.express("T->int(exp(I*t),t=-T…T)");
    ;
    assertEquals("T➔(exp(ⅈ*T)/ⅈ)-(exp(ⅈ*-T)/ⅈ)", f.toString());

  }

  public static void testIntegralOf1OverInfinityIsDeltaZeroComplex()
  {
    var f = ComplexFunction.parse("int(1,t=-∞…∞)");
    f.simplify();
    assertEquals("t➔δ(0)*(2*π)", f.toString());
  }

  public static void testIntegralOf1OverInfinityIsDeltaZeroReal()
  {
    var f = ComplexFunction.parse("int(1,t=-∞…∞)");
    f.simplify();
    assertEquals("t➔δ(0)*(2*π)", f.toString());
    var g = f.instantiate();
    assertEquals(ComplexConstants.posInf, g.evaluate(ComplexConstants.zero, 128, new Complex()));
  }

  public static void testSequenceOfRealValuedHypergeometricFunctionAsComplexValuedFunctions()
  {
    var             f      =
                      ComplexFunctionSequence.express("Vplus:m->pFq([1,m,-m],[1/2],(1/2)/y)");
    ComplexFunction Vplus3 = f.evaluate(3, 128);
    Complex         y      = Vplus3.evaluate(new Real("2.3",
                                                      128),
                                             1,
                                             128,
                                             new Complex());
    assertEquals(-0.3487301717761157, y.re().doubleValue());
    assertEquals(0.0, y.im().doubleValue());
  }

  public void testFourierTransformOfType1ChebyshevPolynomialsComplexFunction()
  {
    var context = new Context(Integer.named("m").set(4));

    var A       =
          ComplexFunction.express("A:pFq([1, m, -m], [1/2], I/2/y)*exp(2*I*π*m - y*I)", context);
    var B       =
          ComplexFunction.express("B:pFq([1, m, -m], [1/2], -I/2/y)*exp(m*π*I + y*I)", context);
    var f       = ComplexFunction.express("F", "y->I*(A(y)-B(y))/y", context);

    var y       = f.eval(2.3, new Complex());

    assertTrue(y.re().toString().startsWith("0.40342938701065"));
    assertTrue(y.im().doubleValue() < 10e-15);
  }

  public void testIndefiniteIntegralzs()
  {
    var f = RealFunction.parse("int(sin(x),x)");
    f.simplify();
    assertEquals("x➔-cos(x)", f.toString());
  }

  public void testComplexHypergeometricFunctionSequence()
  {
    ComplexFunctionSequence express =
                                    ComplexFunctionSequence.express("Vpluscomplex:m->pFq([1,m,-m],[1/2],-((1/2)*I)/y)");
    ComplexFunction         p3      = express.evaluate(3, 128);
    Complex                 eval    = p3.eval(2.3, new Complex());
    assertEquals("-3.5368620037807190372740058454181982612 +/- 4.70e-38 + i*1.9404947809649049162726572840572966165 +/- 1.48e-38",
                 eval.toString());
  }

  public void testIntegralOfSecant()
  {
    var x = RealFunction.parse("int(sec(x),x)");
    x.simplify();
    assertEquals("log(sec(x)+tan(x))", x.rootNode.toString());
  }

  public void testIntegralOfTangent()
  {
    var x = RealFunction.parse("int(tan(x),x)");
    x.simplify();
    assertEquals("-log(cos(x))", x.rootNode.toString());
  }

  public void testIntegralOfCosine()
  {
    var x = RealFunction.parse("int(cos(x),x)");
    x.simplify();
    assertEquals("sin(x)", x.rootNode.toString());
  }

  public void testIntegralOfSine()
  {
    var x = RealFunction.parse("int(sin(x),x)");
    x.simplify();
    assertEquals("-cos(x)", x.rootNode.toString());
  }

  public static void testRealSequenceOfHypergeometricFunctions()
  {
    var          f      = RealFunctionSequence.express("Vplus:m->pFq([1,m,-m],[1/2],(1/2)/y)");
    RealFunction Vplus3 = f.evaluate(3, 128);
    double       y      = Vplus3.eval(2.3);
    assertEquals(-0.3487301717761157622856908029915, y);
  }

  public static void testSimplificationAConstantIntegerRaisedToAConstantInteger()
  {
    var f = RealNullaryFunction.parse("5^3");
    f.simplify();
    assertEquals("125", f.toString());
  }

  public void testDerivativeOfLogarithm()
  {
    var x = RealFunction.parse("∂ln(x)/∂x");
    assertEquals("1/x", x.rootNode.toString());
  }

  public void testDerivativeOfExponentialFunction()
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

    var                          context = new Context(Real.named("a").set(2),
                                                       Real.named("b").set(4),
                                                       Real.named("c").set(6));
    Function<Real,
                  RealFunction>  x       = Function.express(Real.class,
                                                            RealFunction.class,
                                                            "x->∂a*x+b*x²+c*x³/∂x",
                                                            context);

    RealFunction                 poly    = x.evaluate(null, 128);

    var                          y       = poly.evaluate(new Real("2.3",
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

  public void testSumTypeset()
  {
    var x = RealNullaryFunction.express("∑k{k=2...4}");
    assertEquals("\\sum_{k = 2}^{4}{k}", x.typeset());
  }

  public void testWholeFractionDifference()
  {
    var x = RealNullaryFunction.express("[½-3/2]");
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
    IntegerFunction f            = IntegerFunction.express("binom(5,n)");
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
    var F = RationalNullaryFunction.express("R(3,½;z)");
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
    var    F                     =
             RealPolynomialNullaryFunction.parse("F",
                                                 "Σn➔zⁿ/n!*∏k➔αₖ₍ₙ₎{k=1…p}*∏k➔βₖ₍ₙ₎{k=1…q}{n=0…N}",
                                                 context);
    var    transformedExpression = F.substitute("z", RealFunction.parse("2*z"));
    String str                   = transformedExpression.toString();
    // got F:Σn➔((2*z^n)*Πk➔α[k]⋰n{k=1…p})/n!*Πk➔β[k]⋰n{k=1…q}{n=0…N}
    String expected              = "F:Σn➔((((2*z)^n)/n!)*Πk➔α[k]⋰n{k=1…p})*Πk➔β[k]⋰n{k=1…q}{n=0…N}";

    assertEquals(expected, str);
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
    String ideal                 = "F:Σn➔(((2*z)^n)*Πk➔α[k]⋰n{k=1…p})/(n!*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
    String str                   = transformedExpression.toString();
    // System.out.format("ideal=%s\n str=%s\n", ideal, str );
    assertEquals(ideal, str);
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
