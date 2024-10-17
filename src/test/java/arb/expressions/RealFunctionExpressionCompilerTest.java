package arb.expressions;

import static arb.RealConstants.one;
import static arb.RealConstants.zero;
import static arb.functions.real.RealFunction.express;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RoundingMode;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealFunctionExpressionCompilerTest extends
                                                TestCase
{

  Context      context   = new Context();

  Variables    variables = context.variables;

  private Real v;
  private Real v3;

  public static void testExpansion()
  {
    Expression.trace = true;
    RealFunction f    =
                   RealFunction.express("∑j➔1/2*J(k,x)*π^(1/2)*(8*j+2)^(1/2)*(-1)^j*Γ(1/2*k+j+1/2)/Γ(-j+1/2*k+1/2)/Γ(j+1-1/2*k)/Γ(1/2*k+j+1){j = -10 … 10}");
    double       eval = f.eval(2.3);
    System.out.println("f(2.3)=" + eval);

  }

  public static void testSphericalBesselFunctionViaRealNullaryFunction()
  {

    Context context = new Context(Integer.named("n").set(3),
                                  Fraction.named("x").set(230, 100));

    var     f       = RealNullaryFunction.express("√((8*n+2)/π)*(-1)ⁿ*j(2*n,x)", context);
    Real    y       = f.evaluate(128);
    // System.out.format("testRealNullaryFunction: %s=%s\nwith %s\n", f, y,
    // context.variables);
    assertEquals(-0.00263703359102133642443445488859, y.doubleValue());
  }

  @Override
  protected void setUp() throws Exception
  {
    Real vars = Real.newAlignedVector(6);

    variables.put("b", one);

    variables.put("a", one);

    variables.put("λ", one);

    v = Real.newVector(5);
    variables.put("v", v);
    v.get(0).set("1.0", 128);
    v.get(1).set("2.0", 128);
    v3 = v.get(2).set("8081.2024", 128);
    v.get(3).set("4.0", 128);
    v.get(4).set("5.0", 128);

    variables.put("x", vars.get(0).set(1e6));

    variables.put("y", vars.get(1).set(2));

    variables.put("z", vars.get(2).set(-1));

    variables.put("r", vars.get(3).set("1.67", 128));

    variables.put("α", vars.get(4).set("0.6", 128));

    variables.put("n", vars.get(5).set("20", 128));

    vars.lock();
  }

  public void testAddThreeConstants()
  {

    RealFunction expression = express("69 + 0.42 + 0.58", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(70.00, func.doubleValue(RoundingMode.Up));

    }
  }

  public void testVariableIndexedByAConstant()
  {
    RealFunction expression = express("v[3]", context);

    Real         value      = expression.evaluate(one, 1, 256, new Real());
    assertEquals(v3, value);

  }

  public void testAddTwoConstants()
  {

    RealFunction expression = express("69 + 0.42", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(69.42, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testBesselFunction()
  {
    RealFunction expression = express("J₀(t)");
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.7651976865579666, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testNegativeInput()
  {
    RealFunction expression = express("-t");
    {
      assertEquals(-1.0, expression.eval(1.0));
    }
  }

  public void testConstant()
  {
    RealFunction expression = express("69.42", context);
    {
      assertEquals(69.42, expression.eval(1.0));
    }
  }

  public void testHalf()
  {

    RealFunction expression = express("½*10", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(5.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testDivideConstants()
  {

    RealFunction expression = express("42 ÷ 6", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(7.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testFunctionInvolvingABesselFunction()
  {
//    Context      context    = new Context(new Real("0.0",128).setName("a"),
//                                          new Real("1.0",128).setName("b"),
//                                          new Real("1.0",128).setName("λ"));
    RealFunction expression = express("a-b*J0(λ*t)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.23480231344203345, evaluatedX.doubleValue());
    }
  }

  public void testFunctionOfAConstant()
  {

    RealFunction expression = express("tanh(2)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testFunctionOfAConstantPlusAConstant()
  {

    RealFunction expression = express("tanh(1+1)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testFunctionOfInputPlusAConstant()
  {

    RealFunction expression = express("tanh(t+1)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));

      Real negOne = one.neg(new Real());
      {
        evaluatedX = expression.evaluate(negOne, 1, 256, new Real());
        assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
      }
    }

  }

  public void testFunctionOfVariablePlusAConstant()
  {
    RealFunction express = express("tanh(y+1)", context);
    assertEquals(0.9950547536867305, express.eval(1.0));
  }

  public void testFunctionOfVariablePlusAVariable()
  {
    RealFunction expression = express("tanh(y+z)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.7615941559557649, evaluatedX.doubleValue());

    }

  }

  public void testHyperbolicTangentOfAVariable()
  {
    RealFunction expression = express("tanh(y)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());

      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testIdentityInput()
  {
    RealFunction identity = express("t", context, true);
    Real         won      = identity.evaluate(one, 1, 256, new Real());
    {
      assertEquals(1.0, won.doubleValue());
    }
  }

  public void testInputRaisedToThe5thPowerWithBetterLookingUnicodeSymbols()
  {
    Real         three      = new Real(3.0);
    Real         two        = new Real(2.0);
    RealFunction expression = express("y⁵");
    {
      Real result     = new Real();

      Real evaluatedX = expression.evaluate(two, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(32.0, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(three, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(243.0, evaluatedX.doubleValue());
    }
  }

  public void testInputSquared()
  {
    RealFunction expression = express("y^2");
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(new Real(2.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(4.0, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(new Real(3.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(9.0, evaluatedX.doubleValue());
    }
  }

  public void testInputSquaredPlusOne()
  {
    RealFunction expression = express("y^2+1");
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(new Real(2.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(5.0, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(new Real(3.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(10.0, evaluatedX.doubleValue());

    }
  }

  public void testInputSquaredWithBetterLookingUnicodeSymbols()
  {
    RealFunction expression = express("y²");
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(new Real(2.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(4.0, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(new Real(3.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(9.0, evaluatedX.doubleValue());
    }
  }

  public void testLogOnePlusInputSquared()
  {
    RealFunction expression = express("ln(t^2+1)", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6931471805599453, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6931471805599453, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(new Real("0.5",
                                                128),
                                       1,
                                       256,
                                       result);
      assert result == evaluatedX;
      assertEquals(0.22314355131420976, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testMultiplyConstants()
  {
    RealFunction expression = express("6 × 7", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(42.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testOnePlusInputSquared()
  {

    RealFunction expression = express("1+t^2", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(2.0, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(new Real("2",
                                                128),
                                       1,
                                       256,
                                       result);
      assert result == evaluatedX;
      assertEquals(5.0, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(new Real("0.5",
                                                128),
                                       1,
                                       256,
                                       result);
      assert result == evaluatedX;
      assertEquals(1.25, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testOnePlusInputOver2PlusZero()
  {
    RealFunction expression = express("1+i/2+0", context);
    Real         x          = new Real("2",
                                       128);
    {

      Real evaluatedX = expression.evaluate(x, 1, 256, x);

      assertEquals(2.0, evaluatedX.doubleValue());

      expression.evaluate(x.set("4", 128), 1, 256, evaluatedX);

      assertEquals(3.0, evaluatedX.doubleValue());
    }

  }

  public void testRaiseConstantToAConstantPower()
  {

    RealFunction expression = express(" 5   ^  2  ", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(25.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testPi()
  {
    RealFunction expression = express("π");
    try ( Real pi = expression.evaluate(RealConstants.zero, 128, new Real()))
    {
      assertEquals(RealConstants.π, pi);
    }
  }

  public void testSFunction()
  {
    RealFunction expression = express("tanh(ln(1+t^2))", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6, evaluatedX.doubleValue());

      evaluatedX = expression.evaluate(RealConstants.zero, 1, 256, result);
      assert result == evaluatedX;
      // assertTrue( result.isZero() );
      assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testSFunctionWithGreekInputSplitIntoTwoFunctions()
  {
    Context context = new Context();
    express("yay", "1+ρ^2", context);
    RealFunction expression = express("x->tanh(ln(yay(x)))", context);

    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6, evaluatedX.doubleValue());
    }
  }

  public void testSFunctionWithGreekInput()
  {
    RealFunction expression = express("tanh(ln(1+ρ^2))", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6, evaluatedX.doubleValue());
    }
  }

  public void testSFunctionWithVar()
  {
    RealFunction expression = express("tanh(ln(1+y^2))", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.9230769230769231, evaluatedX.doubleValue());
    }
  }

  public void testOnePlusTwoPlusThree()
  {
    RealFunction expression = express("1+(2)+(3)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());

      assertEquals(6.0, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testSquareRootOfTwentyFive()
  {
    RealFunction expression = express("√(25)", context);
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(5.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testSubtractConstants()
  {
    RealFunction expression = express("70 - 0.58", context);
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(69.42, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testTanhLogOne()
  {
    /**
     * This should be allocating a new intermediate variable
     */
    RealFunction expression = express("tanh(ln(1))", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;

      assertTrue(result.isZero());
      assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testVariable()
  {
    RealFunction expression = express("x", context);
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(1000000.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testcontextquared()
  {
    RealFunction expression = express("y^2", context);
    {
      Real func = expression.evaluate(one, 1, 128, new Real());
      assertEquals(4.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testVariableToThePowerOfOneMinusAVariable()
  {
    RealFunction expression = express("r^(1-α)", context);
    Real         won        = expression.evaluate(zero, 1, 128, new Real());
    {
      assertEquals(1.2276839790698644, won.doubleValue());
    }

  }

}
