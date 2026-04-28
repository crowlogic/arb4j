package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.FunctionMapping;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.Function;

/**
 * Riemann–Liouville fractional integral with lower limit 0:
 *
 * <pre>
 * I^μ f(x) = (1/Γ(μ)) ∫₀ˣ (x−t)^(μ−1) f(t) dt,    μ &gt; 0
 * </pre>
 *
 * The default {@link Node#fractionalIntegral(VariableNode, Node)} wraps any
 * node in this class. Subclasses with closed-form rules (monomials, constants,
 * linearity, scalar multiples, semigroup chaining) override
 * {@code fractionalIntegral} to return the symbolic result directly without
 * ever constructing this integral form.
 *
 * Mirrors {@link CaputoFractionalDerivativeNode} structurally; the integrand
 * differs in two ways: the kernel exponent is (μ−1) rather than (−α), and the
 * inner expression integrates {@code f(t)} rather than {@code ∂f(t)/∂t}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiemannLiouvilleFractionalIntegralNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                                   Node<D, R, F>
{
  public static final Logger    logger = LoggerFactory.getLogger(RiemannLiouvilleFractionalIntegralNode.class);

  Node<D, R, F>                 order;
  Node<D, R, F>                 operand;
  Node<D, R, F>                 integralNode;
  Expression<D, R, F>           integralExpression;
  FunctionMapping<D, R, F>      gintMapping;
  public Node<D, R, F>          closedFormResult;
  private final Context         context;

  private VariableNode<D, R, F> variable;

  public RiemannLiouvilleFractionalIntegralNode(Expression<D, R, F> expression, Node<D, R, F> operand, VariableNode<D, R, F> variable, Node<D, R, F> order)
  {
    super(expression);
    assert operand != null : "operand is null";
    this.variable = variable;
    if (order == null)
    {
      order = variable.one();
    }
    this.order   = order;
    this.operand = operand;
    this.context = expression.getContext();

    operand.parent = this;
    if (variable != null)
    {
      variable.parent = this;
    }
    if (order != null)
    {
      order.parent = this;
    }

    this.operand = tryInlineOperandBody(this.operand);
    operand      = this.operand;

    if (operand.hasClosedFormFractionalIntegral(variable))
    {
      closedFormResult = operand.fractionalIntegral(variable, order);
      return;
    }

    init(operand);
  }

  protected void init(Node<D, R, F> operand)
  {
    FunctionMapping<D, R, F> operandFunctionMapping =
                                                   context.registerFunctionMapping("f",
                                                                                   expression.domainType,
                                                                                   expression.coDomainType,
                                                                                   expression.functionClass);

    VariableNode<D, R, F> diffVar = variable != null ? variable : expression.getIndependentVariable();

    operandFunctionMapping.expression = operand.asExpression(diffVar);

    boolean registeredMuTemporarily = false;
    if (!context.variables.containsKey("μ"))
    {
      context.registerVariable(arb.Real.named("μ")).setBounds(0, false, 1, true);
      registeredMuTemporarily = true;
    }

    integralExpression = Function.parseAndRegister("gint:x➔∫t➔((x-t)^(μ-1)*f(t))dt∈(0,x)/Γ(μ)",
                                                   context,
                                                   expression.domainType,
                                                   expression.coDomainType,
                                                   expression.functionClass,
                                                   null,
                                                   true);

    if (order instanceof VariableNode<D, R, F> orderVar && !"μ".equals(orderVar.getName()))
    {
      integralExpression.renameVariable("μ", orderVar.getName());
      if (registeredMuTemporarily)
      {
        context.variables.remove("μ");
      }
    }

    this.integralNode = integralExpression.rootNode;
    this.gintMapping  = context.functions.get("gint");
    expression.registerReferencedFunction("gint", gintMapping);
  }

  public RiemannLiouvilleFractionalIntegralNode(Expression<D, R, F> expression)
  {
    super(expression);
    this.context = expression.context;
    operand      = expression.resolve();
    var variableNode = expression.require(",").resolve();
    if (variableNode instanceof VariableNode)
    {
      variable = variableNode.asVariable();
      order    = variableNode.one();
    }
    else if (variableNode instanceof ExponentiationNode<D, R, F> expNode)
    {
      if (!expNode.left.isVariable())
      {
        throwFunctionSyntaxError();
      }
      else
      {
        variable = expNode.left.asVariable();
        order    = expNode.right;
      }
    }
    else
    {
      throwFunctionSyntaxError();
    }

    expression.require(")");

    this.operand = tryInlineOperandBody(this.operand);
    operand      = this.operand;

    if (operand.hasClosedFormFractionalIntegral(variable))
    {
      closedFormResult = operand.fractionalIntegral(variable, order);
      return;
    }

    init(operand);
  }

  protected void throwFunctionSyntaxError()
  {
    throw new CompilerException("the function syntax for Riemann–Liouville fractional integrals is fracint(f(t),t^μ) where μ is the order of integration");
  }

  /**
   * If the operand is a call to a user-defined function registered in the
   * current {@link Context}, and whose argument is a bare variable matching
   * the function's own independent variable, splice the function body
   * directly into this expression in place of the call. Same rationale as in
   * {@link CaputoFractionalDerivativeNode#tryInlineOperandBody}.
   */
  @SuppressWarnings("unchecked")
  protected Node<D, R, F> tryInlineOperandBody(Node<D, R, F> operand)
  {
    if (context == null)
    {
      return operand;
    }
    if (!(operand instanceof FunctionNode))
    {
      return operand;
    }
    FunctionNode<D, R, F>    fn      = (FunctionNode<D, R, F>) operand;
    FunctionMapping<D, R, F> mapping = context.getFunctionMapping(fn.functionName);
    if (mapping == null || mapping.expression == null)
    {
      return operand;
    }
    if (!(fn.arg instanceof VariableNode))
    {
      return operand;
    }
    VariableNode<D, R, F>  argVar  = fn.arg.asVariable();
    VariableNode<?, ?, ?>  fnIndep = mapping.expression.getIndependentVariable();
    if (fnIndep == null || !argVar.getName().equals(fnIndep.getName()))
    {
      return operand;
    }
    Node<D, R, F> inlined = (Node<D, R, F>) mapping.expression.rootNode.spliceInto(this.expression);
    inlined.parent = this;
    return inlined;
  }

  @Override
  public boolean isZero()
  {
    if (closedFormResult != null) return closedFormResult.isZero();
    return integralNode != null ? integralNode.isZero() : operand.isZero();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (closedFormResult != null)
    {
      return closedFormResult.generate(mv, resultType);
    }
    expression.loadFieldOntoStack(Compiler.loadThisOntoStack(mv), "gint", gintMapping.functionFieldDescriptor());
    VariableNode<D, R, F> indepVar = variable != null ? variable : expression.getIndependentVariable();
    indepVar.generate(mv, indepVar.type());
    Compiler.loadOrderParameter(mv);
    Compiler.loadBitsParameterOntoStack(mv);
    loadOutput(mv, resultType);
    gintMapping.call(mv, resultType);
    return mv;
  }

  @Override
  public boolean isAtomic()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return operand.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> arg)
  {
    order   = order.substitute(variable, arg);
    operand = operand.substitute(variable, arg);
    return this;
  }

  @Override
  public char symbol()
  {
    return 'I';
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    order.accept(t);
    operand.accept(t);
    if (integralNode != null)
    {
      integralNode.accept(t);
    }
    t.accept(this);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    if (closedFormResult != null) return closedFormResult.dependsOn(variable);
    return integralNode != null ? integralNode.dependsOn(variable) : order.dependsOn(variable) || operand.dependsOn(variable);
  }

  /**
   * d/dt I^μ f = I^(μ−1) f      (μ &gt; 1)
   * d/dt I^μ f = D^(1−μ) f      (μ ∈ (0, 1))
   *
   * The unified expression {@code operand.fractionalIntegral(variable,
   * order−1)} covers the μ &gt; 1 case directly, and for μ ∈ (0,1) the negative
   * order is interpreted as a fractional derivative by the operand-side
   * dispatch — so this returns the operand's fractional integral of order
   * (μ − 1), which is the formal inverse element in the Riemann–Liouville
   * semigroup.
   */
  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return operand.fractionalIntegral(this.variable, order.sub(expression.newLiteralConstant("1")));
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(order, operand);
  }

  /**
   * Semigroup: ∫ I^μ f dt = I^(μ+1) f.
   */
  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return operand.fractionalIntegral(this.variable, order.add(expression.newLiteralConstant("1")));
  }

  /**
   * Semigroup composition: I^ν ∘ I^μ = I^(μ+ν).
   */
  @Override
  public boolean hasClosedFormFractionalIntegral(VariableNode<D, R, F> variable)
  {
    return operand.hasClosedFormFractionalIntegral(variable);
  }

  @Override
  public Node<D, R, F> fractionalIntegral(VariableNode<D, R, F> variable, Node<D, R, F> ν)
  {
    return operand.fractionalIntegral(this.variable, order.add(ν));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    if (closedFormResult != null)
    {
      return closedFormResult.spliceInto(newExpression);
    }
    RiemannLiouvilleFractionalIntegralNode<E, S, G> splicedNode =
                                                                new RiemannLiouvilleFractionalIntegralNode<E, S, G>(newExpression,
                                                                                                                    operand.spliceInto(newExpression),
                                                                                                                    variable.spliceInto(newExpression),
                                                                                                                    order.spliceInto(newExpression));
    splicedNode.isRootNode = isRootNode;
    return splicedNode;
  }

  @Override
  public Class<?> type()
  {
    if (closedFormResult != null) return closedFormResult.type();
    return integralNode != null ? integralNode.type() : expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return String.format("I^{%s}\\\\left[%s\\\\right]", order.typeset(), operand.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("I^(%s)%s", order, operand);
  }
}
