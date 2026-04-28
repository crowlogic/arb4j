package arb.expressions;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import arb.Real;
import arb.functions.Function;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;
import arb.utensils.Utensils;

public class TypeStringTest
{
  @Test
  public void testLeafTypeString()
  {
    var expr = Function.parse(Real.class, Real.class, RealFunction.class, "x➔x^2");
    String ts = expr.typeString();
    assertEquals("RealFunction:x=Real➔Real", ts);
  }

  @Test
  public void testNestedFunctionalTypeString()
  {
    Expression<Real, RealFunction, RealFunctional> expr =
        Function.parse(Real.class, RealFunction.class, RealFunctional.class, "t➔x➔t+3*x+x^2");


    String ts = expr.typeString();
    assertEquals("RealFunctional:t=Real➔(RealFunction:x=Real➔Real)", ts);
  }
}
