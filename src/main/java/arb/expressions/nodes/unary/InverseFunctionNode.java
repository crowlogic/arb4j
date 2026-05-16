package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.loadOrderParameter;
import static arb.expressions.Compiler.loadThisOntoStack;

import java.util.*;
import java.util.function.Consumer;

import org.objectweb.asm.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Represents the compositional inverse f⁻¹ of a function f. This node is
 * produced when the parser encounters the ⁻¹ superscript <b>before</b> the
 * argument parenthesis, i.e. {@code f⁻¹(x)}, which denotes the compositional
 * inverse satisfying {@code f(f⁻¹(x)) = x}. This is distinct from
 * {@code f(x)⁻¹ = 1/f(x)} where ⁻¹ appears <b>after</b> the closing
 * parenthesis, which is handled by ordinary exponentiation to the power −1.
 * <p>
 * Evaluation uses Lagrange series reversion to compute f⁻¹. The forward
 * function's Taylor series is expanded, the constant term is zeroed, and the
 * series is reverted via {@code arb_poly_revert_series} (real) or
 * {@code acb_poly_revert_series} (complex). The resulting inverted function is
 * cached in a field of the generated class so the expensive reversion runs
 * once.
 * <p>
 * The derivative of the inverse function is computed analytically:
 * 
 * <pre>
 *   (f⁻¹)′(y) = 1 / f′(f⁻¹(y))
 * </pre>
 *
 * @param <D> domain type
 * @param <R> range type
 * @param <F> function type
 *
 * @see FunctionNode
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("unused")
public class InverseFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                UnaryOperationNode<D, R, F>
{

  private static final Logger logger               = LoggerFactory.getLogger(InverseFunctionNode.class);

  /**
   * The Unicode superscript inverse marker: ⁻¹ (U+207B U+00B9). The parser
   * detects this sequence immediately after a function identifier and before the
   * opening parenthesis to distinguish compositional inverse from multiplicative
   * inverse.
   */
  public static final String  INVERSE_MARKER       = "⁻¹";

  /**
   * Default number of terms in the Lagrange series reversion
   * 
   * FIXME: THIS SHOULD BE dynamic based on whatever bits of precision
   */
  public static final int     DEFAULT_SERIES_ORDER = 20;

  /**
   * The name of the forward function whose compositional inverse this node
   * represents.
   */
  public final String         forwardFunctionName;

  /**
   * The {@link FunctionMapping} for the forward function, resolved from the
   * expression's {@link arb.expressions.Context}. May be null for builtin
   * functions.
   */
  @SuppressWarnings("rawtypes")
  public FunctionMapping      forwardMapping;

  /**
   * Whether the forward function is a contextual (user-defined) function rather
   * than a builtin.
   */
  public boolean              contextual           = false;

  /**
   * Field name in the generated class for the cached inverted function (type is
   * the function interface, e.g. RealFunction or ComplexFunction). Initially
   * null; populated on first evaluate() call.
   */
  private String              invertedFunctionFieldName;

  /**
   * Constructs an InverseFunctionNode for the compositional inverse of the named
   * forward function applied to the given argument.
   *
   * @param forwardFunctionName the name of the function to invert (e.g. "f",
   *                            "sin", "Φ")
   * @param argument            the argument node (the value at which to evaluate
   *                            f⁻¹)
   * @param expression          the containing expression
   */
  public InverseFunctionNode(String forwardFunctionName, Node<D, R, F> argument, Expression<D, R, F> expression)
  {
    super(expression,
          argument);
    assert forwardFunctionName != null : "forwardFunctionName must not be null";
    this.forwardFunctionName = forwardFunctionName;
    if (expression.getContext() != null)
    {
      forwardMapping = expression.getContext().getFunctionMapping(forwardFunctionName);
      contextual     = forwardMapping != null;
      if (contextual)
      {
        expression.registerReferencedFunction(forwardFunctionName, forwardMapping);
      }
    }
    generatedType                  = expression.coDomainType;

    // Allocate a field on the generated class for caching the inverted function.
    // The function interface type (e.g. RealFunction) is an interface, so
    // IntermediateVariable.generateInitializer() correctly skips the NEW call —
    // the field starts as null and is populated on first evaluate().
    // Null-check on this field serves as the initialization guard (no separate
    // boolean needed).
    this.invertedFunctionFieldName = expression.newIntermediateVariable("inv", expression.functionClass, true);
  }

