package arb.expression;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.assertTrue;

import java.util.*;

import org.junit.Test;

public class ExpressionTest
{
  ExpressionParser expressionParser = new ExpressionParser();

  @Test
  public void testConst()
  {
    assertThat(new Constant(42).evaluate(), is(42f));
  }

  @Test
  public void testVar()
  {
    Variable v = new Variable(42);
    assertThat(v.evaluate(), is(42f));
    v.set(123);
    assertThat(v.evaluate(), is(123f));
  }

  @Test
  public void testFunc()
  {
    Function<Float>          f      = new Function<Float>()
                                    {
                                      public float evaluate(FunctionalContext<Float> c)
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
    Expression               two    = new Constant(2);
    Variable                 x      = new Variable(0);
    FunctionalContext<Float> sum    = new FunctionalContext<Float>(f,
                                                                   Arrays.asList(two),
                                                                   null);
    FunctionalContext<Float> sumVar = new FunctionalContext<Float>(f,
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
    assertThat(new UnaryExpression(Operators.UNARY_MINUS,
                                   new Constant(5)).evaluate(),
               is(-5f));
    assertThat(new UnaryExpression(Operators.UNARY_BITWISE_NOT,
                                   new Constant(9)).evaluate(),
               is(-10f));
    assertThat(new UnaryExpression(Operators.UNARY_LOGICAL_NOT,
                                   new Constant(9)).evaluate(),
               is(0f));
    assertThat(new UnaryExpression(Operators.UNARY_LOGICAL_NOT,
                                   new Constant(0)).evaluate(),
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
      List<String> tokens = expressionParser.split(test[0]);
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
    ExpressionParser.OPS.remove("&");
    boolean caught = false;
    try
    {
      expressionParser.split("1&&&");
    }
    catch (AssertionError ae)
    {
      caught = true;
    }
    assertTrue(caught);
    ExpressionParser.OPS.put("&", Operators.BITWISE_AND);
  }

  @Test
  public void testNumberExpr()
  {
    assertThat(expressionParser.parse("", null, null).evaluate(), is(0f));
    assertThat(expressionParser.parse("2", null, null).evaluate(), is(2.0f));
    assertThat(expressionParser.parse("(2)", null, null).evaluate(), is(2.0f));
    assertThat(expressionParser.parse("((2))", null, null).evaluate(), is(2.0f));
    assertThat(expressionParser.parse("2.3", null, null).evaluate(), is(2.3f));
  }

  @Test
  public void testVarExpr()
  {
    Map<String, Variable> variables = new HashMap<String, Variable>();
    assertThat(expressionParser.parse("x", variables, null).evaluate(), is(0f));
    variables.get("x").set(42);
    assertThat(expressionParser.parse("x", variables, null).evaluate(), is(42f));
    assertThat(expressionParser.parse("(x)", variables, null).evaluate(), is(42f));
  }

  @Test
  public void testUnaryExpr()
  {
    assertThat(expressionParser.parse("-2", null, null).evaluate(), is(-2f));
    assertThat(expressionParser.parse("!2", null, null).evaluate(), is(0f));
    assertThat(expressionParser.parse("^2", null, null).evaluate(), is(-3f));
  }

  @Test
  public void testBinaryExpr()
  {
    assertThat(expressionParser.parse("3+2", null, null).evaluate(), is(5f));
    assertThat(expressionParser.parse("3/2", null, null).evaluate(), is(1.5f));
    assertThat(expressionParser.parse("(3/2)|0", null, null).evaluate(), is(1f));
    assertThat(expressionParser.parse("2+3/2", null, null).evaluate(), is(3.5f));
    assertThat(expressionParser.parse("4/2+8*4/2", null, null).evaluate(), is(18f));
    assertThat(expressionParser.parse("w=(w!=0)", null, null).evaluate(), is(0f));

    Map<String, Variable> variables = new HashMap<String, Variable>();
    variables.put("x", new Variable(5));
    assertThat(expressionParser.parse("2*x", variables, null).evaluate(), is(10f));
    assertThat(expressionParser.parse("2/x", variables, null).evaluate(), is(2f / 5f));
  }

  @Test
  public void testCommaExpr()
  {
    assertThat(expressionParser.parse("2, 3, 5", null, null).evaluate(), is(5f));
    assertThat(expressionParser.parse("2+3, 5*3", null, null).evaluate(), is(15f));
  }

  @Test
  public void testAssignExpr()
  {
    Map<String, Variable> variables = new HashMap<String, Variable>();
    variables.put("x", new Variable(5));
    assertThat(expressionParser.parse("z=10", variables, null).evaluate(), is(10f));
    assertThat(expressionParser.parse("y=10,x+y", variables, null).evaluate(), is(15f));
  }

  @Test
  public void testFuncExpr()
  {
    Map<String, Function> functions = new HashMap<String, Function>();
    functions.put("add3", new Function<Void>()
    {
      public float evaluate(FunctionalContext<Void> c)
      {
        return c.args.get(0).evaluate() + c.args.get(1).evaluate() + c.args.get(2).evaluate();
      }
    });
    functions.put("nop", new Function()
    {
      public float evaluate(FunctionalContext c)
      {
        return 0;
      }
    });
    assertThat(expressionParser.parse("2+add3(3, 7, 9)", null, functions).evaluate(), is(21f));
    assertThat(expressionParser.parse("2+add3(3, add3(1, 2, 3), 9)", null, functions).evaluate(), is(20f));
    assertThat(expressionParser.parse("nop()", null, functions).evaluate(), is(0f));
    assertThat(expressionParser.parse("nop(1)", null, functions).evaluate(), is(0f));
    assertThat(expressionParser.parse("nop((1))", null, functions).evaluate(), is(0f));
  }
}
