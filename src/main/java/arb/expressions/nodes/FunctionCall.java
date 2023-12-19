package arb.expressions.nodes;

import static java.lang.String.format;

import java.util.HashMap;
import java.util.Map;

import org.objectweb.asm.MethodVisitor;

import arb.Field;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

/**
 * <pre>
 * Copyright ©2023 Stephen Crowley
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class FunctionCall<D, R, F extends Function<? extends D, ? extends R>> extends
                         UnaryOperation<D, R, F>
{
  @Override
  public String toString()
  {
    return "FunctionCall[name=" + name + ", arg=" + node + ", isResult=" + isResult + "]";
  }

  public interface CodeGenerator
  {
    MethodVisitor generate(MethodVisitor mv, Node<?, ?, ?> operand, int depth);
  }

  private final String                           name;

  public static final Map<String, CodeGenerator> functionHandlers       = new HashMap<>();

  public static final Map<String, CodeGenerator> resultFunctionHandlers = new HashMap<>();

  static
  {
    // todo: add support for |x|=abs(x)

    registerFunctionHandlers("Z",
                             "J0",
                             "sec",
                             "sin",
                             "arcsin",
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
    this.name  = Parser.replaceSubscripts(functionName);
    this.depth = depth;
  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor)
  {
    CodeGenerator handler = (isResult ? resultFunctionHandlers : functionHandlers).get(name);

    if (handler == null)
    {

      Compiler.generateRegisteredFunctionCall(methodVisitor, name, node, isResult, depth);

      return methodVisitor;
    }
    else
    {
      return handler.generate(methodVisitor, node, depth);
    }
  }

  /**
   * Registers a {@link CodeGenerator} that generates code to call the function
   * 
   * @param functionName
   * @param alias        if not null then the its handler its registered rather
   *                     than the functionName itself, in that case the
   *                     functionName is only used in the handler and not as part
   *                     of the key to be put into
   *                     this{@link #resultFunctionHandlers} or
   *                     this{@link #functionHandlers}
   * 
   * @param lastCall     if true then the handler assigns its output to the result
   *                     variable, otherwise it assigns it to an intermediate
   *                     variable which could possibly be the result if its
   *                     available to be used as such via
   *                     {@link Expression#resultInUse}
   * @return the {@link CodeGenerator} associated with this particular instance of
   *         the function
   */
  public static CodeGenerator registerFunctionHandler(String functionName, String alias, boolean lastCall)
  {
    CodeGenerator handler  = (mv,
                              node,
                              depth) -> Compiler.callFunctionOfVariable(mv, functionName, node, lastCall, depth);
    var           handlers = lastCall ? resultFunctionHandlers : functionHandlers;
    String        name     = alias != null ? alias : functionName;
    handlers.put(name, handler);
    return handler;
  }

  @Override
  public String typeset()
  {
    String name = this.name;

    if ("√".equals(name))
    {
      name = "sqrt";
    }
    else if ("J0".equals(name))
    {
      name = "J_0";
    }
    else
    {
      name = "\\" + name;
    }
    return format("%s (%s)", name, node.typeset());

  }

}