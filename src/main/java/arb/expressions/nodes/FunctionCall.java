package arb.expressions.nodes;

import static arb.expressions.Compiler.callFunction;

import java.util.HashMap;
import java.util.Map;

import org.objectweb.asm.MethodVisitor;

import arb.Field;
import arb.expressions.Compiler;
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

  public interface CodeGenerationHandler
  {
    MethodVisitor generate(MethodVisitor mv, Node<?, ?, ?> node);
  }

  private final String                                   name;

  public static final Map<String, CodeGenerationHandler> functionHandlers         = new HashMap<>();

  public static final Map<String, CodeGenerationHandler> lastCallFunctionHandlers = new HashMap<>();

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
                             "lnΓ",
                             "tan",
                             "recip");
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

  /**
   * Registers both the last-expression and non-last-expression handlers for a
   * function.
   * 
   * TODO: When an expression is the last element its treated a little
   * differently, but is that really necessary now?
   * 
   * @param functionName
   * @param aliases
   */
  private static void registerFunctionHandler(String functionName, String... aliases)
  {
    registerFunctionHandler(functionName, true, aliases);
    registerFunctionHandler(functionName, false, aliases);
  }

  /**
   * Registers a function along with its aliases
   * 
   * @param functionName
   * @param lastCall     if true then this function invocation
   * @param aliases
   */
  private static void registerFunctionHandler(String functionName, boolean lastCall, String... aliases)
  {
    registerFunctionHandler(functionName, null, lastCall);
    for (String alias : aliases)
    {
      registerFunctionHandler(functionName, alias, lastCall);
    }
  }

  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument, int depth)
  {
    super(argument,
          expression,
          depth);
    assert argument != null;
    this.name  = Compiler.replaceSubscripts(functionName);
    this.depth = depth;
  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor)
  {
    CodeGenerationHandler handler = (isLast ? lastCallFunctionHandlers : functionHandlers).get(name);
    if (handler == null)
    {
      throw new RuntimeException("No handler for function '" + name + "'");
    }
    return handler.generate(methodVisitor, node);
  }

  /**
   * Registers a {@link CodeGenerationHandler} that calls the function
   * 
   * @param functionName
   * @param alias        if not null then the its handler its registered rather
   *                     than the functionName itself, in that case the
   *                     functionName is only used in the handler and not as part
   *                     of the key to be put into
   *                     this{@link #lastCallFunctionHandlers} or
   *                     this{@link #functionHandlers}
   * 
   * @param lastCall     if true then the handler assigns its output to the result
   *                     variable, otherwise it assigns it to an intermediate
   *                     variable which could possibly be the result if its
   *                     available to be used as such via
   *                     {@link Expression#resultInUse}
   * @return
   */
  public static CodeGenerationHandler registerFunctionHandler(String functionName, String alias, boolean lastCall)
  {
    CodeGenerationHandler handler = (mv, node) -> callFunction(mv, functionName, node, lastCall);

    (lastCall ? lastCallFunctionHandlers : functionHandlers).put(alias != null ? alias : functionName, handler);

    return handler;
  }

}