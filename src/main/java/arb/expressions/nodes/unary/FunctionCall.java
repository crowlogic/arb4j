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
 * ©2024 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 */
public class FunctionCall<D, R, F extends Function<D, R>> extends
                         UnaryOperation<D, R, F>
{

  public String        functionName;
  public boolean       contextual                      = false;
  public Mapping<?, ?> mapping;

  HashSet<String>      integerFunctionsWithRealResults = new HashSet<>(Arrays.asList(new String[]
  { "sqrt", "tanh", "log" }));

  Class<?>             targetResultType;

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
      mapping    = expression.context.functions.map.get(functionName);
      contextual = mapping != null;
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, mapping);
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

    if (functionName.equals(expression.functionName))
    {
      contextual       = true;
      mapping          = new Mapping<>();
      targetResultType = expression.rangeType;
      mapping.range    = targetResultType;
      mapping.domain   = getDomainType();
      mapping.name     = functionName;
      // mapping.functionInterface = ex

      // assert false : "TOOD: recursive function support " + functionName
      // + ", call this.evaluate as if it was a function in the contex
      // https://github.com/crowlogic/arb4j/issues/254";
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

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    var     expression                = arg.expression;
    boolean verbose                   = expression.verbose;
    boolean needsResultTypeConversion = !resultType.equals(type());
    if (verbose)
    {
      out.format("\n%s: generateBuiltinFunctionCall(resultType=%s)\n\n", this, resultType);
      out.flush();
    }
    if (needsResultTypeConversion)
    {
      Compiler.loadResult(methodVisitor, verbose);
    }
    if (verbose)
    {
      out.format("\nGenerating arg of type %s\n   for\n%s\n\n", arg, this);
      out.flush();
    }

    arg.generate(methodVisitor, expression.domainType);
    loadBits(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, verbose, resultType);

    Class<?> domainType = getDomainType();
    Class<?> rangeType  = targetResultType;
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
    if (needsResultTypeConversion)
    {
      Compiler.invokeSetMethod(methodVisitor, resultType, targetResultType, true);

    }
    return methodVisitor;
  }

  public Class<?> getDomainType()
  {
    return arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
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

    loadFunctionFromField(methodVisitor,
                          mapping.functionInterface != null ? mapping.functionInterface : mapping.func.getClass());

    Class<?> argType                = arg.type();
    var      typeBefore             = argType;
    boolean  needsArgTypeConversion = !argType.equals(mapping.domain);
    if (needsArgTypeConversion)
    {
      expression.reserveIntermediateVariable(methodVisitor, depth + 1, mapping.domain);
    }
    arg.generate(methodVisitor, argType);

    Class<?> typeAfter = arg.type();

    assert typeBefore.equals(typeAfter) : String.format("%s: typeBefore=%s typeAfter=%s\n",
                                                        this,
                                                        typeBefore,
                                                        typeAfter);

    if (needsArgTypeConversion)
    {
      Compiler.invokeSetMethod(methodVisitor, mapping.domain, arg.type(), verbose);
    }

    Compiler.loadOrder(methodVisitor);
    Compiler.loadBits(methodVisitor);

    if (verbose)
    {
      err.format("\n%s: generateContextualFunctionCall(resultType=%s)\n", this, resultType);
      err.flush();

    }

    loadOutputVariableOntoStack(methodVisitor, expression, verbose, type);

    expression.callContextualUnaryFunction(methodVisitor, mapping, type);

    return methodVisitor;
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  public void loadFunctionFromField(MethodVisitor methodVisitor, Class<?> type)
  {
    expression.loadFieldOntoStack(Compiler.loadThisOntoStack(methodVisitor), functionName, type);
  }

  private void loadOutputVariableOntoStack(MethodVisitor methodVisitor,
                                           Expression<D, R, F> expression,
                                           boolean verbose,
                                           Class<?> resultType)
  {
    if (isResult)
    {
      Compiler.checkClassCast(loadResult(methodVisitor, verbose), resultType);
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

  public Class<?> resultTypeFor(String functionName)
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

  @Override
  public String toString()
  {
    return contextual ? String.format("FunctionCall[name=%s,  function=%s, arg=%s, targetResultType=%s]",
                                      functionName,
                                      mapping,
                                      arg,
                                      targetResultType != null ? targetResultType.getName() : null) : String.format("FunctionCall[name=%s, arg=%s, targetResultType=%s]",
                                                                                                                    functionName,
                                                                                                                    arg,
                                                                                                                    targetResultType != null ? targetResultType.getName() : null);
  }

  @Override
  public Class<?> type()
  {
    if (isBuiltin())
    {
      return resultTypeFor(functionName);
    }
    assert mapping.range != null : "range of " + mapping + " is null";
    return mapping.range;
  }

  @Override
  public String typeset()
  {
    return format("%s(%s)", functionName.replace("√", "\\sqrt").replace("J0", "J_0"), arg.typeset());
  }

}