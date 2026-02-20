package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.*;
import java.util.function.Consumer;
import java.util.stream.Stream;

import org.objectweb.asm.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.*;
import arb.expressions.Context;
import arb.expressions.nodes.*;
import arb.functions.Function;
import arb.utensils.Utensils;

/**
 * {@link FunctionNode} is a {@link Node} in the {@link Expression} that
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
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings(
{ "unchecked" })
public class FunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                         UnaryOperationNode<D, R, F>
{
  /**
   * TODO: this needs to be made fluent style
   */
  @Override
  public <T> T evaluate(Class<T> resultType)
  {
    Real argVal = arg.evaluate(Real.class);
    int  bits   = 128;
    try ( Real result = new Real())
    {
      switch (functionName)
      {
      case "ceil":
        try ( Integer ceil = new Integer())
        {
          argVal.ceil(bits, ceil);
          if (resultType.equals(Integer.class))
          {
            return (T) ceil;
          }
          if (resultType.equals(Real.class))
          {
            result.set(ceil);
            return (T) result;
          }
          if (resultType.equals(Fraction.class))
          {
            Fraction frac = new Fraction();
            frac.set(ceil);
            return (T) frac;
          }
        }
        break;
      case "floor":
        try ( Integer floor = new Integer())
        {
          argVal.floor(bits, floor);
          if (resultType.equals(Integer.class))
          {
            return (T) floor;
          }
          if (resultType.equals(Real.class))
          {
            result.set(floor);
            return (T) result;
          }
          if (resultType.equals(Fraction.class))
          {
            Fraction frac = new Fraction();
            frac.set(floor);
            return (T) frac;
          }
        }
        break;
      case "sqrt":
        argVal.sqrt(bits, result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "abs":
        argVal.abs(result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "exp":
        argVal.exp(bits, result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "log":
        argVal.log(bits, result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "sin":
        argVal.sin(bits, result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "cos":
        argVal.cos(bits, result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "Γ":
      case "gamma":
        argVal.Γ(bits, result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      case "neg":
        argVal.neg(result);
        if (resultType.equals(Real.class))
        {
          return (T) result;
        }
        break;
      default:
        break;
      }
    }
    return super.evaluate(resultType);
  }

  @Override
  public boolean isZero()
  {
    return false;
  }

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  @Override
  public boolean isLogarithmic()
  {
    return "log".equals(functionName) || "ln".equals(functionName);
  }

  /**
   * The derivative order for this function node. 0 means the function itself, 1
   * means first derivative, 2 means second derivative, etc.
   */
  protected int derivativeOrder = 0;

  @Override
  public Node<D, R, F> derivative()
  {
    Node<D, R, F> diff = super.derivative();
    return diff;
  }

  @Override
  public boolean isSquareRoot()
  {
    return "sqrt".equals(functionName);
  }

  @Override
  public Node<D, R, F> getSquareRootArg()
  {
    if (!isSquareRoot())
    {
      throw new IllegalArgumentException(this + " is not a square root");
    }
    return arg;
  }

  @Override
  public Node<D, R, F> simplify()
  {

    if (arg != null)
    {
      arg = arg.simplify();
    }

    Node<D, R, F> node         = this;

    var           functionNode = node.asFunction();
    if (functionNode.isSquareRoot())
    {
      var arg = functionNode.arg;
      if (arg.isOne())
      {
        return node.one();
      }
    }

    node = simplifyExponential(node);

    return node;
  }

  protected static <D, R, F extends Function<? extends D, ? extends R>>
            Node<D, R, F>
            simplifyExponential(Node<D, R, F> node)
  {
    var functionNode = node.asFunction();
    if (functionNode.isExponential())
    {
      var arg = functionNode.arg;
      if (arg.isZero())
      {
        return node.one();
      }
      else if (arg.isNegativeInfinity())
      {
        return node.zero();
      }

    }
    return functionNode;
  }

  public FunctionNode(Expression<D, R, F> expression,
                      FunctionMapping<?, ?, ?> mapping,
                      Node<D, R, F> arg)
  {
    this(mapping.functionName,
         arg,
         expression);
    this.mapping = mapping;
  }

  /**
   * Constructor with derivative order support for special functions.
   */
  public FunctionNode(Expression<D, R, F> expression,
                      String functionName,
                      Node<D, R, F> argument,
                      int derivativeOrder)
  {
    this(functionName,
         argument,
         expression);
    this.derivativeOrder = Math.max(0, derivativeOrder);
  }

  @Override
  public int hashCode()
  {
    return 31337 * super.hashCode() + Objects.hash(functionName, derivativeOrder);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;

    if (obj instanceof FunctionNode<?, ?, ?> other)
    {
      return super.equals(obj) && Objects.equals(functionName, other.functionName)
                    && derivativeOrder == other.derivativeOrder;
    }
    return false;

  }

  static final HashSet<String>  bitlessFunctions                = new HashSet<>();

  public static HashSet<String> complexFunctionsWithRealResults =
                                                                new HashSet<>(Arrays.asList("arg",
                                                                                            "re",
                                                                                            "im",
                                                                                            "real",
                                                                                            "imag"));

  public static HashSet<String> integerFunctionsWithRealResults =
                                                                new HashSet<>(Arrays.asList("sqrt",
                                                                                            "tanh",
                                                                                            "log"));

  static
  {
    bitlessFunctions.add("neg");
    bitlessFunctions.add("sign");
    bitlessFunctions.add("conj");
  }

  public boolean         contextual = false;

  public String          functionName;

  @SuppressWarnings("rawtypes")
  public FunctionMapping mapping;

  public VariableNode<?, ?, ?> getInputVariableNode()
  {
    if (mapping != null)
    {
      Expression<?, ?, ?> variableExpression = mapping.expression;
      if (variableExpression != null)
      {
        return variableExpression.independentVariable;
      }
    }

    return null;
  }

  @Override
  public boolean isEasilyIntegrable()
  {
    switch (functionName)
    {
    case "exp":
    case "sin":
    case "cos":
    case "sinh":
    case "cosh":
      return true;
    default:
      return false;
    }
  }

  public FunctionNode(String functionName, Node<D, R, F> argument, Expression<D, R, F> expression)
  {
    super(expression,
          argument);
    assert functionName != null : "functionName cannot be null";
    this.functionName = functionName;
    assignFunctionName();
    if (this.expression.context != null)
    {
      lookupFunctionInContext();
    }
    if (generatedType == null)
    {
      generatedType = resultTypeFor(this.functionName);
    }
    if (functionName != null && functionName.equals(expression.functionName))
    {
      designateAsRecursiveFunction(type());
    }

  }

  private void lookupFunctionInContext()
  {
    mapping    = expression.context.getFunctionMapping(functionName);
    contextual = mapping != null;
    if (contextual)
    {
      expression.referencedFunctions.put(functionName, mapping);
      generatedType = mapping.coDomain;
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

  private void assignFunctionName()
  {
    if (functionName == null)
    {
      return;
    }
    functionName = switch (functionName)
    {
    case "sgn":
      yield "sign";
    case "ln":
      yield "log";
    case "√":
      yield "sqrt";
    case "gamma":
      yield "Γ";
    case "zeta":
      yield "ζ";
    default:
      yield functionName;
    };
  }

  public boolean isArgumentTypeConversionNeed(FunctionMapping<D, R, F> functionMapping,
                                              boolean isNullaryFunction)
  {
    return arg != null && !functionMapping.domain.equals(arg.getGeneratedType())
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
    contextual = true;
    mapping    = new FunctionMapping<>();
    if (generatedType == null)
    {
      generatedType = resultType;
    }
    mapping.coDomain     = generatedType;
    mapping.domain       = getDomainType();
    mapping.functionName = functionName;
    expression.recursive = true;
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    if (isLinearOperator())
    {
      return arg.differentiate(variable).apply(functionName).simplify();
    }
    var argDerivative      = arg.differentiate(variable);
    var functionDerivative = differentiateFunction();
    var derivative         = functionDerivative.mul(argDerivative);
    return derivative.simplify();
  }

  public boolean isLinearOperator()
  {
    return "re".equals(functionName) || "im".equals(functionName);
  }

  /**
   * Handles differentiation for built-in functions.
   */
  private Node<D, R, F> differentiateBuiltinFunction()
  {

    switch (functionName)
    {
    case "δ": // Dirac delta function
      // The derivative of δ(x) is 0 for base delta
      // The derivative of δ'(x) is δ''(x), etc.
      if (derivativeOrder == 0)
      {
        return zero();
      }
      else
      {
        return new FunctionNode<>(expression,
                                  functionName,
                                  arg,
                                  derivativeOrder + 1);
      }
    case "θ": // Heaviside step function
      return arg.δ();
    case "sqrt":
      return one().div(mul(2));
    case "arctan":
      return one().div(one().add(arg.pow(2)));
    case "arcsin":
      return arcsinDerivative();
    case "arccos":
      return arcsinDerivative().neg();
    case "sin":
      return arg.cos();
    case "cos":
      return arg.sin().neg();
    case "sinh":
      return arg.cosh();
    case "cosh":
      return arg.sinh();
    case "exp":
      return this;
    case "log":
      return one().div(arg);
    case "cot":
      return negativeOne().sub(pow(2));
    case "tan":
      return one().add(arg.tan().pow(2));
    case "tanh":
      return one().sub(arg.tanh().pow(2));
    case "sec":
      return mul(arg.tan());
    case "csc":
      return neg().mul(arg.cot());
    case "Γ":
    case "gamma":
      return mul(arg.digamma());
    case "lnΓ":
    case "lnGamma":
      return arg.digamma();
    case "digamma":
      return new GammaFunctionNode<>(expression,
                                     arg,
                                     1);
    case "ζ":
      return new ZetaFunctionNode<>(expression,
                                    arg,
                                    1);
    default:
      return new DerivativeNode<>(expression,
                                  this);
//      throw new UnsupportedOperationException("Derivative not implemented for function: "
//                                              + functionName
//                                              + " in expression '"
//                                              + expression
//                                              + "'");
    }
  }

  public Node<D, R, F> arcsinDerivative()
  {
    return one().div(one().sub(arg.pow(2)).sqrt());
  }

  private Node<D, R, F> differentiateContextualFunction()
  {
    var functionMapping = expression.context.getFunctionMapping(functionName);

    if (functionMapping == null)
    {
      throw new CompilerException(String.format("function named %s was not found in context.functions",
                                                functionName));
    }

    var instance = functionMapping.instance;
    if (instance == null)
    {
      return new DerivativeNode<>(expression,
                                  this);
    }

    setFunctionContext(instance);

    var    derivative             = instance.derivative();

    String derivativeFunctionName = derivative.getName();
    assert derivativeFunctionName != null : "derivativeFunctionName is null for instance "
                                            + instance
                                            + ": TODO: use the "
                                            + derivative
                                            + " directly";

    var newDerivativeFunctionMapping = expression.context.functions.get(derivativeFunctionName);

    assert newDerivativeFunctionMapping != null : "no function mapping with name "
                                                  + derivativeFunctionName
                                                  + " for derivative "
                                                  + derivative
                                                  + " of "
                                                  + instance;

    return new FunctionNode<D, R, F>(expression,
                                     newDerivativeFunctionMapping,
                                     arg);
  }

  protected void setFunctionContext(Function<?, ?> instance)
  {
    try
    {
      var instanceContextField = instance.getClass().getDeclaredField("context");
      instanceContextField.setAccessible(true);
      Context instanceContext = (Context) instanceContextField.get(instance);
      if (instanceContext != null)
      {
        if (expression.context != instanceContext)
        {
          expression.context.mergeFrom(instanceContext);
        }
      }
      instanceContextField.set(instance, expression.context);

    }
    catch (Exception e)
    {
      Utensils.throwOrWrap(e);
    }
  }

  protected static final Logger logger = LoggerFactory.getLogger(FunctionNode.class);

  private Node<D, R, F> integrateContextualFunction(VariableNode<D, R, F> variable)
  {
    if (Expression.traceNodes)
    {
      logger.debug("integrateContextualFunction(): functionName={}", functionName);
    }
    var functionMapping = expression.context.getFunctionMapping(functionName);

    if (functionMapping == null)
    {
      throw new CompilerException(String.format("function named %s was not found in context.functions",
                                                functionName));
    }
    var instance = functionMapping.instance;
    if (instance == null)
    {
      if (functionMapping.expressionString == null)
      {
              throw new CompilerException(String.format("Instance for function %s was not present in %s",
                                                  functionName,
                                                  functionMapping));
      }
      else
      {
        var integrand = Function.parse(mapping.domain,
                                       mapping.coDomain,
                                       mapping.functionClass,
                                       mapping.expressionString);
        integrand.ascendentExpression = expression;
        return integrand.rootNode.integral(integrand.independentVariable).simplify();
//
//        throw new CompilerException(String.format("TODO: integrate parsed but yet-to-be-compiled expression string in expression '%s' where integrand='%s' and integral='%s' ",
//                                                  functionMapping,
//                                                  integrand,
//                                                  integral));

      }
    }

    var    integral                   = instance.integral();
    String integralFunctionName       = integral.getName();

    var    newIntegralFunctionMapping = expression.context.functions.get(integralFunctionName);
    if (functionMapping != null && Polynomial.class.isAssignableFrom(functionMapping.coDomain))
    {
      return new PolynomialIntegralNode<>(expression,
                                          this,
                                          arg);

    }
    assert newIntegralFunctionMapping != null : "newIntegralFunctionMapping is  null for "
                                                + integralFunctionName
                                                + " and functionMapping="
                                                + functionMapping;
    return new FunctionNode<D, R, F>(expression,
                                     newIntegralFunctionMapping,
                                     arg);

  }

  /**
   * Returns the node representing the derivative of the function. This will vary
   * based on whether the function is built-in or contextual.
   */
  private Node<D, R, F> differentiateFunction()
  {
    if (isBuiltin())
    {
      return differentiateBuiltinFunction();
    }
    else if (contextual)
    {
      return differentiateContextualFunction();
    }
    else
    {
      throw new UnsupportedOperationException("Cannot differentiate function: " + functionName);
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    if (Expression.traceNodes)
    {
      logger.debug(String.format("generate(this=%s, arg=%s, resultType=%s)",
                                 this,
                                 arg,
                                 resultType));
    }

    if (contextual)
    {
      generateContextualFunctionCall(mv, resultType);
    }
    else
    {
      generateBuiltinFunctionCall(mv, resultType, isBitless());
    }

    if (!getGeneratedType().equals(resultType))
    {
      generateCastTo(mv, resultType);
    }

    return mv;
  }

  public void generateArgument(MethodVisitor mv, FunctionMapping<D, R, F> functionMapping)
  {
    boolean isNullaryFunction = Object.class.equals(functionMapping.domain);

    generateParameter(mv, (Class<? extends R>) functionMapping.domain, isNullaryFunction);

    if (isArgumentTypeConversionNeed(functionMapping, isNullaryFunction))
    {
      arg.generateCastTo(mv, functionMapping.domain);
    }
  }

  public static boolean methodExists(Class<?> clazz, String methodName, Class<?>... parameterTypes)
  {
    return Stream.of(clazz.getMethods())
                 .anyMatch(method -> method.getName().equals(methodName)
                               && Arrays.equals(method.getParameterTypes(), parameterTypes));
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
    var    domainType         = getDomainType();
    var    coDomainType       = requisiteResultType;

    String functionDescriptor = bitless ? Compiler.getMethodDescriptor(coDomainType, coDomainType)
                                        : Compiler.getMethodDescriptor(coDomainType,
                                                                       int.class,
                                                                       coDomainType);

    if (doesBuiltinFunctionExist(functionName, bitless, domainType, coDomainType))
    {

      methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                    Type.getInternalName(domainType),
                                    functionName,
                                    functionDescriptor,
                                    false);

      generatedType = requisiteResultType;
    }
    else
    {
      functionDescriptor = bitless ? Compiler.getMethodDescriptor(domainType, coDomainType)
                                   : Compiler.getMethodDescriptor(domainType,
                                                                  int.class,
                                                                  coDomainType);

      if (doesBuiltinFunctionExist(functionName, bitless, domainType, coDomainType))
      {

        methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                                      Type.getInternalName(domainType),
                                      functionName,
                                      functionDescriptor,
                                      false);

        generatedType = requisiteResultType;
      }
      else
      {
        assert false : String.format("no such function named %s from %s to %s (expr=%s)",
                                     functionName,
                                     domainType,
                                     coDomainType,
                                     expression);
      }
    }
    return methodVisitor;
  }

  public static boolean doesBuiltinFunctionExist(String functionName,
                                                 boolean bitless,
                                                 Class<?> domainType,
                                                 Class<?> coDomainType)
  {
    if (bitless)
    {
      return methodExists(domainType, functionName, coDomainType);
    }
    else
    {
      return methodExists(domainType, functionName, int.class, coDomainType);
    }
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

  public Class<?> getArgType()
  {
    return arg.type();
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return arg == null ? Collections.emptyList() : List.of(arg);
  }

  public Class<?> getDomainType()
  {
    return arg.getGeneratedType() != null ? arg.getGeneratedType() : arg.type();
  }

  public FunctionMapping<D, R, F> getFunctionMapping()
  {
    assert expression.context
                  != null : expression
                            + " has no context by which to retrieve the functionMapping named "
                            + functionName
                            + " from";
    FunctionMapping<D, R, F> mapping = expression.context.getFunctionMapping(functionName);
    if (isSelfReferential(mapping))
    {
      mapping = registerSelfReferrentialFunctionMapping();
    }

    assert mapping != null : "FunctionMapping for " + functionName + " missing";
    return mapping;
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return integrateFunction(variable).div(arg.differentiate(variable)).simplify();
  }

  public Node<D, R, F> integrateFunction(VariableNode<D, R, F> variable)
  {
    if (isBuiltin())
    {
      return integrateBuiltinFunction();
    }
    else if (contextual)
    {
      return integrateContextualFunction(variable);
    }
    throw new UnsupportedOperationException("Cannot integrate function: " + functionName);
  }

  private Node<D, R, F> integrateBuiltinFunction()
  {
    switch (functionName)
    {
    case "θ":
      return arg.mul(arg.θ());
    case "δ":
      if (derivativeOrder > 0)
      {
        // Integration of δ(x) gives δ(x)
        return new FunctionNode<>(expression,
                                  functionName,
                                  arg,
                                  derivativeOrder - 1);
      }
      else
      {
        // Integration of δ(x) give the Heaviside step function θ(x)
        return arg.θ();
      }
    case "sqrt":
      return two().div(three()).mul(arg.pow(three().div(two())));
    case "sin":
      return arg.cos().neg();
    case "cos":
      return arg.sin();
    case "exp":
      return this;
    case "tan":
      return arg.cos().log().neg();
    case "sec":
      return arg.sec().add(arg.tan()).log();
    case "arcsin":
      return arg.mul(arg.arcsin()).sub(one().sub(arg.square()).sqrt());
    case "arctan":
      return arg.mul(arg.arctan()).sub(one().div(2).mul(one().add(arg.square()).log()));
    case "log":
      return mul(arg).sub(arg);
    default:
      Class<?> domainType = getDomainType();
      Class<?> coDomainType = type();
      if (doesBuiltinFunctionExist(functionName, isBitless(), domainType, coDomainType))
      {
        throw new UnsupportedOperationException("Integration not implemented for: " + functionName);
      }
      else
      {
        throw new UndefinedReferenceException(String.format("no such function named %s from %s to %s in %s",
                                                            functionName,
                                                            domainType,
                                                            coDomainType,
                                                            expression));
      }

    }
  }

  public boolean isBitless()
  {
    return bitlessFunctions.contains(functionName);
  }

  public boolean isBuiltin()
  {
    return !contextual;
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean isScalar()
  {
    return arg.isScalar();
  }

  public boolean isSelfReferential(FunctionMapping<D, R, F> mapping)
  {
    return mapping == null && functionName != null && expression.context != null;
  }

  private void loadFunctionReferenceOntoStack(MethodVisitor mv, FunctionMapping<D, R, F> mapping)
  {
    String functionFieldDescriptor = mapping.functionFieldDescriptor();

    if (Expression.traceNodes)
    {
      logger.debug("loadFunctionReferenceOntoStack(functionName={} functionFieldDescripton={})",
                   mapping.functionName,
                   functionFieldDescriptor);

    }
    expression.loadFieldOntoStack(loadThisOntoStack(mv), functionName, functionFieldDescriptor);
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
                                                             expression.getExpression());
    expression.registerReferencedFunction(functionName, mapping);
    return mapping;
  }

  /**
   * This could use some refactoring to seperate the concerns
   * 
   * @param functionName
   * @return
   */
  public Class<?> resultTypeFor(String functionName)
  {
    if (arg == null)
    {
      return Object.class;
    }
    Class<? extends Object> argType       = arg.type();

    Class<?>                scalarArgType = Compiler.scalarType(arg.type());
    switch (functionName)
    {
    case "re":
    case "im":
      return Real.class;
    case "gamma":
    case "digamma":
    case "Γ":
    case "lnΓ":
    case "ϑ":
      return scalarArgType;
    case "sqrt":
      return Integer.class.equals(expression.coDomainType) ? Real.class
                                                           : Compiler.scalarType(expression.coDomainType);
    case "arg":
      return Real.class;
    case "ζ":
      return Complex.class;
    case "exp":
      return scalarArgType;
    }

    if (argType == null)
    {
      return expression.coDomainType;
    }
    else if (((argType.equals(Integer.class) || argType.equals(Fraction.class))
                  && integerFunctionsWithRealResults.contains(functionName))
                  || (argType.equals(Complex.class)
                                && complexFunctionsWithRealResults.contains(functionName)))
    {
      return Compiler.scalarType(expression.coDomainType);
    }
    else if (mapping != null && mapping.functionName.equals(functionName))
    {
      return mapping.coDomain;
    }
    else
    {
      return expression.coDomainType;
    }
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new FunctionNode<E, S, G>(newExpression,
                                     functionName,
                                     arg.spliceInto(newExpression),
                                     derivativeOrder);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> replacement)
  {
    if (arg != null)
    {
      arg = arg.substitute(variable, replacement);
    }

    if (variable.equals(functionName))
    {
      Node<D, R, F>         body               = (Node<D, R, F>) replacement;

      Expression<?, ?, ?>   definingExpression = mapping != null ? mapping.expression : null;
      VariableNode<?, ?, ?> formalParam        = definingExpression
                    != null ? definingExpression.independentVariable : null;

      if (formalParam != null && arg != null)
      {
        body = body.substitute(formalParam.reference.name, arg);
      }

      body.isResult = this.isResult;
      return body;
    }

    return this;
  }

  @Override
  public char symbol()
  {
    return "sqrt".equals(functionName) ? '√' : "exp".equals(functionName) ? 'e' : 'f';
  }

  @Override
  public String toString()
  {
//    if (mapping != null && mapping.expressionString != null)
//    {
//      return mapping.expressionString;
//    }
    if ("factorial".equals(functionName))
    {
      return String.format("(%s)!", arg.toStringWithoutIndependentVariableSpecified());
    }
    String str = String.format("%s(%s)", functionName, arg)
                 .replaceAll("sqrt", "√")
                 .replaceAll("J0", "J₀");
    return str;
  }

  @Override
  public Class<?> type()
  {
    return isBuiltin() ? resultTypeFor(functionName) : mapping.coDomain;
  }

  @Override
  public String typeset()
  {
    if ("abs".equals(functionName))
    {
      return String.format("|%s|", arg.typeset());
    }

    String name        = functionName.replaceAll("√", "sqrt")
                                     .replaceAll("J0", "J_0")
                                     .replaceAll("ζ", "zeta");

    String baseTypeset = format(name.equals("sqrt") ? "\\%s{%s}" : "\\%s(%s)",
                                name,
                                arg == null ? "" : arg.typeset());

    if (derivativeOrder == 0)
    {
      return baseTypeset;
    }
    else if (derivativeOrder <= 3)
    {
      String primes = "'".repeat(derivativeOrder);
      return baseTypeset.replace("(", primes + "(");
    }
    else
    {
      return baseTypeset.replace("(", "^{(" + derivativeOrder + ")}(");
    }
  }

  public boolean isExponential()
  {
    return functionName.equals("exp");
  }

  public boolean is(String string)
  {
    return functionName.equals(string);
  }

  public boolean isDeltaFunction()
  {
    return is("δ");
  }

  public int getDerivativeOrder()
  {
    return derivativeOrder;
  }

}
