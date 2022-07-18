package arb.expression;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

import java.util.*;

import org.junit.Test;

public class ExpressionTest
{
  Builder builder = new Builder();

  @Test
  public void testConst()
  {
    assertThat(new ConstantExpression(42).evaluate(), is(42f));
  }

  @Test
  public void testVar()
  {
    VariableExpression v = new VariableExpression(42);
    assertThat(v.evaluate(), is(42f));
    v.set(123);
    assertThat(v.evaluate(), is(123f));
  }

  @Test
  public void testFunc()
  {
    Function<Float>        f      = new Function<Float>()
                                  {
                                    public float evaluate(FunctionalExpressionContext<Float> c)
                                    {
                                      if (c.env == null)
                                      {
                                        c.env = 0f;
                                      }
                                      float acc = (Float) c.env;
                                      acc   = acc + c.args.get(0).evaluate();
                                      c.env = acc;
                                      return acc;
                                    }
                                  };
    Expression       two    = new ConstantExpression(2);
    VariableExpression   x      = new VariableExpression(0);
    FunctionalExpressionContext<Float> sum    = new FunctionalExpressionContext<Float>(f,
                                                               Arrays.asList(two),
                                                               null);
    FunctionalExpressionContext<Float> sumVar = new FunctionalExpressionContext<Float>(f,
                                                               Arrays.asList((Expression) x),
                                                               null);

    assertThat(sum.evaluate(), is(2f));
    assertThat(sum.evaluate(), is(4f));
    assertThat(sumVar.evaluate(), is(0f));
    x.set(2);
    assertThat(sumVar.evaluate(), is(2f));
    x.set(5);
    assertThat(sumVar.evaluate(), is(7f));
    x.set(8);
    assertThat(sumVar.evaluate(), is(15f));
  }

  @Test
  public void testUnary()
  {
    assertThat(new UnaryExpression(Operation.UNARY_MINUS,
                                          new ConstantExpression(5)).evaluate(),
               is(-5f));
    assertThat(new UnaryExpression(Operation.UNARY_BITWISE_NOT,
                                          new ConstantExpression(9)).evaluate(),
               is(-10f));
    assertThat(new UnaryExpression(Operation.UNARY_LOGICAL_NOT,
                                          new ConstantExpression(9)).evaluate(),
               is(0f));
    assertThat(new UnaryExpression(Operation.UNARY_LOGICAL_NOT,
                                          new ConstantExpression(0)).evaluate(),
               is(1f));
  }

  @Test
  public void testBinary()
  {
    // TODO
  }

  @Test
  public void testTokenize()
  {
    String[][] TESTS =
    {
      { "2", "2" },
      { "2+3/234.0", "2", "+", "3", "/", "234.0" },
      { "2+-3", "2", "+", "-u", "3" },
      { "2--3", "2", "-", "-u", "3" },
      { "-(-2)", "-u", "(", "-u", "2", ")" },
      { "---2", "-u", "-u", "-u", "2" },
      { "foo", "foo" },
      { "1>2", "1", ">", "2" },
      { "1>-2", "1", ">", "-u", "2" },
      { "1>>2", "1", ">>", "2" },
      { "1>>-2", "1", ">>", "-u", "2" },
      { "1>>!2", "1", ">>", "!u", "2" },
      { "1>>^!2", "1", ">>", "^u", "!u", "2" },
      { "1&&2", "1", "&&", "2" },
      { "1&&", "1", "&&" }, };

    for (String[] test : TESTS)
    {
      List<String> tokens = builder.tokenize(test[0]);
      assertThat(tokens.size(), is(test.length - 1));
      for (int i = 1; i < test.length; i++)
      {
        assertThat(tokens.get(i - 1), is(test[i]));
      }
    }
  }

  @Test
  public void testNoSuchOperator()
  {
    Builder.OPS.remove("&");
    assertThat(builder.tokenize("1&&&") == null, is(true));
    Builder.OPS.put("&", Operation.BITWISE_AND);
  }