  /**
   * Constructs an InverseFunctionNode from an existing {@link FunctionMapping}.
   *
   * @param expression the containing expression
   * @param mapping    the function mapping for the forward function
   * @param argument   the argument node
   */
  public InverseFunctionNode(Expression<D, R, F> expression, FunctionMapping<?, ?, ?> mapping, Node<D, R, F> argument)
  {
    this(mapping.functionName,
         argument,
         expression);
    this.forwardMapping = mapping;
    this.contextual     = true;
  }

  @Override
  public boolean isZero()
  {
    return false;
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return arg == null ? Collections.emptyList() : List.of(arg);
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

  /**
   * Differentiate the inverse function using the inverse function theorem:
   * 
   * <pre>
   *   d/dy f⁻¹(y) = 1 / f′(f⁻¹(y))
   * </pre>
   * 
   * By the chain rule, if the argument is not simply the independent variable:
   * 
   * <pre>
   *   d/dx f⁻¹(g(x)) = g′(x) / f′(f⁻¹(g(x)))
   * </pre>
   */
  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // f⁻¹(arg) applied: this node itself gives f⁻¹(arg)
    // f′ evaluated at f⁻¹(arg)
    var           fPrimeAtInverse   = new FunctionNode<>(expression,
                                                         forwardFunctionName,
                                                         this.spliceInto(expression),
                                                         1);

    // 1 / f′(f⁻¹(arg))
    var inverseDerivative = one().div(fPrimeAtInverse);

    // Chain rule: multiply by arg′ if arg depends on the variable
    if (arg.dependsOn(variable))
    {
      var argDerivative = arg.differentiate(variable);
      return argDerivative.mul(inverseDerivative).simplify();
    }

    return inverseDerivative.simplify();
  }

