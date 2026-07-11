package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;

import java.lang.reflect.Modifier;
import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.*;

import arb.ComplexPolynomial;
import arb.Polynomial;
import arb.RealPolynomial;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.functions.Function;

/**
 * Represents application of arguments to an expression that evaluates to a
 * {@link Function}. Used for cases like P(3)(0.75) where P(3) returns a type
 * that implements the {@link Function} interface such as {@link RealPolynomial}
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FunctionalEvaluationNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                     UnaryOperationNode<D, C, F>
{

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    return functionNode.dependsOn(variable) || arg.dependsOn(variable);
  }

  @Override
  public String toString()
  {
    return String.format("%s(%s)", functionNode, arg);
  }

  /**
   * UnaryOperationNode.equals only compares {@code arg}. For a function
   * application {@code f(x)} we must also distinguish on which function is
   * being applied, otherwise downstream simplifications (notably
   * DivisionNode's {@code left.equals(right) → 1} fold) collapse
   * {@code p1(M)(z) / p2(M)(z)} to a literal {@code 1}.
   */
  @Override
  public boolean equals(Object obj)
  {
    if (this == obj) return true;
    if (!(obj instanceof FunctionalEvaluationNode<?, ?, ?> other)) return false;
    return java.util.Objects.equals(functionNode, other.functionNode)
        && java.util.Objects.equals(arg, other.arg);
  }

  private Node<D, C, F> functionNode;

  public Node<D, C, F> getFunctionNode()
  {
    return functionNode;
  }

  public FunctionalEvaluationNode(Expression<D, C, F> expression, Node<D, C, F> functionNode)
  {
    super(expression,
          resolveArgWithFunctionalDomain(expression, functionNode));
    expression.require(')');
    this.functionNode   = functionNode;
    functionNode.parent = this;
  }

  /**
   * When the function node's type is a reified functional (e.g. RealPolynomial),
   * its argument is an evaluation-point variable (e.g. x in P(3)(x)). If the
   * enclosing expression is nullary, promote its domainType to the scalar type of
   * the functional so that the argument variable can be resolved as an
   * independent variable. The promotion persists so that downstream code (e.g.
   * IntegralNode.parseFunctionForm) finds the independent variable already
   * assigned.
   */
  @SuppressWarnings("unchecked")
  private static <D, C, F extends Function<? extends D, ? extends C>> Node<D, C, F> resolveArgWithFunctionalDomain(Expression<D, C, F> expression,
                                                                                                                   Node<D, C, F> functionNode)
  {
    promoteDomainToScalarOfReifiedFunctional(expression, functionNode);
    return expression.resolve();
  }

  /**
   * When the function node's type is a reified functional (e.g.
   * {@code RealPolynomial}) and the enclosing expression is nullary, promote the
   * enclosing expression's {@code domainType} to the scalar type of the
   * functional so that the argument variable resolves as an independent variable.
   * Idempotent.
   */
  @SuppressWarnings("unchecked")
  public static <D, C, F extends Function<? extends D, ? extends C>> void promoteDomainToScalarOfReifiedFunctional(Expression<D, C, F> expression,
                                                                                                                   Node<D, C, F> functionNode)
  {
    Class<?> fnType = functionNode.type();
    if (expression.isNullaryFunction() && Function.class.isAssignableFrom(fnType) && !fnType.isInterface()
                  && !Modifier.isAbstract(fnType.getModifiers()))
    {
      expression.domainType = (Class<? extends D>) Compiler.scalarType(fnType);
    }
  }

  public FunctionalEvaluationNode(Expression<D, C, F> expression, Node<D, C, F> functionNode, Node<D, C, F> argNode)
  {
    super(expression,
          argNode);
    this.functionNode   = functionNode;
    functionNode.parent = this;
  }

  /**
   * A polynomial function evaluated at the integration variable is
   * polynomial-like in that variable, since P(t) = Σ aₖtᵏ is a polynomial in t by
   * definition.
   */
  @Override
  public boolean isPolynomialLike(VariableNode<D, C, F> variable)
  {
    if (Polynomial.class.isAssignableFrom(functionNode.type()) && arg.equals(variable))
    {
      return true;
    }
    return super.isPolynomialLike(variable);
  }

  /**
   * A function application f(x) cannot be determined to be zero at compile time;
   * this is a runtime value.
   */
  @Override
  public boolean isZero()
  {
    return false;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Class<?> functionType = functionNode.type();
    Class<?> argType      = arg.type();

    if (Expression.trace)
    {
      logger.debug("generate(resultType={}) functionNode={} arg={} functionType={} argType={}",
                   resultType, functionNode, arg, functionType, argType);
    }

    // Polynomial composition: when both the function and its argument are the
    // same polynomial type (RealPolynomial(RealPolynomial) or
    // ComplexPolynomial(ComplexPolynomial)), the operation is composition
    // p ∘ q = p evaluated with q substituted for p's variable. The native
    // backings are arb_poly_compose / acb_poly_compose, exposed as the typed
    // overload evaluate(<PolyType>, int, int, <PolyType>) on each polynomial
    // class. Emit a directly-typed INVOKEVIRTUAL against that overload so the
    // call bypasses the erased Function.evaluate(Object,int,int,Object)
    // bridge (which casts to the scalar codomain and would ClassCast).
    //

    // Only fire the compose path when ALL THREE of (receiver, argument,
    // result) agree on the polynomial type. If the surrounding expression
    // expects a scalar (e.g. p(v) where v is the polynomial's own variable),
    // resultType will be the scalar type and we must NOT emit compose —
    // fall through to the scalar evaluate path.
    if (Polynomial.class.isAssignableFrom(functionType) && functionType.equals(argType)
        && functionType.equals(resultType) && hasTypedComposeOverload(functionType))
    {
      functionNode.generate(mv, functionType);
      arg.generate(mv, argType);
      loadOrderParameter(mv);
      loadBitsParameterOntoStack(mv);
      loadOutputVariableOntoStack(mv, resultType);

      String composeDescriptor = Type.getMethodDescriptor(Type.getType(functionType),
                                                          Type.getType(argType),
                                                          Type.INT_TYPE,
                                                          Type.INT_TYPE,
                                                          Type.getType(functionType));
      mv.visitMethodInsn(Opcodes.INVOKEVIRTUAL,
                         Type.getInternalName(functionType),
                         "evaluate",
                         composeDescriptor,
                         false);

      if (!resultType.equals(functionType) && !resultType.equals(Object.class))
      {
        cast(mv, resultType);
      }
      return mv;
    }

    functionNode.generate(mv, functionType);
    // Arg target type = function's declared domain, NOT the surrounding
    // resultType. For curried sequences whose domain and codomain differ
    // (e.g. ComplexPolynomialSequence: Integer → ComplexPolynomial), routing
    // arg through resultType allocates a ComplexPolynomial temp for what
    // should be Integer and the codegen emits Integer.add(Integer, int,
    // ComplexPolynomial) which doesn't exist.
    Class<?> argTargetType;
    try
    {
      argTargetType = Expression.resolveChildDomain(functionType);
    }
    catch (UnsupportedOperationException uoe)
    {
      argTargetType = resultType;
    }
    arg.generate(mv, argTargetType);

    loadOrderParameter(mv);
    loadBitsParameterOntoStack(mv);

    // Output-buffer target = function's declared codomain, NOT the surrounding
    // resultType. The called function's evaluate(…, Object result) cast its
    // 4th arg to the codomain it actually returns; passing a wider buffer
    // (e.g. ComplexPolynomial when the function returns Complex) trips a
    // ClassCastException inside the callee. If they differ, allocate a
    // codomain-typed buffer and promote to resultType after the call.
    Class<?> callCoDomain;
    try
    {
      callCoDomain = Expression.resolveChildCoDomain(functionType);
    }
    catch (UnsupportedOperationException uoe)
    {
      callCoDomain = resultType;
    }
    boolean needsPromotion = !callCoDomain.equals(resultType)
                          && !resultType.equals(Object.class)
                          && !callCoDomain.equals(Object.class);

    loadOutputVariableOntoStack(mv, needsPromotion ? callCoDomain : resultType);

    mv.visitMethodInsn(functionType.isInterface() ? Opcodes.INVOKEINTERFACE : Opcodes.INVOKEVIRTUAL,
                       Type.getInternalName(functionType),
                       "evaluate",
                       Compiler.evaluationMethodDescriptor,
                       functionType.isInterface());

    if (needsPromotion)
    {
      // Stack: [..., callResult]. Promote via resultBuffer.set(callResult).
      cast(mv, callCoDomain);
      // For a root-positioned call whose surrounding expression's result slot
      // is of resultType, promote directly into `result` instead of allocating
      // a fresh intermediate. Otherwise the case body of a WhenNode (e.g. Pn
      // for n=1 returning `hv(0)`) writes the promoted polynomial into a temp
      // and the outer `result` slot stays at its incoming (zero) value.
      if (isRootNode && resultType.isAssignableFrom(expression.coDomainType))
      {
        loadResultParameter(mv);
        cast(mv, resultType);
      }
      else
      {
        expression.allocateIntermediateVariable(mv, resultType);
      }
      // Stack: [..., callResult, resultBuf]. swap, invoke resultBuf.set(callResult).
      mv.visitInsn(Opcodes.SWAP);
      Compiler.generateVirtualMethodInvocation(mv, resultType, "set", resultType, callCoDomain);
    }
    else if (!resultType.equals(Object.class))
    {
      cast(mv, resultType);
    }

    return mv;
  }

  /**
   * Whether {@code polyType} declares the typed composition overload
   * {@code evaluate(<polyType>, int, int, <polyType>)} that the
   * polynomial-on-polynomial code path emits an {@code INVOKEVIRTUAL}
   * against. Currently true for {@link ComplexPolynomial}; other polynomial
   * types fall through to the scalar dispatch until they expose the same
   * overload (backed by {@code arb_poly_compose} etc.).
   */
  private static boolean hasTypedComposeOverload(Class<?> polyType)
  {
    try
    {
      polyType.getMethod("evaluate", polyType, int.class, int.class, polyType);
      return true;
    }
    catch (NoSuchMethodException nsme)
    {
      return false;
    }
  }

  /**
   * https://github.com/crowlogic/arb4j/issues/871#issuecomment-3938119721
   */
  @Override
  public Class<?> type()
  {
    return Compiler.scalarType(functionNode.type());
  }

  @Override
  public List<Node<D, C, F>> getBranches()
  {
    return List.of(functionNode, arg);
  }

  @Override
  public String typeset()
  {
    return functionNode.typeset() + "\\left(" + arg.typeset() + "\\right)";
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new FunctionalEvaluationNode<E, S, G>(newExpression,
                                                 functionNode.spliceInto(newExpression),
                                                 arg.spliceInto(newExpression));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, C, F> substitute(String variable, Node<E, S, G> transformation)
  {
    functionNode = functionNode.substitute(variable, transformation);
    arg          = arg.substitute(variable, transformation);
    return this;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return functionNode.differentiate(variable);
  }

  @Override
  public Node<D, C, F> integral(VariableNode<D, C, F> variable)
  {

    if (Polynomial.class.isAssignableFrom(functionNode.type()) && arg.equals(variable))
    {
      return new PolynomialIntegralNode<>(expression,
                                          functionNode,
                                          arg).setIsResult(isRootNode);
    }

    return new FunctionalEvaluationNode<>(expression,
                                          functionNode.integral(variable),
                                          arg).setIsResult(isRootNode);
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return !expression.coDomainType.isArray();
  }

  @Override
  public char symbol()
  {
    return '@'; // Using @ to represent function application
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> t)
  {
    functionNode.accept(t);
    arg.accept(t);
  }

}
