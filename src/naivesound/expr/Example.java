package naivesound.expr;

import java.util.HashMap;
import java.util.Map;

public class Example
{

  public final static String      FORMULA = "x=2+3*(x/(42+plusone(x))),x";

  private static Expr.Func<Float> plusOne = new Expr.Func<Float>()
                                          {
                                            public float eval(Expr.FuncContext<Float> c)
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
    Map<String, Expr.Var>  vars  = new HashMap<String, Expr.Var>();
    Map<String, Expr.Func> funcs = new HashMap<String, Expr.Func>();
    funcs.put("plusone", plusOne);

    if (evaluate)
    {
      Expr e     = new Expr.Builder().parse(sb.toString(), vars, funcs);
      long start = System.nanoTime();
      for (int i = 0; i < iter; i++)
      {
        e.eval();
      }
      return (System.nanoTime() - start) * 1f / iter;
    }
    else
    {
      long start = System.nanoTime();
      for (int i = 0; i < iter; i++)
      {
        new Expr.Builder().parse(sb.toString(), vars, funcs);
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
    Expr e = new Expr.Builder().parse("2+3", null, null);
    System.out.println(e.eval());

    // Performance benchmark for parsing and evaluation phases
    benchmark();
  }
}
