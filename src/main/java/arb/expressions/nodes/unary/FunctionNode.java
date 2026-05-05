package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.lang.reflect.Method;
import java.util.*;
import java.util.function.Consumer;

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

  @Override
  public boolean hasClosedFormFractionalDerivative(VariableNode<D, R, F> variable)
  {
    return "sin".equals(functionName) || "cos".equals(functionName) || "exp".equals(functionName);
  }

  @Override
  public Node<D, R, F> fractionalDerivative(VariableNode<D, R, F> variable, Node<D, R, F> α)
  {
    var t = variable != null ? variable : expression.getIndependentVariable();

    switch (functionName)
    {
    case "sin":
      // Đ^(α) sin(t) = t^(1-α) · E(2, 2-α, -t²)
      var oneMinusAlpha = one().sub(α);
      var twoMinusAlpha = two().sub(α);
      var negTSquared = t.pow(2).neg();
      return t.pow(oneMinusAlpha)
              .mul(new MittagLefflerFunctionNode<>(expression,
                                                   two(),
                                                   twoMinusAlpha,
                                                   negTSquared));

    case "cos":
      // Đ^(α) cos(t) = t^(-α) · E(2, 1-α, -t²)
      var negAlpha = α.neg();
      var oneMinusAlphaCos = one().sub(α);
      var negTSquaredCos = t.pow(2).neg();
      return t.pow(negAlpha)
              .mul(new MittagLefflerFunctionNode<>(expression,
                                                   two(),
                                                   oneMinusAlphaCos,
                                                   negTSquaredCos));

    case "exp":
      // Đ^(α) exp(t) = t^(1-α) · E(1, 2-α, t)
      return t.pow(one().sub(α))
              .mul(new MittagLefflerFunctionNode<>(expression,
                                                   one(),
                                                   two().sub(α),
                                                   t));

    default:
      return super.fractionalDerivative(variable, α);
    }
  }

  @Override
  public boolean hasClosedFormFractionalIntegral(VariableNode<D, R, F> variable)
  {
    return "sin".equals(functionName) || "cos".equals(functionName) || "exp".equals(functionName);
  }

  @Override
  public Node<D, R, F> fractionalIntegral(VariableNode<D, R, F> variable, Node<D, R, F> μ)
  {
    var t = variable != null ? variable : expression.getIndependentVariable();

    switch (functionName)
    {
    case "sin":
      // I^(μ) sin(t) = t^(μ+1) · E(2, μ+2, −t²)
      var muPlusOne_sin   = μ.add(one());
      var muPlusTwo_sin   = μ.add(two());
      var negTSq_sin      = t.pow(2).neg();
      return t.pow(muPlusOne_sin)
              .mul(new MittagLefflerFunctionNode<>(expression,
                                                   two(),
                                                   muPlusTwo_sin,
                                                   negTSq_sin));

    case "cos":
      // I^(μ) cos(t) = t^μ · E(2, μ+1, −t²)
      var muPlusOne_cos = μ.add(one());
      var negTSq_cos    = t.pow(2).neg();
      return t.pow(μ)
              .mul(new MittagLefflerFunctionNode<>(expression,
                                                   two(),
                                                   muPlusOne_cos,
                                                   negTSq_cos));

    case "exp":
      // I^(μ) exp(t) = t^μ · E(1, μ+1, t)
      return t.pow(μ)
              .mul(new MittagLefflerFunctionNode<>(expression,
                                                   one(),
                                                   μ.add(one()),
                                                   t));

    default:
      return super.fractionalIntegral(variable, μ);
    }
  }

  @Override
  public <T extends Field<T>> T evaluate(Class<T> resultType, int bits, T result)
  {
    if (result == null)
    {
      result = Utensils.newInstance(resultType);
    }
    Class<T> argType = (Class<T>) arg.type();
    T        argVal  = arg.evaluate(argType, bits, Utensils.newInstance(argType));
    Method   method  = getFunctionMethod(isBitless(), argType, resultType);

    try
    {
      T evaluatedResult = (T) method.invoke(argVal, bits, result);

      return evaluatedResult;
    }
    catch (Throwable e)
    {
      throw new RuntimeException(toString() + " in " + expression,
                                 e);
    }

  }

  public Method getFunctionMethod(boolean bitless, Class<?> domain)
  {
    return getFunctionMethod(bitless, domain, domain);
  }

  public Method getFunctionMethod(boolean bitless, Class<?> domain, Class<?> coDomain)
  {
    try
    {
      return bitless ? domain.getMethod(functionName, coDomain) : domain.getMethod(functionName, int.class, coDomain);
    }
    catch (NoSuchMethodException e)
    {
      Utensils.wrapOrThrow(e);
      return null;
    }
  }

  @Override
  public boolean isZero()
  {
    return false;
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

    if (isSquareRoot())
    {
      if (arg.isOne())
      {
        return one();
      }
    }

    return simplifyExponential(this);
  }

  @Override
  public Node<D, R, F> replaceConstantNodes()
  {
    if (arg == null)
    {
      // Some FunctionNode instances (eg. context-lookup binom) carry no
      // argument subtree; their constancy cannot be evaluated here and
      // they are already single-instruction invocations at runtime, so
      // there is nothing to hoist.
      return this;
    }
    // If the whole function call is constant, wrap it as a single
    // StaticNode instead of recursing into {@code arg} and wrapping its
    // constant sub-subtrees individually. This avoids nested StaticNodes
    // (StaticNode whose delegate is a FunctionNode whose arg is itself a
    // StaticNode), which the fixed-point hoisting loop relies on to
    // produce one composite cached field per maximal constant subtree.
    if (!isRootNode && isConstant())
    {
      return super.replaceConstantNodes();
    }
    arg = arg.replaceConstantNodes();
    return super.replaceConstantNodes();
  }

  protected static <D, R, F extends Function<? extends D, ? extends R>> Node<D, R, F> simplifyExponential(Node<D, R, F> node)
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

  public FunctionNode(Expression<D, R, F> expression, FunctionMapping<?, ?, ?> mapping, Node<D, R, F> arg)
  {
    this(mapping.functionName,
         arg,
         expression);
    this.mapping = mapping;
  }

  /**
   * Constructor with derivative order support for special functions.
   */
  public FunctionNode(Expression<D, R, F> expression, String functionName, Node<D, R, F> argument, int derivativeOrder)
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
      return super.equals(obj) && Objects.equals(functionName, other.functionName) && derivativeOrder == other.derivativeOrder;
    }
    return false;

  }

  static final HashSet<String>  bitlessFunctions                = new HashSet<>();

  public static HashSet<String> complexFunctionsWithRealResults = new HashSet<>(Arrays.asList("arg", "re", "im", "real", "imag"));

  public static HashSet<String> integerFunctionsWithRealResults = new HashSet<>(Arrays.asList("sqrt", "tanh", "log"));

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
        return variableExpression.getIndependentVariable();
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
    if (this.expression.getContext() != null)
    {
      lookupFunctionInContext();
    }
    if (generatedType == null )
    {
      generatedType = resultTypeFor(this.functionName);
    }
    if (functionName != null && functionName.equals(expression.functionName))
    {
      expression.recursive = true;
      logger.debug("FunctionNode<init> self-test: functionName={} expression=#{} expression.context=#{} mappingAfterLookup=#{} contextual={}",
                functionName,
                System.identityHashCode(expression),
                System.identityHashCode(expression.getContext()),
                System.identityHashCode(mapping),
                contextual);
      designateAsRecursiveFunction(type());
    }

  }

  public void lookupFunctionInContext()
  {
    mapping    = expression.getContext().getFunctionMapping(functionName);
    contextual = mapping != null;
    logger.debug("lookupFunctionInContext: functionName={} expression=#{} expression.context=#{} contextEntries={} mappingFound=#{}",
              functionName,
              System.identityHashCode(expression),
              System.identityHashCode(expression.getContext()),
              expression.getContext().functions.keySet(),
              System.identityHashCode(mapping));
    if (contextual)
    {
      expression.registerReferencedFunction(functionName, mapping);
      // Propagate the registration up the upstream-expression chain so every
      // ancestor user-facing class also declares a field for this context
      // function. Without this, a context function referenced only inside
      // an inner operand expression (e.g. `He` inside Σi➔...{i=0…j} on the
      // top-level Δ-sequence) is invisible to the parent: the parent class
      // declares no field, Context.injectFunctionReferences has nothing to
      // populate, propagateContextFunctionReferences emits no PUTFIELD when
      // constructing the inner functional, and Phase-2 wire-all has nothing
      // to copy onto the operand. All ancestors share the same Context, so
      // registering the same mapping on each is consistent; the resulting
      // PUTFIELDs are pure compile-time wiring (issue #1000 point #3).
      // Propagate to every ancestor: a context function referenced only inside
      // an inner operand expression must also become a field on every ancestor
      // class so Phase-2 wire-all can copy this.<f> through to peer.<inner>.<f>
      // and operandF inherits the parent's reference identity. This applies
      // both to hand-wired Context instances (mapping.expression == null, e.g.
      // `He`) and to compiled peers (mapping.expression != null, e.g. `a` and
      // `S` inside the Müntz cluster). The structural-cycle detector that
      // previously rejected the latter case has been removed (Issue #1005), so
      // the propagation no longer triggers a phantom cycle rejection.
      arb.expressions.Expression<?, ?, ?> ancestor = expression.upstreamExpression;
      while (ancestor != null)
      {
        ancestor.registerReferencedFunction(functionName, mapping);
        ancestor = ancestor.upstreamExpression;
      }
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

  @Override
  public void replaceChild(Node<D, R, F> oldChild, Node<D, R, F> newChild)
  {
    if (arg == oldChild)
    {
      arg             = newChild;
      newChild.parent = this;
      oldChild.parent = null;
    }
    else
    {
      throw new IllegalArgumentException(oldChild + " is not a child of " + this);
    }
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

  public boolean isArgumentTypeConversionNeed(FunctionMapping<D, R, F> functionMapping, boolean isNullaryFunction)
  {
    return arg != null && !functionMapping.domain.equals(arg.getGeneratedType()) && !isNullaryFunction;
  }

  private void checkForUndefinedReferenced(FunctionMapping<D, R, F> mapping)
  {
    if (mapping.instance == null && mapping.functionClass == null)
    {
      throw new IllegalArgumentException(String.format("Undefined reference to function %s", mapping));
    }
  }

  private void designateAsRecursiveFunction(Class<?> resultType)
  {
    contextual = true;
    if (generatedType == null)
    {
      generatedType = resultType;
    }
    if ( mapping == null )
    {
    mapping = registerSelfReferrentialFunctionMapping();
    }
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
      return derivativeOrder == 0 ? zero()
                                  : new FunctionNode<>(expression,
                                                       functionName,
                                                       arg,
                                                       derivativeOrder + 1);

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
    {
      boolean isComplex = Complex.class.equals(scalarType(expression.coDomainType));
      JetState state    = new JetState("ζ", arg.toString(), isComplex);
      state.updateMax(1);
      return new ZetaJetNode<>(expression, arg, 1, state);
    }
    default:
      if (expression.getContext() != null)
      {
        FunctionMapping<?, ?, ?> ctxMapping = expression.getContext().getFunctionMapping(functionName);
        if (ctxMapping != null && ctxMapping.expression != null)
        {
          contextual = true;
          mapping    = ctxMapping;
          return differentiateBodyOf(ctxMapping);
        }
      }
      throw new UnsupportedOperationException("Derivative not implemented for builtin function: "
                                              + functionName
                                              + " in expression '"
                                              + expression
                                              + "'. Register the function in the context with a name prefix "
                                              + "(e.g. \"P:v->...\" instead of \"v->...\") so it can be differentiated symbolically.");
    }
  }

  public Node<D, R, F> arcsinDerivative()
  {
    return one().div(one().sub(arg.pow(2)).sqrt());
  }

  /**
   * Splices a function mapping's expression body into the current expression and
   * differentiates it symbolically. If the function was defined with a different
   * independent variable name (e.g. P:v->... used inside an expression with
   * independent variable t), substitutes the function's variable with our own
   * before differentiating to avoid UndefinedReferenceException.
   */
  @SuppressWarnings("unchecked")
  private Node<D, R, F> differentiateBodyOf(FunctionMapping<?, ?, ?> functionMapping)
  {
    Node<D, R, F>            body       = (Node<D, R, F>) functionMapping.expression.rootNode.spliceInto(expression);
    VariableNode<D, R, F>    ourIndep   = expression.getIndependentVariable();
    VariableNode<?, ?, ?>    fnIndep    = functionMapping.expression.getIndependentVariable();
    if (fnIndep != null && ourIndep != null && !fnIndep.getName().equals(ourIndep.getName()))
    {
      body = body.substitute(fnIndep.getName(), ourIndep);
    }
    return body.derivative().simplify();
  }

  private Node<D, R, F> differentiateContextualFunction()
  {
    var functionMapping = expression.getContext().getFunctionMapping(functionName);

    if (functionMapping == null)
    {
      throw new CompilerException(String.format("function named %s was not found in context.functions", functionName));
    }

    var instance = functionMapping.instance;

    if (instance == null)
    {
      if (functionMapping.expression != null)
      {
        return differentiateBodyOf(functionMapping);
      }
      return new DerivativeNode<>(expression,
                                  this);
    }

    setFunctionContext(instance);

    Function<?, ?> derivative = null;
    try
    {
      derivative = instance.derivative();
    }
    catch (UnsupportedOperationException | AssertionError ignored)
    {
      // instance.derivative() is not implemented for this compiled function.
      // Fall back to symbolic differentiation of the expression body below.
    }

    if (derivative == null)
    {
      // Fall back to symbolic differentiation of the expression body.
      if (functionMapping.expression != null)
      {
        return differentiateBodyOf(functionMapping);
      }
      return new DerivativeNode<>(expression,
                                  this);
    }

    String derivativeFunctionName = derivative.getName();
    assert derivativeFunctionName != null : "derivativeFunctionName is null for instance " + instance + ": TODO: use the " + derivative + " directly";

    var newDerivativeFunctionMapping = expression.getContext().functions.get(derivativeFunctionName);

    assert newDerivativeFunctionMapping
                  != null : "no function mapping with name " + derivativeFunctionName + " for derivative " + derivative + " of " + instance;

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
        if (expression.getContext() != instanceContext)
        {
          expression.getContext().mergeFrom(instanceContext);
        }
      }
      instanceContextField.set(instance, expression.getContext());

    }
    catch (Exception e)
    {
      Utensils.wrapOrThrow(e);
    }
  }

  protected static final Logger logger = LoggerFactory.getLogger(FunctionNode.class);

  @SuppressWarnings("unchecked")
  private Node<D, R, F> integrateContextualFunction(VariableNode<D, R, F> variable)
  {
    if (Expression.traceNodes)
    {
      logger.debug("integrateContextualFunction(): functionName={}", functionName);
    }
    FunctionMapping functionMapping = expression.getContext().getFunctionMapping(functionName);

    if (functionMapping == null)
    {
      throw new CompilerException(String.format("function named %s was not found in context.functions", functionName));
    }
    var instance = functionMapping.instance;
    if (instance == null)
    {
      if (functionMapping.expressionString == null)
      {
        throw new CompilerException(String.format("Instance for function %s was not present in %s", functionName, functionMapping));
      }
      else if (functionMapping.expression != null)
      {
        return functionMapping.expression.rootNode.spliceInto(expression).integral(variable);
      }
      else
      {
        var integrand = Function.parse(functionMapping.domain, functionMapping.coDomain, functionMapping.functionClass, functionMapping.expressionString);
        integrand.upstreamExpression = expression;
        return integrand.rootNode.integral(integrand.getIndependentVariable()).simplify();

//        throw new CompilerException(String.format("TODO: integrate parsed but yet-to-be-compiled expression string in expression '%s' where functionMapping='%s'",
//                                                  expression,functionMapping));

      }
    }

    var    integral                   = instance.integral();
    String integralFunctionName       = integral.getName();

    var    newIntegralFunctionMapping = expression.getContext().functions.get(integralFunctionName);
    if (functionMapping != null && Polynomial.class.isAssignableFrom(functionMapping.coDomain))
    {
      return new PolynomialIntegralNode<>(expression,
                                          this,
                                          arg);

    }
    assert newIntegralFunctionMapping != null : "newIntegralFunctionMapping is  null for " + integralFunctionName + " and functionMapping=" + functionMapping;
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
      logger.debug(String.format("generate(this=%s, arg=%s, resultType=%s)", this, arg, resultType));
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

  /**
   * Uses {@link Node#generateCastTo(MethodVisitor, Class)} if necessary after
   * calling this{@link #generateParameter(MethodVisitor, Class, boolean)}
   * 
   * @param mv
   * @param functionMapping
   */
  public void generateArgument(MethodVisitor mv, FunctionMapping<D, R, F> functionMapping)
  {
    boolean isNullaryFunction = Object.class.equals(functionMapping.domain);

    generateParameter(mv, (Class<? extends R>) functionMapping.domain, isNullaryFunction);

    if (isArgumentTypeConversionNeed(functionMapping, isNullaryFunction))
    {
      arg.generateCastTo(mv, functionMapping.domain);
    }
  }

  public MethodVisitor generateBuiltinFunctionCall(MethodVisitor methodVisitor, Class<?> requisiteResultType, boolean bitless)
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

    String functionDescriptor = Compiler.getFunctionDescriptor(bitless, coDomainType);

    if (Compiler.doesBuiltinFunctionExist(functionName, bitless, domainType, coDomainType))
    {

      methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL, Type.getInternalName(domainType), functionName, functionDescriptor, false);

      generatedType = requisiteResultType;
    }
    else
    {
      functionDescriptor = bitless ? Compiler.getMethodDescriptor(domainType, coDomainType) : Compiler.getMethodDescriptor(domainType, int.class, coDomainType);

      if (Compiler.doesBuiltinFunctionExist(functionName, bitless, domainType, coDomainType))
      {

        methodVisitor.visitMethodInsn(Opcodes.INVOKEVIRTUAL, Type.getInternalName(domainType), functionName, functionDescriptor, false);

        generatedType = requisiteResultType;
      }
      else
      {
        assert false : String.format("no such function named %s from %s to %s (expr=%s)", functionName, domainType, coDomainType, expression);
      }
    }
    return methodVisitor;
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

  private void generateParameter(MethodVisitor mv, Class<? extends R> argType, boolean isNullaryFunction)
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
    assert expression.getContext() != null : expression + " has no context by which to retrieve the functionMapping named " + functionName + " from";
    FunctionMapping<D, R, F> mapping = expression.getContext().getFunctionMapping(functionName);
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
    if (contextual)
    {
      return integrateContextualFunction(variable);
    }
    else if (isBuiltin())
    {
      return integrateBuiltinFunction();
    }
    else
      throw new UnsupportedOperationException("Cannot integrate function: "
                                              + functionName
                                              + " because its not a builtin function and its not registered in "
                                              + expression.getContext());
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
      if (Compiler.doesBuiltinFunctionExist(functionName, isBitless(), domainType, coDomainType))
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
  public boolean isAtomic()
  {
    return true;
  }

  /**
   * Defers to {@link Node#isEquivalentTo} (which compares {@code getClass()}
   * and {@code toString()}). Subclasses such as {@link LommelPolynomialNode}
   * and {@link SphericalBesselFunctionNodeOfTheFirstKind} override
   * {@code toString()} to render every structural child (index, order, arg),
   * so the rendered form already distinguishes e.g. {@code R(n,½;x)} from
   * {@code R(n-1,3/2;x)} and the CSE pass will not collapse them.
   * <p>
   * An earlier revision walked {@link #getBranches()} here, but
   * {@code getBranches()} is a tree-view affordance (populated for
   * {@link arb.expressions.nodes.Node.NodeTreeItem} / {@link TextTree} /
   * {@link ExpressionTree} rendering), not a programmatic traversal API:
   * several implementations flatten or reorder children and some
   * (e.g. {@link CachedNode}, {@link DerivativeNode}) delegate to another
   * node whose back-pointers form a cycle once sub-expressions are stitched
   * together, which made structural equality recurse indefinitely.
   */


  @Override
  public int depth()
  {
    return 1 + (arg == null ? 0 : arg.depth());
  }

  @Override
  public boolean isScalar()
  {
    return arg.isScalar();
  }

  public boolean isSelfReferential(FunctionMapping<D, R, F> mapping)
  {
    return mapping == null && functionName != null && expression.getContext() != null;
  }

  private void loadFunctionReferenceOntoStack(MethodVisitor mv, FunctionMapping<D, R, F> mapping)
  {
    String functionFieldDescriptor = mapping.functionFieldDescriptor();

    if (Expression.traceNodes)
    {
      logger.debug("loadFunctionReferenceOntoStack(functionName={} functionFieldDescripton={})", mapping.functionName, functionFieldDescriptor);

    }
    expression.loadFieldOntoStack(loadThisOntoStack(mv), functionName, functionFieldDescriptor);
  }

  public FunctionMapping<D, R, F> registerSelfReferrentialFunctionMapping()
  {
    logger.debug("registerSelfReferrentialFunctionMapping: functionName={} expression=#{} expression.context=#{} contextEntries={}",
              functionName,
              System.identityHashCode(expression),
              System.identityHashCode(expression.getContext()),
              expression.getContext() == null ? "null" : expression.getContext().functions.keySet());
    var mapping = expression.getContext().registerFunctionMapping(functionName,
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
    Class<? extends Object> argType = arg.type();
    assert argType != null : "argType is null for arg " + arg + " of " + this + " in " + expression.toStringExtended() + " context=" + expression.getContext();

    Class<?> scalarArgType = Compiler.scalarType(arg.type());
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
      return Integer.class.equals(expression.coDomainType) ? Real.class : Compiler.scalarType(expression.coDomainType);
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
    else if (((argType.equals(Integer.class) || argType.equals(Fraction.class)) && integerFunctionsWithRealResults.contains(functionName))
                  || (argType.equals(Complex.class) && complexFunctionsWithRealResults.contains(functionName)))
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
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    assert arg != null : "arg is null";
    return new FunctionNode<E, S, G>(newExpression,
                                     functionName,
                                     arg.spliceInto(newExpression),
                                     derivativeOrder);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> replacement)
  {
    if (arg != null)
    {
      arg = arg.substitute(variable, replacement);
    }

    if (variable.equals(functionName))
    {
      Node<D, R, F>         body               = (Node<D, R, F>) replacement;

      Expression<?, ?, ?>   definingExpression = mapping != null ? mapping.expression : null;
      VariableNode<?, ?, ?> formalParam        = definingExpression != null ? definingExpression.getIndependentVariable() : null;

      if (formalParam != null && arg != null)
      {
        body = body.substitute(formalParam.reference.name, arg);
      }

      body.isRootNode = this.isRootNode;
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
    if ("factorial".equals(functionName))
    {
      return String.format("(%s)!", arg == null ? "" : arg);
    }
    if ("floor".equals(functionName))
    {
      return String.format("⌊%s⌋", arg == null ? "" : arg);
    }
    if ("ceil".equals(functionName))
    {
      return String.format("⌈%s⌉", arg == null ? "" : arg);
    }
    return String.format("%s(%s)", functionName, arg == null ? "" : arg).replaceAll("sqrt", "√").replaceAll("J0", "J₀");
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

    if ("floor".equals(functionName))
    {
      String floorTypeset = String.format("\\left\\lfloor %s \\right\\rfloor", arg == null ? "" : arg.typeset());
      if (derivativeOrder == 0)
      {
        return floorTypeset;
      }
      else if (derivativeOrder <= 3)
      {
        return floorTypeset + "'".repeat(derivativeOrder);
      }
      else
      {
        return floorTypeset + "^{(" + derivativeOrder + ")}";
      }
    }

    if ("ceil".equals(functionName))
    {
      String ceilTypeset = String.format("\\left\\lceil %s \\right\\rceil", arg == null ? "" : arg.typeset());
      if (derivativeOrder == 0)
      {
        return ceilTypeset;
      }
      else if (derivativeOrder <= 3)
      {
        return ceilTypeset + "'".repeat(derivativeOrder);
      }
      else
      {
        return ceilTypeset + "^{(" + derivativeOrder + ")}";
      }
    }

    String name           = functionName.replaceAll("√", "sqrt").replaceAll("J0", "J_0").replaceAll("ζ", "zeta");

    String argTypeset     = arg == null ? "" : arg.typeset();

    String derivativeMark = derivativeOrder == 0 ? ""
                          : derivativeOrder <= 3 ? "'".repeat(derivativeOrder)
                          : "^{(" + derivativeOrder + ")}";

    if (name.equals("sqrt"))
    {
      return format("\\%s{%s}%s", name, argTypeset, derivativeMark);
    }

    return format("\\%s%s\\left(%s\\right)", name, derivativeMark, argTypeset);
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

  @Override
  public boolean isProvablyNonNegative()
  {
    return is("exp");
  }

}
