package arb.expressions;

import static arb.RealConstants.*;
import static arb.expressions.Expression.express;

import arb.*;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExpressionTest extends
                            TestCase
{
  Variables<Real> variables = new Variables<>();

  @Override
  protected void setUp() throws Exception
  {
    Real vars = Real.newAlignedVector(6);

    variables.put("b", one);

    variables.put("a", one);

    variables.put("λ", one);

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

    try ( RealFunction expression = express("69 + 0.42 + 0.58", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(70.00, func.doubleValue(RoundingMode.Up));

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

  public void testBesselFunction()
  {
    try ( RealFunction expression = express("J₀(t)"))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.7651976865579666, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testConstant()
  {
    try ( RealFunction expression = express("69.42", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(69.42, func.doubleValue(RoundingMode.Up));
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

  public void testFunctionInvolvingABesselFunction()
  {
    try ( RealFunction expression = express("a-b*J₀(λ*t)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.23480231344203342, evaluatedX.doubleValue());
    }
  }

  public void testFunctionOfAConstant()
  {

    try ( RealFunction expression = express("tanh(2)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testFunctionOfAConstantPlusAConstant()
  {

    try ( RealFunction expression = express("tanh(1+1)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testFunctionOfInputPlusAConstant()
  {

    try ( RealFunction expression = express("tanh(t+1)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));

      try ( Real negOne = one.neg(new Real()))
      {
        evaluatedX = expression.evaluate(negOne, 1, 256, new Real());
        assertEquals(0.0, evaluatedX.doubleValue(RoundingMode.Up));
      }
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

  public void testFunctionOfVariablePlusAVariable()
  {
    try ( RealFunction expression = express("tanh(y+z)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(0.7615941559557649, evaluatedX.doubleValue());

    }

  }

  public void testHyperbolicTangentOfAVariable()
  {
    try ( RealFunction expression = express("tanh(y)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());

      assertEquals(0.9640275800758169, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testIdentityInput()
  {
    try ( RealFunction identity = express("t", variables); Real won = identity.evaluate(one, 1, 256, new Real()))
    {
      assertEquals(1.0, won.doubleValue());
    }
  }

  public void testInputRaisedToThe5thPowerWithBetterLookingUnicodeSymbols()
  {
    try ( Real three = new Real(3.0); Real two = new Real(2.0); RealFunction expression = express("y⁵", null))
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
    try ( RealFunction expression = express("y^2", null))
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
    try ( RealFunction expression = express("y^2+1", null))
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
    try ( RealFunction expression = express("y²", null))
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
    try ( RealFunction expression = express("ln(t^2+1)", variables))
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
    try ( RealFunction expression = express("6 × 7", variables))
    {
      Real func = expression.evaluate(one, 1, 256, new Real());
      assertEquals(42.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testOnePlusInputSquared()
  {

    try ( RealFunction expression = express("1+t^2", variables))
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
    try ( RealFunction expression = express("1+i/2+0", variables); Real x = new Real("2",
                                                                             128);)
    {

      Real evaluatedX = expression.evaluate(x, 1, 256, x);

      assertEquals(2.0, evaluatedX.doubleValue());

      expression.evaluate(x.set("4", 128), 1, 256, evaluatedX);

      assertEquals(3.0, evaluatedX.doubleValue());
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

  public void testSFunction()
  {
    try ( RealFunction expression = express("tanh(ln(1+t^2))", variables))
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

  public void testSFunctionWithGreekInput()
  {
    try ( RealFunction expression = express("tanh(ln(1+ρ^2))", variables))
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.6, evaluatedX.doubleValue());
    }
  }

  public void testSFunctionWithVar()
  {
    try ( RealFunction expression = express("tanh(ln(1+y^2))", variables))
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(0.923076923076923, evaluatedX.doubleValue());
    }
  }

  public void testSimplerCompoundExpression()
  {
    try ( RealFunction expression = express("SimplerCompoundExpression", "1+(2)+(3)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());

      assertEquals(6.0, evaluatedX.doubleValue(RoundingMode.Up));
    }

  }

  public void testSquareRootOfTwentyFive()
  {
    try ( RealFunction expression = express("√(25)", variables))
    {
      Real evaluatedX = expression.evaluate(one, 1, 256, new Real());
      assertEquals(5.0, evaluatedX.doubleValue(RoundingMode.Up));
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

  public void testTanhLogOne()
  {
    try ( RealFunction expression = express("tanh(ln(1))", variables))
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
    try ( RealFunction expression = express("x", variables))
    {
      Real result     = new Real();
      Real evaluatedX = expression.evaluate(one, 1, 256, result);
      assert result == evaluatedX;
      assertEquals(1000000.0, evaluatedX.doubleValue(RoundingMode.Up));
    }
  }

  public void testVariableSquared()
  {
    try ( RealFunction expression = express("y^2", variables))
    {
      Real func = expression.evaluate(one, 1, 128, new Real());
      assertEquals(4.0, func.doubleValue(RoundingMode.Up));
    }
  }

  public void testVariableToThePowerOfOneMinusAVariable()
  {
    try ( RealFunction expression = express("r^(1-α)", variables);
          Real won = expression.evaluate(zero, 1, 128, new Real()))
    {
      assertEquals(1.2276839790698644, won.doubleValue());
    }
  }

  public void testLiftedC()
  {
    try ( RealFunction expression = express("YabaDabaDo",
                                   "((r^(1-α)-1)*r^((α-1)*(1+n/2)))/(Γ(α)*Γ(2-α))*r^((1-α)*i)",
                                   variables,
                                   true);
          Real c0 = expression.evaluate(zero, 1, 128, new Real()))
    {
      assertEquals(0.018045813351600336, c0.doubleValue());
    }
  }
}
