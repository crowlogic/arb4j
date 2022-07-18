package naivesound.expr;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;

import java.util.*;

import org.junit.Test;

public class ExprTest
{
  Expr.Builder builder = new Expr.Builder();

  @Test
  public void testConst()
  {
    assertThat(new Expr.Const(42).eval(), is(42f));
  }

  @Test
  public void testVar()
  {
    Expr.Var v = new Expr.Var(42);
    assertThat(v.eval(), is(42f));
    v.set(123);
    assertThat(v.eval(), is(123f));
  }

  @Test
  public void testFunc()
  {
    Expr.Func<Float>        f      = new Expr.Func<Float>()
                                   {
                                     public float eval(Expr.FuncContext<Float> c)
                                     {
                                       if (c.env == null)
                                       {
                                         c.env = 0f;
                                       }
                                       float acc = (Float) c.env;
                                       acc   = acc + c.args.get(0).eval();
                                       c.env = acc;
                                       return acc;
                                     }
                                   };
    Expr                    two    = new Expr.Const(2);
    Expr.Var                x      = new Expr.Var(0);
    Expr.FuncContext<Float> sum    = new Expr.FuncContext<Float>(f,
                                                                 Arrays.asList(two),
                                                                 null);
    Expr.FuncContext<Float> sumVar = new Expr.FuncContext<Float>(f,
                                                                 Arrays.asList((Expr) x),
                                                                 null);

    assertThat(sum.eval(), is(2f));
    assertThat(sum.eval(), is(4f));
    assertThat(sumVar.eval(), is(0f));
    x.set(2);
    assertThat(sumVar.eval(), is(2f));
    x.set(5);
    assertThat(sumVar.eval(), is(7f));
    x.set(8);
    assertThat(sumVar.eval(), is(15f));
  }

  @Test
  public void testUnary()
  {
    assertThat(new Expr.Unary(Expr.Op.UNARY_MINUS,
                              new Expr.Const(5)).eval(),
               is(-5f));
    assertThat(new Expr.Unary(Expr.Op.UNARY_BITWISE_NOT,
                              new Expr.Const(9)).eval(),
               is(-10f));
    assertThat(new Expr.Unary(Expr.Op.UNARY_LOGICAL_NOT,
                              new Expr.Const(9)).eval(),
               is(0f));
    assertThat(new Expr.Unary(Expr.Op.UNARY_LOGICAL_NOT,
                              new Expr.Const(0)).eval(),
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
    Expr.Builder.OPS.remove("&");
    assertThat(builder.tokenize("1&&&") == null, is(true));
    Expr.Builder.OPS.put("&", Expr.Op.BITWISE_AND);
  }

  @Test
  public void testNumberExpr()
  {
    assertThat(builder.parse("", null, null).eval(), is(0f));
    assertThat(builder.parse("2", null, null).eval(), is(2.0f));
    assertThat(builder.parse("(2)", null, null).eval(), is(2.0f));
    assertThat(builder.parse("((2))", null, null).eval(), is(2.0f));
    assertThat(builder.parse("2.3", null, null).eval(), is(2.3f));
  }

  @Test
  public void testVarExpr()
  {
    Map<String, Expr.Var> vars = new HashMap<String, Expr.Var>();
    assertThat(builder.parse("x", vars, null).eval(), is(0f));
    vars.get("x").set(42);
    assertThat(builder.parse("x", vars, null).eval(), is(42f));
    assertThat(builder.parse("(x)", vars, null).eval(), is(42f));
  }

  @Test
  public void testUnaryExpr()
  {
    assertThat(builder.parse("-2", null, null).eval(), is(-2f));
    assertThat(builder.parse("!2", null, null).eval(), is(0f));
    assertThat(builder.parse("^2", null, null).eval(), is(-3f));
  }

  @Test
  public void testBinaryExpr()
  {
    assertThat(builder.parse("3+2", null, null).eval(), is(5f));
    assertThat(builder.parse("3/2", null, null).eval(), is(1.5f));
    assertThat(builder.parse("(3/2)|0", null, null).eval(), is(1f));
    assertThat(builder.parse("2+3/2", null, null).eval(), is(3.5f));
    assertThat(builder.parse("4/2+8*4/2", null, null).eval(), is(18f));
    assertThat(builder.parse("w=(w!=0)", null, null).eval(), is(0f));

    Map<String, Expr.Var> vars = new HashMap<String, Expr.Var>();
    vars.put("x", new Expr.Var(5));
    assertThat(builder.parse("2*x", vars, null).eval(), is(10f));
    assertThat(builder.parse("2/x", vars, null).eval(), is(2f / 5f));
  }

  @Test
  public void testCommaExpr()
  {
    assertThat(builder.parse("2, 3, 5", null, null).eval(), is(5f));
    assertThat(builder.parse("2+3, 5*3", null, null).eval(), is(15f));
  }

  @Test
  public void testAssignExpr()
  {
    Map<String, Expr.Var> vars = new HashMap<String, Expr.Var>();
    vars.put("x", new Expr.Var(5));
    assertThat(builder.parse("z=10", vars, null).eval(), is(10f));
    assertThat(builder.parse("y=10,x+y", vars, null).eval(), is(15f));
  }

  @Test
  public void testFuncExpr()
  {
    Map<String, Expr.Func> funcs = new HashMap<String, Expr.Func>();
    funcs.put("add3", new Expr.Func<Void>()
    {
      public float eval(Expr.FuncContext<Void> c)
      {
        return c.args.get(0).eval() + c.args.get(1).eval() + c.args.get(2).eval();
      }
    });
    funcs.put("nop", new Expr.Func()
    {
      public float eval(Expr.FuncContext c)
      {
        return 0;
      }
    });
    assertThat(builder.parse("2+add3(3, 7, 9)", null, funcs).eval(), is(21f));
    assertThat(builder.parse("2+add3(3, add3(1, 2, 3), 9)", null, funcs).eval(), is(20f));
    assertThat(builder.parse("nop()", null, funcs).eval(), is(0f));
    assertThat(builder.parse("nop(1)", null, funcs).eval(), is(0f));
    assertThat(builder.parse("nop((1))", null, funcs).eval(), is(0f));
  }
}
