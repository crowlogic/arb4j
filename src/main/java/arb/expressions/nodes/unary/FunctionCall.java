package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.checkClassCast;
import static arb.expressions.Compiler.invokeSetMethod;
import static arb.expressions.Compiler.loadBitsParameter;
import static arb.expressions.Compiler.loadOrderParameter;
import static arb.expressions.Compiler.loadResultParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;
import static java.lang.System.out;

import java.util.Arrays;
import java.util.HashSet;

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

  HashSet<String>              integerFunctionsWithRealResults = new HashSet<>(Arrays.asList(new String[]
  { "sqrt", "tanh", "log" }));

  @SuppressWarnings("unchecked")
  public FunctionCall(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument)
  {
    super(argument,
          expression);
    this.functionName = Parser.replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(functionName)
                              .replace("ln", "log")
                              .replace("√", "sqrt");
    generatedType     = resultTypeFor(functionName);

    // assert argument == null && !targetResultType.equals(Void.class) : "argument
    // is null for " + this;
    if (expression.context != null)
    {
      mapping    = (FunctionMapping<D, R>) expression.context.functions.map.get(functionName);
      contextual = mapping != null;
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, mapping);
      }
    }

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    changeGeneratedTypeIfNecessary(resultType);

    if (expression.traceGenerator)
    {
      System.out.format("FunctionCall.generate: this=%s resultType=%s\n\n", this, resultType);
    }

    if (functionName.equals(expression.functionName))
    {
      contextual           = true;
      mapping              = new FunctionMapping<>();
      generatedType        = resultType;
      mapping.range        = generatedType;
      mapping.domain       = getDomainType();
      mapping.name         = functionName;
      expression.recursive = true;

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

  /**
   * 
   * @param methodVisitor
   * @param resultType
   * @return
   */
  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor, Class<?> resultType)
  {
    var expression = arg.expression;
        
    boolean needsResultTypeConversion = !resultType.equals(generatedType);

    if (needsResultTypeConversion)
    {
      loadResultParameter(methodVisitor);
    }

    arg.generate(methodVisitor, expression.rangeType);
    loadBitsParameter(methodVisitor);

    loadOutputVariableOntoStack(methodVisitor, expression, resultType);

    Class<?> domainType = getDomainType();
    Class<?> rangeType  = resultType;

    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  format("(I%s)%s", rangeType.descriptorString(), rangeType.descriptorString()),
                                  false);
    if (needsResultTypeConversion)
    {
      expression.reserveIntermediateVariable(methodVisitor, generatedType);
      checkClassCast(methodVisitor, generatedType);
      invokeSetMethod(methodVisitor, resultType, generatedType);
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

    if (expression.traceGenerator)
    {
      System.out.format("%s.generateContextualFunctionCall( resultType=%s, generatedType=%s ): expression.typeStack=%s\n\n",
                        getClass().getSimpleName(),
                        resultType,
                        expression.typeStack,
                        generatedType);
    }

    if (func == null && mapping.functionInterface == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s", mapping));
    }

    loadFunctionReferenceOntoStack(mv, mapping);

    Class<?> argType                = arg == null ? Void.class : arg.type();
    var      typeBefore             = argType;
    boolean  isVoid                 = Void.class.equals(mapping.domain);
    boolean  needsArgTypeConversion = !argType.equals(mapping.domain) && !isVoid;

    if (needsArgTypeConversion)
    {
      expression.reserveIntermediateVariable(mv, mapping.domain);
    }

    if (isVoid)
    {
      mv.visitInsn(Opcodes.ACONST_NULL);
    }
    else
    {
      arg.generate(mv, argType);
    }

    Class<?> typeAfter = isVoid ? Void.class : arg.type();

    assert typeBefore.equals(typeAfter)
                  || isVoid : String.format("%s: typeBefore=%s typeAfter=%s\n", this, typeBefore, typeAfter);

    if (needsArgTypeConversion)
    {
      invokeSetMethod(mv, arg.type(), mapping.domain);
    }

    loadOrderParameter(mv);
    loadBitsParameter(mv);

    loadOutputVariableOntoStack(mv, expression, generatedType);

    if (expression.verbose)
    {
      out.format("callContextualUnaryFunction( mapping=%s type=%s\n", mapping, generatedType);
    }
    expression.callContextualUnaryFunction(mv, mapping, generatedType);

    return mv;
  }

  private void loadFunctionReferenceOntoStack(MethodVisitor mv, FunctionMapping<D, R> mapping)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv), functionName, mapping.functionFieldDescriptor());
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
    return contextual ? String.format("FunctionCall[%s(%s), function=%s,  generatedType=%s]",
                                      functionName,
                                      arg == null ? "null" : arg.typeset(),
                                      mapping,
                                      generatedType != null ? generatedType.getName() : null) : String.format("FunctionCall[name=%s, arg=%s, generatedType=%s]",
                                                                                                              functionName,
                                                                                                              arg == null ? "null" : arg.typeset(),
                                                                                                              generatedType != null ? generatedType.getName() : null);
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

}