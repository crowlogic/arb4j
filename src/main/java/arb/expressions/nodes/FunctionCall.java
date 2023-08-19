package arb.expressions.nodes;

import static arb.expressions.Compiler.*;

import java.util.HashMap;
import java.util.Map;

import org.objectweb.asm.MethodVisitor;

import arb.Field;
import arb.expressions.Expression;
import arb.functions.Function;

public class FunctionCall<D extends Field<D>, R extends Field<R>, F extends Function<D, R>> extends
                         UnaryOperation<D, R, F>
{
  @Override
  public String toString()
  {
    return "FunctionCall[name=" + name + ", arg=" + node + ", isLast=" + isLast + "]";
  }

  public interface Generator
  {
    void generate(MethodVisitor mv, Node<?, ?, ?> node);
  }

  private final String                       name;

  public static final Map<String, Generator> functionHandlers         = new HashMap<>();

  public static final Map<String, Generator> lastCallFunctionHandlers = new HashMap<>();

  static
  {
    // todo: add support for |x|=abs(x)

    registerFunctionHandlers("Z",
                             "J0",
                             "sec",
                             "sin",
                             "cos",
                             "sech",
                             "floor",
                             "ceil",
                             "abs",
                             "exp",
                             "tanh",
                             "cosh",
                             "sinh",
                             "erf",
                             "erfc",
                             "erfinv",
                             "erfcinv",
                             "variance",
                             "standardDeviation",
                             "Γ",
                             "lnΓ");
  }

  private static void registerFunctionHandlers(String... functions)
  {
    for (String function : functions)
    {
      registerFunctionHandler(function);
    }
    registerFunctionHandler("log", "ln");
    // FIXME: todo, add support for √25 with no parenthesis
    registerFunctionHandler("sqrt", "√");

  }

  private static void registerFunctionHandler(String string, String... aliases)
  {
    registerFunctionHandler(string, true, aliases);
    registerFunctionHandler(string, false, aliases);
  }

  private static void registerFunctionHandler(String functionName, boolean lastCall, String... aliases)
  {
    registerFunctionHandler(functionName, null, lastCall);
    for (String alias : aliases)
    {
      registerFunctionHandler(functionName, alias, lastCall);
    }
  }

  public FunctionCall(Expression<D, R, F> parser, String functionName, Node<D, R, F> argument)
  {
    super(argument,
          parser);
    this.name = functionName.replace('₀', '0');
    assert argument != null;
  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor)
  {
    Generator handler = (isLast ? lastCallFunctionHandlers : functionHandlers).get(name);
    if (handler == null)
    {
      throw new RuntimeException("No handler for function '" + name + "'");
    }
    handler.generate(methodVisitor, node);
    return methodVisitor;
  }

  public static Generator registerFunctionHandler(String functionName, String alias, boolean lastCall)
  {
    Generator handler = (mv, node) ->
    {
      generationFunctionCall(mv, functionName, node, lastCall);
    };

    (lastCall ? lastCallFunctionHandlers : functionHandlers).put(alias != null ? alias : functionName, handler);

    return handler;
  }

  /**
   * Generate an invocation of a function specified by its name and the Node whose
   * evaluated result is the independent variable, also known as the argument, to
   * be passed to the function represented by this node
   * 
   * @param mv
   * @param functionName
   * @param arg
   * @param lastCall
   * @return
   */
  public static <D extends Field<D>, R extends Field<R>, F extends Function<D, R>>
         MethodVisitor
         generationFunctionCall(MethodVisitor mv,
                                String functionName,
                                Node<D, R, F> arg,
                                boolean lastCall)
  {
    if (verbose)
    {
      System.err.format("generateFunctionCall(mv=%s, functionName=%s, arg=%s, lastCall=%s)\n",
                        mv,
                        functionName,
                        arg,
                        lastCall);
    }
    arg.generate(mv);

    loadBits(mv);

    if (lastCall)
    {
      loadResult(mv);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          System.err.println("Preparing function call stack to reuse its argument "
                        + arg.toString(-1));
        }

        arg.prepareStackForReuse(mv);
      }
      else
      {
        arg.allocateIntermediateVariable(mv);
      }
    }

    Expression<D, R, F> expression = arg.expression;
    return expression.callUnaryFunction(expression.checkClassCast(mv, false), functionName);
  }

}