package arb.expressions.nodes;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.HashMap;
import java.util.Map;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.expressions.Expression;
import arb.functions.Function;

public class FunctionCall<D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>> extends
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
    // register functions with aliases separately
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

  public FunctionCall(Expression<D, R, F> parser, String functionName, Node<D, R, F> argument, int depth)
  {
    super(argument,
          parser);
    this.name = functionName.replace('₀', '0');
    assert argument != null;
    this.depth     = depth;
    argument.depth = depth + 1;
  }

  @Override
  public void generate(MethodVisitor methodVisitor)
  {
    Generator handler = (isLast ? lastCallFunctionHandlers : functionHandlers).get(name);
    if (handler == null)
    {
      throw new RuntimeException("No handler for function '" + name + "'");
    }
    handler.generate(methodVisitor, node);
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
   * @param independentVariable
   * @param lastCall
   * @return
   */
  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         MethodVisitor
         generationFunctionCall(MethodVisitor mv, String functionName, Node<D, R, F> independentVariable, boolean lastCall)
  {
    if (verbose)
    {
      System.err.format("generateFunctionCall(mv=%s, functionName=%s, argument=%s, lastCall=%s)\n",
                        mv,
                        functionName,
                        independentVariable,
                        lastCall);
    }
    independentVariable.generate(mv);

    loadBits(mv);

    if (lastCall)
    {
      loadResult(mv);
    }
    else
    {
      if (independentVariable.isReusable())
      {
        if (verbose)
        {
          System.err.println("Preparing function call stack to reuse its argument " + independentVariable.toString(-1));
        }

        independentVariable.prepareStackForReuse(mv);
      }
      else
      {
        independentVariable.allocateIntermediateVariable(mv);
      }
    }

    return invokeFunction(independentVariable.expression.checkClassCast(mv, false), functionName, independentVariable);
  }

  public static <D extends arb.Field<D>, R extends arb.Field<R>, F extends Function<D, R>>
         MethodVisitor
         invokeFunction(MethodVisitor mv, String functionName, Node<D, R, F> node)
  {
    String dcd = node.expression.domainClassDescriptor;
    mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                       node.expression.domainClassInternalName,
                       functionName,
                       format("(I%s)%s", dcd, dcd),
                       false);
    return mv;
  }

}