package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.loadBits;
import static arb.expressions.Compiler.loadResult;
import static java.lang.String.format;
import static java.lang.System.err;
import static java.lang.System.out;

import java.util.Arrays;
import java.util.HashSet;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.expressions.*;
import arb.expressions.nodes.Node;
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
    return String.format("FunctionCall[name=%s, contextual=%s, function=%s, targetResultType=%s]",
                         functionName,
                         contextual,
                         function,
                         targetResultType);
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
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, function);
      }
    }
    targetResultType = resultTypeFor(functionName);
  }

  @Override
  public MethodVisitor generate(MethodVisitor methodVisitor, Class<?> resultType)
  {
    if (verbose)
    {
      out.format("\n%s: generate(resultType=%s)\n\n", this, resultType);
      out.flush();
    }
    if (contextual)
    {
      return generateContextualFunctionCall(methodVisitor, resultType);
    }
    else
    {
      return generateBuiltinFunctionCall(methodVisitor, resultType);
    }
  }

  @Override
  public String typeset()
  {
    return format("%s(%s)", functionName.replace("√", "\\sqrt").replace("J0", "J_0"), arg.typeset());
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  @Override
  public Class<?> type()
  {
    if (isBuiltin())
    {
      return resultTypeFor(functionName);
    }
    assert function.range != null : "range of " + function + " is null";
    return function.range;
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    var     expression                = arg.expression;
    boolean verbose                   = expression.verbose;
    boolean needsResultTypeConversion = !resultType.equals(type());
    if (verbose)
    {
      out.format("\ngenerateBuiltinFunctionCall(functionName=%s, arg=%s, needsTypeConversion=%s, isResult=%s, resultType=%s, targetResultType=%s)\n\n",
                 functionName,
                 arg,
                 needsResultTypeConversion,
                 isResult,
                 resultType,
                 targetResultType);
      out.flush();
    }
    if (needsResultTypeConversion)
    {
      Compiler.loadResult(methodVisitor, verbose);
    }
    if (verbose)
    {
      System.out.format("\nGenerating arg of type %s for %s\n\n", arg, this);
      System.out.flush();
    }

    arg.generate(methodVisitor, expression.domainType);
    loadBits(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, verbose, resultType);

    Class<?> argtype = arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
    generateCallToBuiltinUnaryFunction(methodVisitor, functionName, argtype, targetResultType);

    if (needsResultTypeConversion)
    {
      Compiler.invokeSetMethod(methodVisitor, resultType, targetResultType, true);

    }
    return methodVisitor;
  }

  private void loadOutputVariableOntoStack(MethodVisitor methodVisitor,
                                           Expression<D, R, F> expression,
                                           boolean verbose,
                                           Class<?> resultType)
  {
    if (isResult)
    {
      expression.checkClassCast(loadResult(methodVisitor, verbose), resultType);

    }
    else
    {
      if (arg.isReusable())
      {
        if (verbose)
        {
          err.println("\nPreparing stack to reuse its argument " + arg.toString(-1) + "\n");
          err.flush();
        }

        arg.prepareStackForReuse(methodVisitor);
      }
      else
      {
        expression.reserveIntermediateVariable(methodVisitor, depth, resultType);
      }
    }
  }

  HashSet<String> integerFunctionsWithRealResults = new HashSet<>(Arrays.asList(new String[]
  { "sqrt", "tanh", "log" }));
  Class<?>        targetResultType;

  private Class<?> resultTypeFor(String functionName)
  {
    if (arg.type().equals(Integer.class) && integerFunctionsWithRealResults.contains(functionName))
    {
      return Real.class;
    }
    else
    {
      return expression.rangeType;
    }
  }

  @SuppressWarnings("unchecked")
  public MethodVisitor generateContextualFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
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

    loadFunctionFromField(methodVisitor, mapping.func.getClass());

    arg.generate(methodVisitor, mapping.domain);
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

  public static MethodVisitor generateCallToBuiltinUnaryFunction(MethodVisitor methodVisitor,
                                                                 String functionName,
                                                                 Class<?> domainType,
                                                                 Class<?> rangeType)
  {
    if (verbose)
    {
      out.format("\ngenerateCallToBuiltinUnaryFunction(functionName=%s, domainType=%s, rangeType=%s\n\n",
                 functionName,
                 domainType,
                 rangeType);
      out.flush();
    }
    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s", rangeType.descriptorString(), rangeType.descriptorString()),
                                  false);
    return methodVisitor;
  }

}