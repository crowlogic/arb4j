package arb.expression;

import java.util.HashMap;
import java.util.Map;

public class Example
{

  public final static String      FORMULA = "x=2+3*(x/(42+plusone(x))),x";

  private static Function<Float> plusOne = new Function<Float>()
                                          {
                                            public float evaluate(FunctionalExpressionContext<Float> c)
                                            {
                                              if (c.env == null)
                                              {
                                                c.env = 0f;
                                              }
                                              c.env = c.env + 1;
                                              return c.env;
                                            }
                                          };

  private static float bench(int join, int iter, boolean evaluate)
  {
    StringBuilder sb = new StringBuilder("0");
    for (int i = 0; i < join; i++)
    {
      sb.append(',').append(FORMULA);
    }
    Map<String, VariableExpression>  variableExpressions  = new HashMap<String, VariableExpression>();
    Map<String, Function> functions = new HashMap<String, Function>();
    functions.put("plusone", plusOne);

    if (evaluate)
    {
      Expression e     = new Builder().parse(sb.toString(), variableExpressions, functions);
      long start = System.nanoTime();
      for (int i = 0; i < iter; i++)
      {
        e.evaluate();
      }
      return (System.nanoTime() - start) * 1f / iter;
    }
    else
    {
      long start = System.nanoTime();
      for (int i = 0; i < iter; i++)
      {
        new Builder().parse(sb.toString(), variableExpressions, functions);
      }
      return (System.nanoTime() - start) * 1f / iter;
    }
  }

  private static void benchmark()
  {
    System.out.println("parse 1: " + bench(1, 10000, false));
    System.out.println("parse 10: " + bench(10, 10000, false));
    System.out.println("parse 100: " + bench(100, 10000, false));
    System.out.println("eval 1: " + bench(1, 10000, true));
    System.out.println("eval 10: " + bench(10, 10000, true));
    System.out.println("eval 100: " + bench(100, 10000, true));
  }

  public static void main(String[] args)
  {
    // Quick usage example
    Expression e = new Builder().parse("2+3", null, null);
    System.out.println(e.evaluate());

    // Performance benchmark for parsing and evaluation phases
    benchmark();
  }
}
