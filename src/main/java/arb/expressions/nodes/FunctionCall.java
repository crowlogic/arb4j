package arb.expressions.nodes;

import static arb.expressions.Compiler.loadBits;
import static arb.expressions.Compiler.loadResult;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static java.lang.System.err;
import static java.lang.System.out;
import static org.objectweb.asm.Opcodes.INVOKEVIRTUAL;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.expressions.*;
import arb.functions.Function;

/**
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class FunctionCall<D, R, F extends Function<D, R>> extends
                         UnaryOperation<D, R, F>
{

  @Override
  public String toString()
  {
    return String.format("FunctionCall[name=%s, contextual=%s, function=%s]", functionName, contextual, function);
  }

  public String        functionName;
  public boolean       contextual = false;
  public Mapping<?, ?> function;

  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument, int depth)
  {
    super(argument,
          expression,
          depth);
    assert argument != null;
    this.functionName = Parser.replaceSubscriptsAndArrows(functionName).replace("ln", "log").replace("√", "sqrt");
    this.depth        = depth;
    if (expression.context != null)
    {
      function   = expression.context.functions.map.get(functionName);
      contextual = function != null;
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor)
  {

    if (contextual)
    {
      return generateContextualFunctionCall(methodVisitor);
    }
    else
    {
      return generateBuiltinFunctionCall(methodVisitor);
    }
  }

  @Override
  public String typeset()
  {
    return format("%s(%s)", functionName.replace("√", "\\sqrt").replace("J0", "J_0"), arg.typeset());
  }

  /**
   * 
   * @return not this{@link #contextual}
   */
  public boolean isBuiltin()
  {
    return !contextual;
  }

  @Override
  public Class<?> type()
  {
    if (isBuiltin())
    {
      return expression.domainClass;
    }
    assert function.range != null : "range of " + function + " is null";
    return function.range;
  }

  /**
   * Generate an invocation of member function of an {@link Object} by its name
   * and the {@link Node} whose evaluated result is the independent variable, also
   * known as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param lastCall
   * @return methodVisitor (for fluent-style function composition)
   */
  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor)
  {
    var     expression = arg.expression;
    boolean verbose    = expression.verbose;
    if (verbose)
    {
      out.format("callFunction(functionName=%s, arg=%s, depth=%d)\n", functionName, arg, depth);
      out.flush();
    }

    arg.generate(methodVisitor);
    loadBits(methodVisitor);

    if (isResult)
    {
      expression.checkClassCast(loadResult(methodVisitor), arg.type());
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + arg.toString(-1));
          err.flush();
        }

        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, depth, arg.type());
      }
    }

    expression.checkClassCast(methodVisitor, arg.type());
    return generateCallToBuiltinUnaryFunction(methodVisitor, functionName, arg.type(), expression.rangeClass);
  }

  /**
   * Generate an invocation of function registered via
   * {@link Context#registerFunction(String, Function)} by its name and the
   * {@link Node} whose evaluated result is the independent variable, also known
   * as the argument, to be passed to the function represented by this node
   * 
   * @param methodVisitor
   * @param functionName
   * @param arg
   * @param lastCall
   * @param depth
   * @return methodVisitor
   */
  @SuppressWarnings("unchecked")
  public MethodVisitor generateContextualFunctionCall(MethodVisitor methodVisitor)
  {
    var           expression = arg.expression;
    boolean       verbose    = expression.verbose;
    Class<?>      type       = type();
    Mapping<D, R> mapping    = expression.context.functions.get(functionName);
    F             func       = (F) mapping.func;

    if (func == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s", mapping));
    }

    if (!type.equals(arg.type()))
    {

      String typecastVar = expression.newIntermediateVariable(depth, type);
      if (verbose)
      {
        out.format("allocated intermediate variable %s of type %s for typecasting from type %s isInput=%s\n",
                   typecastVar,
                   type,
                   arg.type(),
                   arg);
      }

      expression.loadFieldOntoStack(loadThisOntoStack(methodVisitor), typecastVar, type);

      methodVisitor.visitMethodInsn(INVOKEVIRTUAL,
                                    Type.getInternalName(type),
                                    "set",
                                    Type.getMethodDescriptor(Type.getType(type()), Type.getType(arg.type())),
                                    false);

    }

    loadFunctionFromField(methodVisitor, mapping.func.getClass());

    arg.generate(methodVisitor);

    Compiler.loadOrder(methodVisitor);
    Compiler.loadBits(methodVisitor);

    if (verbose)
    {
      err.format("callRegisteredFunction(functionName=%s, type=%s, arg=%s, arg.type=%s, depth=%d)\n",
                 functionName,
                 type,
                 arg,
                 arg.type(),
                 depth);
      err.flush();

    }

    if (arg.isResult)
    {
      Compiler.loadResult(methodVisitor);
    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          err.println("Preparing stack to reuse its argument " + arg.toString(-1));
          err.flush();
        }

        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, depth, type);
      }
    }

    expression.callRegisteredUnaryFunction(methodVisitor, func, type);

    if (verbose)
    {
      err.println("Returning from callRegisteredFunction");
      err.flush();
    }

    return methodVisitor;
  }

  public void loadFunctionFromField(MethodVisitor methodVisitor, Class<?> type)
  {
    expression.loadFieldOntoStack(Compiler.loadThisOntoStack(methodVisitor), functionName, type);
  }

  /**
   * Emit an instruction to invoke a {@link UnaryOperation} , that is, a function
   * of one variable in the input domain mapping to one variable in the output
   * range. The operators implementing method has the signature D functionName(
   * int bits, D result).
   * 
   * @param methodVisitor
   * @param functionName
   * @param domainType
   * @param rangeType
   * @return methodVisitor
   */
  public static MethodVisitor generateCallToBuiltinUnaryFunction(MethodVisitor methodVisitor,
                                                                 String functionName,
                                                                 Class<?> domainType,
                                                                 Class<?> rangeType)
  {
    if (verbose)
    {
      out.format("generateCallToBuiltinUnaryFunction(functionName=%s, domainType=%s, rangeType=%s\n",
                 functionName,
                 domainType,
                 rangeType);
      out.flush();
    }
    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s", domainType.descriptorString(), rangeType.descriptorString()),
                                  false);
    return methodVisitor;
  }

}