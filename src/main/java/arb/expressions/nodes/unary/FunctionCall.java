package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.Parser;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * {@link FunctionCall} is a {@link Node} in the {@link Expression} that
 * represents a call to either a builtin or a contextual function, a contextual
 * function call being one that has been constructed by passing a
 * {@link Context} to
 * {@link arb.functions.Function#express(Class, Class, String)} or calling
 * {@link Context#registerFunctionMapping(String, Function, Class, Class)}. A
 * built-in function is one that is a member of the type of the domain or range
 * of the function, such as {@link Real#tanh(int, Real)}. <br>
 * <br>
 * A contextual function is one that is shared thru a mutual {@link Context} by
 * constructing one and passing it to the
 * {@link Function#express(Class, Class, String, Context)} function or one of
 * the other variations of the express function that accepts a {@link Context}
 * argument. <br>
 * <br>
 * For the function to be callable from another function via a shared
 * {@link Context} either the
 * {@link Function#express(Class, Class, String, String, Context)} or
 * {@link Function#express(Class, Class, String, String, Context)} methods that
 * accepts another {@link String} argument specifying the name of the function
 * should be used or you can prepend the expression "x->x^2" with "F:x->x^2" so
 * that the functions name as it is known by in the {@link Context} <br>
 * <br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionCall<D, R, F extends Function<D, R>> extends
                         UnaryOperation<D, R, F>
{

  public String                functionName;
  public boolean               contextual                      = false;
  public FunctionMapping<D, R> mapping;

  HashSet<String>              integerFunctionsWithRealResults =
                                                               new HashSet<>(Arrays.asList(new String[]
                                                               { "sqrt", "tanh", "log" }));

  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument)
  {
    super(argument,
          expression);
    this.functionName = functionName;
    scrubSymbols();
    generatedType = resultTypeFor(functionName);
    registerFunctionWhenItsContextual();
  }

  private void scrubSymbols()
  {
    this.functionName =
                      Parser.replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(functionName)
                            .replace("ln", "log")
                            .replace("√", "sqrt");
  }

  @SuppressWarnings("unchecked")
  private void registerFunctionWhenItsContextual()
  {
    if (this.expression.context != null)
    {
      mapping    =
              (FunctionMapping<D, R>) this.expression.context.functions.map.get(this.functionName);
      contextual = mapping != null;
      if (contextual)
      {
        this.expression.referencedFunctions.put(this.functionName, mapping);
      }
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    changeGeneratedTypeIfNecessary(resultType);

    if (expression.traceGeneration)
    {
      System.out.format("FunctionCall.generate: this=%s resultType=%s\n\n", this, resultType);
    }

    if (functionName.equals(expression.functionName))
    {
      designateAsRecursiveFunction(resultType);
    }

    if (contextual)
    {
      generateContextualFunctionCall(mv, resultType);
    }
    else
    {
      generateBuiltinFunctionCall(mv, resultType);
    }

    assert getGeneratedType().equals(resultType) : String.format("TODO: type conversion for output where generatedType=%s != resultType = %s\n",
                                                                 getGeneratedType(),
                                                                 resultType);
    return mv;
  }

  private void designateAsRecursiveFunction(Class<?> resultType)
  {
    contextual           = true;
    mapping              = new FunctionMapping<>();
    generatedType        = resultType;
    mapping.range        = generatedType;
    mapping.domain       = getDomainType();
    mapping.name         = functionName;
    expression.recursive = true;
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor,
                                                   Class<?> requisiteResultType)
  {
    var     expression                = arg.expression;

    boolean needsResultTypeConversion = !requisiteResultType.equals(generatedType);

    if (needsResultTypeConversion)
    {
      loadResultParameter(methodVisitor);
    }

    arg.generate(methodVisitor, expression.rangeType);
    loadBitsParameter(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, requisiteResultType);

    Class<?> domainType = getDomainType();
    Class<?> rangeType  = requisiteResultType;

    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s",
                                         rangeType.descriptorString(),
                                         rangeType.descriptorString()),
                                  false);
    if (needsResultTypeConversion)
    {
      expression.reserveIntermediateVariable(methodVisitor, generatedType);
      checkClassCast(methodVisitor, generatedType);
      invokeSetMethod(methodVisitor, generatedType, requisiteResultType);
      generatedType = requisiteResultType;
    }
    return methodVisitor;
  }

  private void changeGeneratedTypeIfNecessary(Class<?> resultType)
  {
    if (resultType.equals(Integer.class) && "factorial".equals(functionName))
    {
      generatedType = Integer.class;
    }
  }

  public Class<?> getDomainType()
  {
    return arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
  }

  @SuppressWarnings("unchecked")
  public MethodVisitor generateContextualFunctionCall(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = type();

    FunctionMapping<D, R> mapping = expression.context.functions.get(functionName);
    F                     func    = (F) mapping.instance;

    possiblyPrintDebugInformation(resultType);

    checkForUndefinedReferenced(mapping, func);

    loadFunctionReferenceOntoStack(mv, mapping);

    boolean  isVoid                 = Void.class.equals(mapping.domain);
    Class<?> argType                = arg == null ? Void.class : arg.type();

    boolean  needsArgTypeConversion = !argType.equals(mapping.domain) && !isVoid;

    if (needsArgTypeConversion)
    {
      expression.reserveIntermediateVariable(mv, mapping.domain);
    }

    var typeBefore = argType;

    generateParameter(mv, argType, isVoid);

    Class<?> typeAfter = isVoid ? Void.class : arg.type();

    validateTypeStability(typeBefore, isVoid, typeAfter);

    if (needsArgTypeConversion)
    {
      invokeSetMethod(mv, arg.type(), mapping.domain);
    }

    loadOrderParameter(mv);
    loadBitsParameter(mv);

    loadOutputVariableOntoStack(mv, expression, generatedType);

    expression.callContextualUnaryFunction(mv, mapping, generatedType);

    return mv;
  }

  private void generateParameter(MethodVisitor mv, Class<?> argType, boolean isVoid)
  {
    if (isVoid)
    {
      mv.visitInsn(Opcodes.ACONST_NULL);
    }
    else
    {
      arg.generate(mv, argType);
    }
  }

  private void possiblyPrintDebugInformation(Class<?> resultType)
  {
    if (expression.traceGeneration)
    {
      System.out.format("%s.generateContextualFunctionCall( resultType=%s, generatedType=%s ): expression.typeStack=%s\n\n",
                        getClass().getSimpleName(),
                        resultType,
                        expression.typeStack,
                        generatedType);
    }
  }

  private void checkForUndefinedReferenced(FunctionMapping<D, R> mapping, F func)
  {
    if (func == null && mapping.functionInterface == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s",
                                                       mapping));
    }
  }

  private void validateTypeStability(Class<?> typeBefore, boolean isVoid, Class<?> typeAfter)
  {
    assert typeBefore.equals(typeAfter)
                  || isVoid : String.format("%s: typeBefore=%s typeAfter=%s\n",
                                            this,
                                            typeBefore,
                                            typeAfter);
  }

  private void loadFunctionReferenceOntoStack(MethodVisitor mv, FunctionMapping<D, R> mapping)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  functionName,
                                  mapping.functionFieldDescriptor());
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  public Class<?> resultTypeFor(String functionName)
  {
    if (arg == null)
    {
      return Void.class;
    }
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
    return String.format("%s(%s)", functionName, arg == null ? "null" : arg);
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
    return format("%s(%s)",
                  functionName.replace("√", "\\sqrt").replace("J0", "J_0"),
                  arg == null ? "" : arg.typeset());
  }

  @Override
  public boolean isLeaf()
  {
    return arg == null || (arg != null && arg.type().equals(Void.class));
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return arg.isLeaf();
  }

  @Override
  public List<Node<?, ?, ?>> getBranches()
  {
    assert arg != null;
    return List.of(arg);
  }

}