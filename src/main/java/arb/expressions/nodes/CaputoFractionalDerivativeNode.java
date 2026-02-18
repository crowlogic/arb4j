package arb.expressions.nodes;

import static arb.expressions.Compiler.scalarType;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Field;
import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.binary.AdditionNode;
import arb.expressions.nodes.binary.DivisionNode;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.expressions.nodes.binary.MultiplicationNode;
import arb.expressions.nodes.binary.SubtractionNode;
import arb.expressions.nodes.unary.GammaFunctionNode;
import arb.functions.Function;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;

/**
 * Caputo fractional derivative: Đ^(α)f(x)
 * 
 * Implements:
 * 
 * <pre>
 * D^α f(x) = (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) * f^(n)(t) dt
 * </pre>
 * 
 * where n = ⌈α⌉.
 * 
 * At construction time, if the exponent variable (α) has bounds set via
 * {@link Field#upperBound()}, n is resolved at compile time by computing
 * ⌈upperBound⌉. For α ∈ (0, 1], n = 1 and only first derivatives are emitted.
 * Higher orders (n > 1) throw {@link UnsupportedOperationException}.
 * 
 * Rather than emitting custom bytecode, this node rewrites itself into an AST
 * composed of existing node types ({@link IntegralNode}, multiplication,
 * division, Γ, power, etc.) and delegates {@link #generate} entirely to the
 * rewritten tree.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CaputoFractionalDerivativeNode<D, R, F extends Function<? extends D, ? extends R>>
                                           extends
                                           Node<D, R, F>
{
  @Override
  public boolean isZero()
  {
    return integralNode != null ? integralNode.isZero() : operand.isZero();
  }

  public static final Logger logger = LoggerFactory.getLogger(CaputoFractionalDerivativeNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  Node<D, R, F>                                          exponent;

  Node<D, R, F>                                          operand;

  /**
   * (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) * f^(n)(t) dt
   */
  Node<D, R, F>                                          integralNode;

  Expression<D, R, F>                                    integralExpression;

  private Context                                        context;

  /**
   * The integer derivative order n = ⌈α⌉ resolved at compile time from bounds.
   */
  private int                                            derivativeOrder;

  private Expression<Real, RealFunction, RealFunctional> integrandExpression;

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         expression.require('^').require('(').resolve(),
         expression.require(')').resolveOperand());
  }

  /**
   * Private constructor for spliceInto — does not parse.
   */
  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression,
                                        Node<D, R, F> power,
                                        Node<D, R, F> operand)
  {
    super(expression);
    this.exponent = power;
    this.operand  = operand;
    this.context  = expression.getContext();

    // Try to compute a closed-form solution (polynomials, etc.)
    // D^α (C t^p) = C * (Γ(p+1)/Γ(p-α+1)) * t^(p-α)
    Node<D, R, F> closedForm = tryComputeClosedForm(operand, expression.getIndependentVariable());
    if (closedForm != null)
    {
      this.integralNode = closedForm;
      return;
    }

    this.derivativeOrder = resolveDerivativeOrder(power, context);

    if (derivativeOrder > 1)
    {
      throw new UnsupportedOperationException(String.format("Caputo fractional derivative with n = ⌈α⌉ = %d > 1 "
                                                            + "is not yet supported. Only α ∈ (0, 1] (n = 1) is currently implemented.",
                                                            derivativeOrder));
    }

    context.registerVariable(Integer.named("n").set(derivativeOrder));
    context.registerFunctionMapping("f",
                                    expression.domainType,
                                    expression.coDomainType,
                                    expression.functionClass);
    Class<?> scalarType = scalarType(expression.domainType);
    if (scalarType == Real.class)
    {
      assert derivativeOrder == 1 : "only n=1 is implemented";

      // n=1: integrand is (x-t)^(-α) * f'(t)
      // since n-α-1 = 1-α-1 = -α and f^(1)(t) = ∂f(t)/∂t
      this.integrandExpression = Function.parse(Real.class,
                                                RealFunction.class,
                                                RealFunctional.class,
                                                "g:x➔t➔(x-t)^(-α)*∂f(t)/∂t",
                                                context,
                                                expression,
                                                false);
    }
    else
    {
      throw new UnsupportedOperationException("todo: support  " + scalarType);
    }

    // x➔∫t➔g(x)(t)dt∈(0,x)/Γ(1-α)
    this.integralExpression = Function.parse(expression.domainType,
                                             expression.coDomainType,
                                             expression.functionClass,
                                             "x➔∫t➔g(x)(t)dt∈(0,x)/Γ(1-α)",
                                             context,
                                             expression);
    this.integralExpression.substitute("f", integralExpression.rootNode);

    this.integralNode = integralExpression.rootNode;
  }

  /**
   * Attempt to find a closed-form fractional derivative for
   * polynomials/monomials. Returns null if no simple closed form is implemented.
   */
  private Node<D, R, F> tryComputeClosedForm(Node<D, R, F> node, VariableNode<D, R, F> variable)
  {
    // Case 0: Constant -> 0
    if (node.isConstant())
    {
      return zero();
    }

    // Case 1: Variable t -> t^(1-α) / Γ(2-α)
    if (node.equals(variable))
    {
      // p = 1
      // Γ(1+1) / Γ(1-α+1) * t^(1-α)
      // = 1 / Γ(2-α) * t^(1-α)
      Node<D, R, F> p         = one();
      Node<D, R, F> numerator = p.add(one()).Γ();
      Node<D, R, F> denomArg  = p.sub(exponent).add(one());
      Node<D, R, F> term      = variable.pow(p.sub(exponent));
      return numerator.div(denomArg.Γ()).mul(term);
    }

    // Case 2: Power t^p -> (Γ(p+1)/Γ(p-α+1)) * t^(p-α)
    if (node instanceof ExponentiationNode<D, R, F> pow)
    {
      if (pow.left.equals(variable) && pow.right.isConstant())
      {
        Node<D, R, F> p         = pow.right;
        // Formula: Γ(p+1) / Γ(p-α+1) * t^(p-α)
        Node<D, R, F> numerator = p.add(one()).Γ();
        Node<D, R, F> denomArg  = p.sub(exponent).add(one());
        Node<D, R, F> term      = variable.pow(p.sub(exponent));
        return numerator.div(denomArg.Γ()).mul(term);
      }
    }

    // Case 3: Multiplication by constant C * f(t) -> C * D^α f(t)
    if (node instanceof MultiplicationNode<D, R, F> mul)
    {
      if (mul.left.isConstant())
      {
        Node<D, R, F> subResult = tryComputeClosedForm(mul.right, variable);
        if (subResult != null)
        {
          return mul.left.mul(subResult);
        }
      }
      else if (mul.right.isConstant())
      {
        Node<D, R, F> subResult = tryComputeClosedForm(mul.left, variable);
        if (subResult != null)
        {
          return mul.right.mul(subResult);
        }
      }
    }

    // Case 4: Division by constant f(t) / C -> (1/C) * D^α f(t)
    if (node instanceof DivisionNode<D, R, F> div)
    {
      if (div.right.isConstant())
      {
        Node<D, R, F> subResult = tryComputeClosedForm(div.left, variable);
        if (subResult != null)
        {
          return subResult.div(div.right);
        }
      }
    }

    // Case 5: Addition f(t) + g(t) -> D^α f(t) + D^α g(t)
    if (node instanceof AdditionNode<D, R, F> add)
    {
      Node<D, R, F> leftRes  = tryComputeClosedForm(add.left, variable);
      Node<D, R, F> rightRes = tryComputeClosedForm(add.right, variable);
      if (leftRes != null && rightRes != null)
      {
        return leftRes.add(rightRes);
      }
    }

    // Case 6: Subtraction f(t) - g(t) -> D^α f(t) - D^α g(t)
    if (node instanceof SubtractionNode<D, R, F> sub)
    {
      Node<D, R, F> leftRes  = tryComputeClosedForm(sub.left, variable);
      Node<D, R, F> rightRes = tryComputeClosedForm(sub.right, variable);
      if (leftRes != null && rightRes != null)
      {
        return leftRes.sub(rightRes);
      }
    }

    return null;
  }

  /**
   * Resolve n = ⌈α⌉ at compile time from the bounds on the exponent variable.
   * 
   * If the exponent is a variable reference whose value in the context has bounds
   * set, compute ⌈upperBound⌉. Otherwise, if the exponent is a literal constant,
   * compute ⌈literal⌉ directly. Otherwise, if the exponent is any constant
   * expression (e.g. a DivisionNode like 1/2), evaluate it as a Fraction, convert
   * to Real, and compute the ceiling.
   * 
   * @param power   the exponent node
   * @param context the expression context
   * @return the integer n = ⌈α⌉
   * @throws IllegalStateException if the derivative order cannot be determined
   */
  private static <D, R, F extends Function<? extends D, ? extends R>>
          int
          resolveDerivativeOrder(Node<D, R, F> power, Context context)
  {
    // Case 1: exponent is a variable reference — check its bounds
    if (power instanceof VariableNode)
    {
      String varName = power.toString();
      Object varObj  = context.variables.get(varName);
      if (varObj instanceof Real αReal)
      {
        if (αReal.isBounded())
        {
          Real ub = αReal.upperBound();
          assert ub != null : "α is bounded but has null upperBound";
          try ( Integer ceil = new Integer())
          {
            ub.ceil(128, ceil);
            int n = ceil.getSignedValue();
            if (logger.isDebugEnabled())
            {
              logger.debug("resolved n = ⌈upperBound(α)⌉ = ⌈{}⌉ = {} from bounds on variable '{}'",
                           ub,
                           n,
                           varName);
            }
            return n;
          }
        }
        else
        {
          throw new IllegalStateException(String.format("Caputo derivative exponent variable '%s' has no bounds set. "
                                                        + "Set bounds via setBounds() so that n = ⌈α⌉ can be resolved at compile time. "
                                                        + "Example: Real.named(\"α\").set(\"0.5\", 128).setBounds(0, false, 1, true)",
                                                        varName));
        }
      }
    }
    else if (power instanceof LiteralConstantNode)
    {
      // Case 2: exponent is a literal constant — compute ceil directly
      String literalStr = power.toString();
      try ( Real literalVal = new Real(literalStr,
                                       128);
            Integer ceil = new Integer())
      {
        literalVal.ceil(128, ceil);
        int n = ceil.getSignedValue();
        if (logger.isDebugEnabled())
        {
          logger.debug("resolved n = ⌈{}⌉ = {} from literal exponent", literalStr, n);
        }
        return n;
      }
    }
    else if (power.isConstant())
    {
      // Case 3: exponent is a constant expression (e.g. DivisionNode 1/2 producing
      // Fraction)
      // Evaluate to a Fraction, convert to Real, then ceil.
      Class<?> powerType = power.type();
      try ( Real realVal = new Real(); Integer ceil = new Integer())
      {
        if (powerType.equals(Fraction.class))
        {
          Fraction frac = power.evaluate(Fraction.class);
          realVal.set(frac);
        }
        else if (powerType.equals(Real.class))
        {
          Real r = power.evaluate(Real.class);
          realVal.set(r);
        }
        else if (powerType.equals(Integer.class))
        {
          Integer intVal = power.evaluate(Integer.class);
          realVal.set(intVal);
        }
        else
        {
          throw new CompilerException("constant exponent of type "
                                      + powerType.getName()
                                      + " is not supported for Caputo derivative order resolution; got: "
                                      + power);
        }
        realVal.ceil(128, ceil);
        int n = ceil.getSignedValue();
        if (logger.isDebugEnabled())
        {
          logger.debug("resolved n = ⌈{}⌉ = {} from constant expression {} of type {}",
                       power,
                       n,
                       power.getClass().getSimpleName(),
                       powerType.getSimpleName());
        }
        return n;
      }
    }
    else
    {
      throw new IllegalStateException("Cannot resolve Caputo derivative order n = ⌈α⌉ at compile time. "
                                      + "The exponent must be either a bounded variable or a constant expression. Got: "
                                      + power.getClass().getSimpleName()
                                      + " = "
                                      + power);
    }
    return java.lang.Integer.MIN_VALUE;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    integralNode.isResult = isResult;
    return integralNode.generate(mv, resultType);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return operand.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    exponent = exponent.substitute(variable, arg);
    operand  = operand.substitute(variable, arg);
    return this;
  }

  @Override
  public char symbol()
  {
    return 'Đ';
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    exponent.accept(t);
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
    return integralNode != null ? integralNode.dependsOn(variable)
                                : exponent.dependsOn(variable) || operand.dependsOn(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // D^1(D^α f) = D^(α+1) f — semigroup property
    return new CaputoFractionalDerivativeNode<>(expression,
                                                exponent.add(expression.newLiteralConstant("1")),
                                                operand);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(exponent, operand);
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // ∫ D^α f dx = D^(α-1) f — fractional integration is the inverse
    return new CaputoFractionalDerivativeNode<>(expression,
                                                exponent.sub(expression.newLiteralConstant("1")),
                                                operand);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new CaputoFractionalDerivativeNode<>(newExpression,
                                                exponent.spliceInto(newExpression),
                                                operand.spliceInto(newExpression));
  }

  @Override
  public Class<?> type()
  {
    return integralNode != null ? integralNode.type() : expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return String.format("{}^{C}D^{%s}\\\\left[%s\\\\right]",
                         exponent.typeset(),
                         operand.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("Đ^(%s)%s", exponent, operand);
  }
}