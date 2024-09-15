package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadOrderParameter;
import static arb.expressions.Compiler.loadThisOntoStack;
import static java.lang.String.format;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import arb.Complex;
import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.Parser;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * {@link FunctionCallNode} is a {@link Node} in the {@link Expression} that
 * represents a call to either a builtin or a contextual function, a contextual
 * function call being one that has been constructed by passing a
 * {@link Context} to
 * {@link arb.functions.Function#express(Class, Class, String)} or calling
 * {@link Context#registerFunctionMapping(String, Function, Class, Class)}. A
 * built-in function is one that is a member of the type of the domain or
 * codomain of the function, such as {@link Real#tanh(int, Real)}. <br>
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
public class FunctionCallNode<D, R, F extends Function<? extends D, ? extends R>> extends
                             UnaryOperationNode<D, R, F>
{

  @Override
  public String getIntermediateValueFieldName()
  {
    return intermediateVariableFieldName;
  }

  public boolean                  contextual                      = false;

  public String                   functionName;

  public static HashSet<String>   integerFunctionsWithRealResults =
                                                                  new HashSet<>(Arrays.asList("sqrt",
                                                                                              "tanh",
                                                                                              "log"));

  public static HashSet<String>   complexFunctionsWithRealResults =
                                                                  new HashSet<>(Arrays.asList("arg"));

  public FunctionMapping<D, R, F> mapping;

  @SuppressWarnings("unchecked")
  public FunctionCallNode(String functionName,
                          Node<D, R, F> argument,
                          Expression<D, R, F> expression)
  {
    super(argument,
          expression);
    this.functionName = functionName;
    assignFunctionName();
    generatedType = resultTypeFor(this.functionName);
    if (this.expression.context != null)
    {
      mapping    = (FunctionMapping<D, R, F>) expression.context.functions.map.get(functionName);
      contextual = mapping != null;
      if (contextual)
      {
        expression.referencedFunctions.put(functionName, mapping);
      }
    }
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    if (arg != null)
    {
      arg.accept(t);
    }
    t.accept(this);
  }

  public boolean checkForArgumentConversionNeed(FunctionMapping<D, R, F> functionMapping,
                                                boolean isNullaryFunction)
  {
    return arg != null && !arg.getGeneratedType().equals(functionMapping.domain)
                  && !isNullaryFunction;
  }

  private void checkForUndefinedReferenced(FunctionMapping<D, R, F> mapping)
  {
    if (mapping.instance == null && mapping.functionClass == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s",
                                                       mapping));
    }
  }

  private void designateAsRecursiveFunction(Class<?> resultType)
  {
    contextual           = true;
    mapping              = new FunctionMapping<>();
    generatedType        = resultType;
    mapping.coDomain     = generatedType;
    mapping.domain       = getDomainType();
    mapping.functionName = functionName;
    expression.recursive = true;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    if (Expression.trace)
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
      generateBuiltinFunctionCall(mv, resultType, isBitless());
    }

    assert getGeneratedType().equals(resultType) : String.format("%s: generatedType=%s != resultType = %s, this=%s\n",
                                                                 getClass(),
                                                                 getGeneratedType(),
                                                                 resultType,
                                                                 this);
    return mv;
  }

  @SuppressWarnings("unchecked")
  public void generateArgument(MethodVisitor mv, FunctionMapping<D, R, F> functionMapping)
  {
    boolean isNullaryFunction = Object.class.equals(functionMapping.domain);

    generateParameter(mv, (Class<? extends R>) functionMapping.domain, isNullaryFunction);

    boolean needsArgTypeConversion = checkForArgumentConversionNeed(functionMapping,
                                                                    isNullaryFunction);

    if (needsArgTypeConversion)
    {
      arg.generateCastTo(mv, functionMapping.domain);
    }
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor,
                                                   Class<?> requisiteResultType,
                                                   boolean bitless)
  {
    Class<?> argType = getArgType();
    arg.generate(methodVisitor, argType);
    if (!bitless)
    {
      loadBitsParameterOntoStack(methodVisitor);
    }

    loadOutputVariableOntoStack(methodVisitor, requisiteResultType);
    var domainType   = getDomainType();
    var coDomainType = requisiteResultType;

    methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                  Type.getInternalName(domainType),
                                  functionName,
                                  bitless ? Compiler.getMethodDescriptor(coDomainType, coDomainType)
                                          : Compiler.getMethodDescriptor(coDomainType,
                                                                         int.class,
                                                                         coDomainType),
                                  false);

    generatedType = requisiteResultType;
    return methodVisitor;
  }

  public Class<?> getArgType()
  {
    return arg.type();
  }

  public MethodVisitor generateContextualFunctionCall(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = type();

    var functionMapping = getFunctionMapping();

    checkForUndefinedReferenced(functionMapping);

    loadFunctionReferenceOntoStack(mv, functionMapping);

    generateArgument(mv, functionMapping);

    loadOrderParameter(mv);

    loadBitsParameterOntoStack(mv);

    loadOutputVariableOntoStack(mv, generatedType);

    return functionMapping.call(mv, generatedType);
  }

  private void
          generateParameter(MethodVisitor mv, Class<? extends R> argType, boolean isNullaryFunction)
  {
    if (isNullaryFunction)
    {
      mv.visitInsn(Opcodes.ACONST_NULL);
    }
    else
    {
      arg.generate(mv, argType);
    }
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    assert arg != null;
    return List.of(arg);
  }

  public Class<?> getDomainType()
  {
    return arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
  }

  public FunctionMapping<D, R, F> getFunctionMapping()
  {
    Context                  context = expression.context;
    FunctionMapping<D, R, F> mapping = context.functions.get(functionName);
    if (mapping == null && functionName != null && context != null)
    {
      mapping = registerSelfReferrentialFunctionMapping();
    }

    assert mapping != null : "FunctionMapping for " + functionName + " missing";
    return mapping;
  }

  @Override
  public boolean hasSingleLeaf()
  {
    return arg.isLeaf();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  @Override
  public boolean isLeaf()
  {
    return arg == null || (arg != null && Object.class.equals(arg.type()));
  }

  private void loadFunctionReferenceOntoStack(MethodVisitor mv, FunctionMapping<D, R, F> mapping)
  {
    expression.loadFieldOntoStack(loadThisOntoStack(mv),
                                  functionName,
                                  mapping.functionFieldDescriptor());
  }

  public FunctionMapping<D, R, F> registerSelfReferrentialFunctionMapping()
  {
    var mapping = expression.context.registerFunctionMapping(functionName,
                                                             null,
                                                             expression.domainType,
                                                             expression.coDomainType,
                                                             expression.functionClass,
                                                             false,
                                                             expression,
                                                             expression.expression);
    expression.referencedFunctions.put(functionName, mapping);
    return mapping;
  }

  public Class<?> resultTypeFor(String functionName)
  {
    if (arg == null)
    {
      return Object.class;
    }
    Class<? extends Object> argType = arg.type();

    if (argType == null)
    {
      return expression.coDomainType;
    }
    else if (((argType.equals(Integer.class) || argType.equals(Fraction.class))
                  && integerFunctionsWithRealResults.contains(functionName))
                  || (argType.equals(Complex.class)
                                && complexFunctionsWithRealResults.contains(functionName)))
    {
      return Real.class;
    }
    else
    {
      return expression.coDomainType;
    }
  }

  private void assignFunctionName()
  {
    this.functionName =
                      Parser.replaceArrowsEllipsesAndSuperscriptAlphabeticalExponents(functionName)
                            .replaceAll("ln", "log")
                            .replaceAll("√", "sqrt");
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new FunctionCallNode<E, S, G>(functionName,
                                         arg.spliceInto(newExpression),
                                         newExpression);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> transformation)
  {
    arg = arg.substitute(variable, transformation);
    return this;
  }

  @Override
  public String toString()
  {
    return String.format("%s(%s)", functionName, arg == null ? "null" : arg).replace("sqrt", "√");
  }

  @Override
  public Class<?> type()
  {
    if (isBuiltin())
    {
      Class<?> resultType = resultTypeFor(functionName);
      return resultType;
    }
    assert mapping.coDomain != null : "coDomain of " + mapping + " is null";
    return mapping.coDomain;
  }

  @Override
  public String typeset()
  {
    String name = functionName.replaceAll("√", "sqrt")
                              .replaceAll("J0", "J_0");
    return format(name.equals("sqrt") ? "\\%s{%s}" : "\\%s(%s)",
                  name,
                  arg == null ? "" : arg.typeset());
  }

  @Override
  public Node<D, R, F> derivative(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public boolean isScalar()
  {
    return arg.isScalar();
  }

  /**
   * 0xw00
   */
  @Override
  public char symbol()
  {
    return "sqrt".equals(functionName) ? '√' : 'f';
  }

  public boolean isBitless()
  {
    return false;
  }

  @Override
  public boolean isConstant()
  {
    return arg.isConstant();
  }

}