  @Test
  public void testNumberExpr()
  {
    assertThat(builder.parse("", null, null).evaluate(), is(0f));
    assertThat(builder.parse("2", null, null).evaluate(), is(2.0f));
    assertThat(builder.parse("(2)", null, null).evaluate(), is(2.0f));
    assertThat(builder.parse("((2))", null, null).evaluate(), is(2.0f));
    assertThat(builder.parse("2.3", null, null).evaluate(), is(2.3f));
  }

  @Test
  public void testVarExpr()
  {
    Map<String, VariableExpression> variableExpressions = new HashMap<String, VariableExpression>();
    assertThat(builder.parse("x", variableExpressions, null).evaluate(), is(0f));
    variableExpressions.get("x").set(42);
    assertThat(builder.parse("x", variableExpressions, null).evaluate(), is(42f));
    assertThat(builder.parse("(x)", variableExpressions, null).evaluate(), is(42f));
  }

  @Test
  public void testUnaryExpr()
  {
    assertThat(builder.parse("-2", null, null).evaluate(), is(-2f));
    assertThat(builder.parse("!2", null, null).evaluate(), is(0f));
    assertThat(builder.parse("^2", null, null).evaluate(), is(-3f));
  }

  @Test
  public void testBinaryExpr()
  {
    assertThat(builder.parse("3+2", null, null).evaluate(), is(5f));
    assertThat(builder.parse("3/2", null, null).evaluate(), is(1.5f));
    assertThat(builder.parse("(3/2)|0", null, null).evaluate(), is(1f));
    assertThat(builder.parse("2+3/2", null, null).evaluate(), is(3.5f));
    assertThat(builder.parse("4/2+8*4/2", null, null).evaluate(), is(18f));
    assertThat(builder.parse("w=(w!=0)", null, null).evaluate(), is(0f));

    Map<String, VariableExpression> variableExpressions = new HashMap<String, VariableExpression>();
    variableExpressions.put("x", new VariableExpression(5));
    assertThat(builder.parse("2*x", variableExpressions, null).evaluate(), is(10f));
    assertThat(builder.parse("2/x", variableExpressions, null).evaluate(), is(2f / 5f));
  }

  @Test
  public void testCommaExpr()
  {
    assertThat(builder.parse("2, 3, 5", null, null).evaluate(), is(5f));
    assertThat(builder.parse("2+3, 5*3", null, null).evaluate(), is(15f));
  }

  @Test
  public void testAssignExpr()
  {
    Map<String, VariableExpression> variableExpressions = new HashMap<String, VariableExpression>();
    variableExpressions.put("x", new VariableExpression(5));
    assertThat(builder.parse("z=10", variableExpressions, null).evaluate(), is(10f));
    assertThat(builder.parse("y=10,x+y", variableExpressions, null).evaluate(), is(15f));
  }

  @Test
  public void testFuncExpr()
  {
    Map<String, Function> functions = new HashMap<String, Function>();
    functions.put("add3", new Function<Void>()
    {
      public float evaluate(FunctionalExpressionContext<Void> c)
      {
        return c.args.get(0).evaluate() + c.args.get(1).evaluate() + c.args.get(2).evaluate();
      }
    });
    functions.put("nop", new Function()
    {
      public float evaluate(FunctionalExpressionContext c)
      {
        return 0;
      }
    });
    assertThat(builder.parse("2+add3(3, 7, 9)", null, functions).evaluate(), is(21f));
    assertThat(builder.parse("2+add3(3, add3(1, 2, 3), 9)", null, functions).evaluate(), is(20f));
    assertThat(builder.parse("nop()", null, functions).evaluate(), is(0f));
    assertThat(builder.parse("nop(1)", null, functions).evaluate(), is(0f));
    assertThat(builder.parse("nop((1))", null, functions).evaluate(), is(0f));
  }
}