  /**
   * Integration of inverse functions uses integration by parts:
   * 
   * <pre>
   *   ∫ f⁻¹(y) dy = y·f⁻¹(y) − ∫ f(t) dt |_{t=f⁻¹(y)}
   * </pre>
   * 
   * This is stubbed for now; full implementation requires the antiderivative of
   * the forward function composed with the inverse.
   */
  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    // y·f⁻¹(y) − F(f⁻¹(y)) where F is the antiderivative of f
    // For initial support, delegate to numerical integration or throw
    throw new UnsupportedOperationException(String.format("Symbolic integration of %s⁻¹ is not yet implemented; " + "use numerical integration",
                                                          forwardFunctionName));
  }

  @Override
  public Node<D, R, F> simplify()
  {
    if (arg != null)
    {
      arg = arg.simplify();
    }
    // f⁻¹(f(x)) = x — detect and collapse if the argument is a FunctionNode
    // with the same forward function name
    if (arg instanceof FunctionNode)
    {
      FunctionNode<D, R, F> innerFunc = arg.asFunction();
      if (forwardFunctionName.equals(innerFunc.functionName) && innerFunc.getDerivativeOrder() == 0)
      {
        return innerFunc.arg;
      }
    }
    return this;
  }

  /**
   * Generates bytecode that computes f⁻¹(y) via Lagrange series reversion:
   *
   * <pre>
   * if (!invInit)
   * {
   *   inv = forwardFunc.invert(y, seriesOrder, bits);
   *   invInit = true;
   * }
   * result = inv.evaluate(y, order, bits, result);
   * </pre>
   *
   * The forward function's Taylor series is expanded at the first evaluation
   * point, the constant term is zeroed, and the series is reverted via
   * {@code arb_poly_revert_series}. The resulting inverted function is cached in
   * a field of the generated class so the expensive reversion runs once.
   */
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.traceNodes)
    {
      logger.debug("generate(this={}, arg={}, resultType={})", this, arg, resultType);
    }

    String   internalName          = expression.className().replace('.', '/');
    Class<?> functionInterfaceType = expression.functionClass;
    String   functionDescriptor    = functionInterfaceType.descriptorString();
    Class<?> domainType            = expression.domainType;

    // ---- Lazy initialization check ----
    // if (this.inv1 != null) goto alreadyInverted
    Label    alreadyInverted       = new Label();
    expression.loadFieldOntoStack(loadThisOntoStack(mv), invertedFunctionFieldName, functionDescriptor);
    mv.visitJumpInsn(Opcodes.IFNONNULL, alreadyInverted);

    // ---- Compute the inverted function (runs once) ----

    // Load forward function reference: this.<forwardFunctionName>
    if (contextual && forwardMapping != null)
    {
      expression.loadFieldOntoStack(loadThisOntoStack(mv), forwardFunctionName, forwardMapping.functionFieldDescriptor());
    }
    else
    {
      throw new UnsupportedOperationException(String.format("Inverse of non-contextual function '%s' is not supported; "
                                                            + "the function must be registered in the expression context",
                                                            forwardFunctionName));
    }

    // Load center point (the argument value y, used as expansion center)
    // Stack: [forwardFunc]
    arg.generate(mv, domainType);
    // Stack: [forwardFunc, centerPoint]

    // Load series order (default 20, matching HardyThetaInversion)
    mv.visitLdcInsn(DEFAULT_SERIES_ORDER);
    // Stack: [forwardFunc, centerPoint, 20]

    // Load precision (bits parameter from evaluate() signature, slot 3)
    loadBitsParameterOntoStack(mv);
    // Stack: [forwardFunc, centerPoint, 20, bits]

    // INVOKEINTERFACE functionInterfaceType.invert(domainType, int, int) →
    // functionInterfaceType
    mv.visitMethodInsn(Opcodes.INVOKEINTERFACE,
                       Type.getInternalName(functionInterfaceType),
                       "invert",
                       Compiler.getMethodDescriptor(functionInterfaceType, domainType, int.class, int.class),
                       true);
    // Stack: [invertedFunction]

    // Store into field: this.inv1 = invertedFunction
    loadThisOntoStack(mv);
    mv.visitInsn(Opcodes.SWAP);
    mv.visitFieldInsn(Opcodes.PUTFIELD, internalName, invertedFunctionFieldName, functionDescriptor);

    // ---- Evaluate the cached inverted function ----
    Compiler.designateLabel(mv, alreadyInverted);

    // Load this.inv1 (the cached inverted function)
    expression.loadFieldOntoStack(loadThisOntoStack(mv), invertedFunctionFieldName, functionDescriptor);
    // Stack: [invertedFunction]

    // Load argument (the target value y at which to evaluate f⁻¹)
    arg.generate(mv, domainType);
    // Stack: [invertedFunction, y]

    // Load order parameter (slot 2)
    loadOrderParameter(mv);
    // Stack: [invertedFunction, y, order]

    // Load bits parameter (slot 3)
    loadBitsParameterOntoStack(mv);
    // Stack: [invertedFunction, y, order, bits]

    // Load output variable
    loadOutputVariableOntoStack(mv, resultType);
    // Stack: [invertedFunction, y, order, bits, result]

    // INVOKEINTERFACE functionInterfaceType.evaluate(D, int, int, R) → R
    mv.visitMethodInsn(Opcodes.INVOKEINTERFACE, Type.getInternalName(functionInterfaceType), "evaluate", Compiler.evaluationMethodDescriptor, true);
    // Stack: [result]

    Compiler.cast(mv, resultType);
    generatedType = resultType;
    return mv;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return arg != null && arg.dependsOn(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new InverseFunctionNode<>(forwardFunctionName,
                                     arg.spliceInto(newExpression),
                                     newExpression);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> transformation)
  {
    arg = arg.substitute(variable, transformation);
    return this;
  }

  @Override
  public char symbol()
  {
    return '⁻';
  }

  @Override
  @SuppressWarnings("unchecked")
  public <C> Class<? extends C> type()
  {
    return (Class<? extends C>) (contextual && forwardMapping != null ? forwardMapping.domain : expression.coDomainType);
  }

  @Override
  public String toString()
  {
    return String.format("%s⁻¹(%s)", forwardFunctionName, arg == null ? "" : arg.toStringWithoutIndependentVariableSpecified());
  }

  @Override
  public String typeset()
  {
    return String.format("\\%s^{-1}(%s)", forwardFunctionName, arg == null ? "" : arg.typeset());
  }

  @Override
  public int hashCode()
  {
    return 31337 * super.hashCode() + Objects.hash(forwardFunctionName);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj instanceof InverseFunctionNode<?, ?, ?> other)
    {
      return super.equals(obj) && Objects.equals(forwardFunctionName, other.forwardFunctionName);
    }
    return false;
  }

}
