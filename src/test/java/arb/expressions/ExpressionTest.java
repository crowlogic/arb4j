package arb.expressions;

import static arb.RealConstants.*;
import static arb.expressions.Expression.express;

import arb.*;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExpressionTest extends
                            TestCase
{
  @Override
  protected void setUp() throws Exception
  {
    Real vars = Real.newAlignedVector(3);

    variables.put("b", one);

    variables.put("a", one);

    variables.put("λ", one);

    variables.put("x", vars.get(0).set(1000000));

    variables.put("y", vars.get(1).set(2));

    variables.put("z", vars.get(2).set(-1));

    variables.put("r", vars.get(3).set("1.67", 128));

    variables.put("α", vars.get(4).set("0.6", 128));

    vars.lock();
  }

  Variables<Real> variables = new Variables<>();

  public void testOnePlusNOver2()
  {
    try ( RealFunction cf = Expression.express("1+n/2+0", variables); Real x = new Real("2",
                                                                                        128);)
    {

      Real evaluatedX = cf.evaluate(x, 1, 256, x);

      assertEquals(2.0, evaluatedX.doubleValue());

      cf.evaluate(x.set("4", 128), 1, 256, evaluatedX);

      assertEquals(3.0, evaluatedX.doubleValue());
    }

  }

  public void testSimplerCompoundExpression()
  {
    // its the parenthesis that throws it
    try ( RealFunction cf = express("SimplerCompoundExpression", "1+(2)+(3)", variables, true))
    {
      Real evaluatedX = cf.evaluate(one, 1, 256, new Real());

      assertEquals(6.0, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testHyperbolicTangentOfAVariable()
  {

    try ( RealFunction express = express("tanh(y)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());

      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testBesselFunction()
  {
    try ( RealFunction express = express("J₀(t)"))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.7651976865579666, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testFunctionInvolvingABesselFunction()
  {
    try ( RealFunction express = express("a-b*J₀(λ*t)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.23480231344203342, evaluatedX.doubleValue());
    }
  }

  public void testSquareRootOfTwentyFive()
  {

    try ( RealFunction express = express("√(25)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(5.0, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testFunctionOfInputPlusAConstant()
  {

    try ( RealFunction express = express("tanh(t+1)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));

      try ( Real negOne = one.neg(new Real()))
      {
        evaluatedX = express.evaluate(negOne, 1, 256, new Real());
        assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
      }
    }

  }

  public void testFunctionOfVariablePlusAVariable()
  {

    try ( RealFunction express = express("tanh(y+z)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.7615941559557649, evaluatedX.doubleValue());

    }

  }

  public void testFunctionOfVariablePlusAConstant()
  {

    try ( RealFunction express = express("tanh(y+1)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.9950547536867305, evaluatedX.doubleValue(RoundingMode.Up));

    }

  }

  public void testFunctionOfAConstantPlusAConstant()
  {

    try ( RealFunction express = express("tanh(1+1)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testFunctionOfAConstant()
  {

    try ( RealFunction express = express("tanh(2)", variables))
    {
      Real evaluatedX = express.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testInputSquaredWithBetterLookingUnicodeSymbols()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( RealFunction express = express("y²", null))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(new Real(2.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(4.0, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(new Real(3.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(9.0, evaluatedX.doubleValue());

    }
  }

  public void testInputRaisedToThe5thPowerWithBetterLookingUnicodeSymbols()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( Real three = new Real(3.0); Real two = new Real(2.0); RealFunction express = express("y⁵", null))
    {
      Real result     = new Real();

      Real evaluatedX = express.evaluate(two, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(32.0, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(three, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(243.0, evaluatedX.doubleValue());

    }
  }

  public void testInputSquared()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( RealFunction express = express("y^2", null))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(new Real(2.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(4.0, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(new Real(3.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(9.0, evaluatedX.doubleValue());

    }
  }

  public void testInputSquaredPlusOne()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( RealFunction express = express("y^2+1", null))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(new Real(2.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(5.0, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(new Real(3.0), 1, 256, result);
      assert result == evaluatedX;
      assertEquals(10.0, evaluatedX.doubleValue());

    }
  }

  public void testSFunctionWithGreekInput()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( RealFunction express = express("tanh(ln(1+ρ^2))", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6, evaluatedX.doubleValue());
    }
  }

  public void testSFunctionWithVar()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( RealFunction express = express("tanh(ln(1+y^2))", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.923076923076923, evaluatedX.doubleValue());

    }
  }

  public void testLogOnePlusInputSquared()
  {

    try ( RealFunction express = express("ln(t^2+1)", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6931471805599453, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6931471805599453, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(new Real("0.5",
                                             128),
                                    1,
                                    256,
                                    result);
      assert result == evaluatedX;
      assertEquals(0.22314355131420976, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testOnePlusInputSquared()
  {

    try ( RealFunction express = express("1+t^2", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(2.0, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(new Real("2",
                                             128),
                                    1,
                                    256,
                                    result);
      assert result == evaluatedX;
      assertEquals(5.0, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(new Real("0.5",
                                             128),
                                    1,
                                    256,
                                    result);
      assert result == evaluatedX;
      assertEquals(1.25, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testSFunction()
  {

    /**
     * The fact that testFunctionOfAConstant works indicates the problem is in the
     * input Variable handling
     */
    try ( RealFunction express = express("tanh(ln(1+t^2))", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6, evaluatedX.doubleValue());

      evaluatedX = express.evaluate(RealConstants.zero, 1, 256, result);
      assert result == evaluatedX;
      // assertTrue( result.isZero() );
      assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testTanhLogOne()
  {

    try ( RealFunction express = express("tanh(ln(1))", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;

      assertTrue(result.isZero());
      assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  //

  public void testVariableToThePowerOfOneMinusAVariable()
  {
    try ( RealFunction identity = express("r^(1-α)", variables);
          Real won = identity.evaluate(zero, 1, 128, new Real()))
    {
      assertEquals(1.2276839790698644, won.doubleValue());
    }
  }

  public void testIdentityInput()
  {
    try ( RealFunction identity = express("t", variables); Real won = identity.evaluate(one, 1, 256, new Real()))
    {
      assertEquals(1.0, won.doubleValue());
    }
  }

  public void testVariable()
  {

    try ( RealFunction express = express("x", variables))
    {
      Real result     = new Real();
      Real evaluatedX = express.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(1000000.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testSubtractConstants()
  {

    try ( RealFunction expression = express("70 - 0.58", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(69.42, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testRaiseConstantToAConstantPower()
  {

    try ( RealFunction expression = express("  5   ^  2  ", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(25.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testDivideConstants()
  {

    try ( RealFunction expression = express("42 ÷ 6", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(7.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testMultiplyConstants()
  {
    try ( RealFunction expression = express("6 * 7", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(42.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testAddTwoConstants()
  {

    try ( RealFunction expression = express("69 + 0.42", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(69.42, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testAddThreeConstants()
  {

    try ( RealFunction expression = express("69 + 0.42 + 0.58", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(70.00, func.doubleValue(RoundingMode.Up));

    }
  }

  public void testConstant()
  {
    try ( RealFunction express = express("69.42", variables))
    {
      Real func = express.evaluate(one, 1, 256, new Real());
      assertEquals(69.42, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testVariableSquared()
  {
    try ( RealFunction express = express("y^2", variables))
    {
      Real func = express.evaluate(one, 1, 128, new Real());
      assertEquals(4.0, func.doubleValue(RoundingMode.Up));
    }
  }

}
